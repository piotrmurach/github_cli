# frozen_string_literal: true

require 'pp'
require 'tty-screen'

require_relative 'command'

module GithubCLI
  # Responsible for display and size detection.
  class Terminal

    DEFAULT_WIDTH  = 80

    class << self
      def default_width
        DEFAULT_WIDTH
      end

      def width
        TTY::Screen.width
      end

      def line(text)
        $stdout.print text
      end

      def newline
        $stdout.print "\n"
        nil
      end

      def find_commands(pattern=nil)
        Command.all.select do |cmd|
          cmd if pattern && cmd.namespace =~ pattern
        end
      end

      def build_command_output(cmd, indent=3)
        prefix = " " * indent
        if cmd.namespace.empty?
          ["#{prefix + cmd.usage}", cmd.desc]
        else
          ["#{prefix + cmd.namespace} #{cmd.usage}", cmd.desc]
        end
      end

      def print_commands(pattern=nil)
        Terminal.line "\n" + GithubCLI.program_name + "\n\n"

        commands = find_commands(pattern).map { |cmd| build_command_output cmd }

        if !commands.empty?
          GithubCLI.ui.info "Commands:"
          GithubCLI.ui.print_table commands, :truncate => true
        else
          print_command_not_found pattern.to_s.gsub(/\W|/, '')[3..-1]
        end
      end

      def print_command_not_found(cmd)
        exec_name = GithubCLI.executable_name
        GithubCLI.ui.info "#{exec_name}: '#{cmd}' is not a #{exec_name} command. See '#{exec_name} --help'."
      end

      def print_usage(flags, command)
        GithubCLI.ui.info <<-TEXT

#{GithubCLI.program_name}

Usage: #{GithubCLI.executable_name} #{GithubCLI::Command::Usage.new(command, flags).format_usage }

        TEXT
      end

      def print_config(config, pattern: nil)
        GithubCLI.ui.info "Configuration options:\n"
        pp config.to_h
      end
    end
  end # Terminal
end # GithubCLI
