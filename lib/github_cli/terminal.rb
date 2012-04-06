# encoding: utf-8

module GithubCLI
  # Responsible for display and size detection.
  class Terminal
    DEFAULT_WIDTH = 120
    DEFAULT_HEIGHT = 40

    class << self
      attr_accessor :size

      def print_commands(pattern=nil)
        GithubCLI.ui.info 'Commands:'
        Command.all.each do |cmd|
          print_command cmd if pattern && cmd.namespace =~ pattern
        end
      end

      def print_command(cmd, usage_text='usage')
        GithubCLI.ui.info "    ghc #{cmd.namespace} #{cmd.usage}"
      end

      def print_program_name
        GithubCLI.ui.info <<-TEXT

  #{GithubCLI.program_name}

        TEXT
      end
    end

  end # Terminal
end # GithubCLI
