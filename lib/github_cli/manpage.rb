# frozen_string_literal: true

require 'tty-prompt'
require 'tty-which'

module GithubCLI
  module Manpage
    extend self

    def base_root
      File.dirname(__FILE__)
    end

    # Full path to manual directory
    #
    # @return [String]
    #
    # @api private
    def man_dir(path = nil)
      if @man_dir.nil? || path
        man_path = path || File.expand_path('../man', __FILE__)

        if File.directory?(man_path)
          @man_dir = man_path
        else
          fail "Manuals directory `#{man_path}` does not exist"
        end
      end
      @man_dir
    end

    # Paths to manpages included in this library
    #
    # @api private
    def manpages(name = nil, section = nil)
      Dir.entries(man_dir).select do |file|
        file =~ /(.+)#{name}\.#{section || '\d'}$/
      end
    end

    # Check if manual exists for a command
    #
    # @param [String] command
    #   the command name
    #
    # @api public
    def manpage?(name, section = nil)
      return false if name.nil?

      manpages(name, section).any?
    end

    # The groff command with extra arguments to turn
    # roff into terminal output
    #
    # @api private
    def groff
      "groff -Wall -mtty-char -mandoc -Tascii"
    end

    # Check if groff is installed on the system
    # @api private
    def groff?
      TTY::Which.exist?('groff')
    end

    # Check if man is installed on the system
    def man?
      TTY::Which.exist?('man')
    end

    # Read manual page
    #
    # @api public
    def read(name, section = nil)
      return if name.nil?
      paths = manpages(name)
      return if paths.empty?

      if paths.size == 1
        manpath = paths[0]
      elsif paths.size > 1
        prompt = TTY::Prompt.new
        manpath = prompt.select("Choose manual to view?", paths)
      end

      if manpath
        run(manpath)
      else
        abort("No manuals found for #{name}")
      end
    end

    def available_command
      if groff?
        groff
      elsif man?
        'man'
      else
        nil
      end
    end

    def run(manpath)
      fullpath = File.join(man_dir, manpath)
      if !(cmd = available_command).nil?
        system("#{cmd} #{fullpath} | #{Pager.pager_command}")
      else
        system("#{Pager.pager_command} #{fullpath}.txt")
      end
    end
  end # Manpage
end # GithubCLI
