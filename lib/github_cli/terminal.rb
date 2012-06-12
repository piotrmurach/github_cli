# encoding: utf-8

module GithubCLI
  # Responsible for display and size detection.
  class Terminal
    DEFAULT_WIDTH  = 80
    DEFAULT_HEIGHT = 40

    class << self
      def default_width
        DEFAULT_WIDTH
      end

      def width
        GithubCLI.ui.terminal_width
      end

      def new_line
        $stdout.print "\n"
      end

      def render_output(response, options={})
        render_status response
        paged_output
        case options[:format].to_s
        when 'table'
          formatter = Formatters::Table.new(response)
          formatter.format
        when 'csv'
          formatter = Formatters::CSV.new(response)
          formatter.format
        when 'json'
          'json output'
        else
          raise UnknownFormatError, options[:format]
        end
      end

      def paged_output
        if Pager.enabled?
          pager.page
          true
        else
          false
        end
      end

      def pager
        @pager ||= Pager.new
      end

      # Render status code
      def render_status(response)
        if response.respond_to? :status
          puts "Response Status: #{response.status}"
          puts
        end
      end

      def render_header
      end

      def print_commands(pattern=nil)
        GithubCLI.ui.info "Commands:"

        commands = Command.all.select do |cmd|
          cmd if pattern && cmd.namespace =~ pattern
        end.map do |cmd|
          build_command cmd
        end

        if !commands.empty?
          GithubCLI.ui.print_table commands, :truncate => true
        else
          print_command_not_found pattern.to_s.gsub(/\W|/, '')[3..-1]
        end
      end

      def build_command(cmd, indent=3)
        prefix = " " * indent
        if cmd.namespace.empty?
          ["#{prefix + cmd.usage}", cmd.desc]
        else
          ["#{prefix + cmd.namespace} #{cmd.usage}", cmd.desc]
        end
      end

      def print_command_not_found(cmd)
        GithubCLI.ui.info "ghc: '#{cmd}' is not a ghc command. See 'ghc --help'."
      end

      def print_usage(flags, command='<command>')
        GithubCLI.ui.info <<-TEXT

#{GithubCLI.program_name}

Usage: ghc #{format_usage(flags, command, :indent => 11)}

        TEXT
      end

      # Options
      # indent - Indent the line with by indent value. Assumes that the first
      #          the first line is already filled in with other padding.
      # length - Line length, otherwise the default terminal width is assumed.
      def format_usage(flags, command, options={})
        synopsis = "#{flags} #{command} <subcommand> [<args>]"
        indent = options[:indent] || 0
        padding = sprintf("%#{indent}s",'')
        wrap synopsis, indent, padding
      end

      # Wraps text at the given line length using given indent value.
      def wrap(text, indent, padding)
        if text.length > default_width - indent
          paragraphs = []
          line = ''
          text.split(/\s+/).map(&:chomp).reject(&:empty?).each do |fragment|
            if line.length < default_width - indent
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

    end

  end # Terminal
end # GithubCLI
