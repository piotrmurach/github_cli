# frozen_string_literal: true

require_relative '../util'

module GithubCLI
  # Provides command completion/suggestion for mistyped command or subcommand.
  class Command
    class Completion
      include GithubCLI::Util

      # Command to be looked up.
      attr_accessor :command

      def initialize(command)
        @command = command
      end

      DEFAULT_INDENT = 8

      # If there is more than one possible alternative, show all of them.
      #
      def find_command_possibilities
        max_length = 1
        commands = Command.all.select do |cmd|
          prefix = Util.longest_common_prefix(command, cmd.namespace)
          if !prefix.empty? && (prefix.length >= max_length)
            max_length = prefix.length
            cmd
          end
        end
        commands.map(&:namespace).uniq.sort
      end

      # Options
      # indent - Indent suggested commands by specified value.
      #
      def format_command_possibilities(options={})
        possibilities = find_command_possibilities
        string = ""
        indent = options[:indent] || DEFAULT_INDENT
        if possibilities.size >= 1
          string << "\n\nDid you mean this?\n"
          possibilities.each do |possibility|
            string << " " * indent + "#{possibility}\n"
          end
        end
        string
      end

      # Returns a concise string representation of Completion instance
      #
      def inspect
        "#<#{self.class.inspect} @command=#{command.inspect}"
      end

    end # Completion
  end # Command
end # GithubCLI
