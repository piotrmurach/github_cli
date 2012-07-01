module GithubCLI
  # Responsible for manipulating commands usage string.
  class Command
    class Usage

      DEFAULT_INDENT = 11

      # Returns command
      attr_reader :command

      # Returns command flags
      attr_reader :flags

      # Initializes an usage instance
      #
      def initialize(command, flags, options={})
        @command = Command.command_to_show(command)
        @flags   = flags
      end

      # Options
      # indent - Indent the line with by indent value. Assumes that the first
      #          the first line is already filled in with other padding.
      # length - Line length, otherwise the default terminal width is assumed.
      def format_usage(options={})
        synopsis = "#{flags} #{command} <subcommand> [<args>]"
        indent = options[:indent] || DEFAULT_INDENT
        padding = sprintf("%#{indent}s",'')
        length  = options[:length] || Terminal.default_width
        wrap synopsis, length, indent, padding
      end

      def tokenize_text(text)
        text.split(/\s+/).map(&:chomp).reject(&:empty?)
      end

      # Wraps text at the given line length using given indent value.
      #
      def wrap(text, length, indent=0, padding=0)
        if text.length > length - indent
          paragraphs = []
          line = ''
          tokenize_text(text).each do |fragment|
            if line.length < length - indent
              line << fragment + ' '
            else
              paragraphs << line
              line = padding + fragment + ' '
            end
          end
          paragraphs << line
          text = paragraphs.join("\n")
        end
        text
      end

      # Returns a concise string representation of Completion instance
      #
      def inspect
        "#<#{self.class.inspect} @command=#{command.inspect} @flags=#{flags.inspect}"
      end

    end # Usage
  end # Command
end # GithubCLI
