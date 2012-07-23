# encoding: utf-8

module GithubCLI
  module Manpage
    extend self

    MANPAGES = %w[
      gcli-config.1
    ]

    def has?(command)
      yield self if MANPAGES.include? command
    end

    # The groff command with extra arguments to turn
    # roff into terminal output
    def groff
      "groff -Wall -mtty-char -mandoc -Tascii"
    end

    # Check if groff is installed on the system
    def has_groff?
      System.command? 'groff'
    end

    # Check if man is installed on the system
    def has_man?
      System.command? 'man'
    end

    def show(command)
      root = File.expand_path("../man", __FILE__)

      if has_groff?
        system "#{groff} #{root}/#{command} | #{Pager.pager_command}"
      else
        system "#{Pager.pager_command} #{root}/#{command}.txt"
      end
    end

  end # Manpage
end # GithubCLI
