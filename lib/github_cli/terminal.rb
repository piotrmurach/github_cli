# encoding: utf-8

module GithubCLI
  # Responsible for display and size detection.
  class Terminal
    DEFAULT_WIDTH = 120
    DEFAULT_HEIGHT = 40

    class << self
      attr_accessor :size

      def render_output(response, options={})
        render_status response
        pager.page
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

      def pager
        @pager ||= Pager.new
      end

      # Render status code
      def render_status(response)
        puts "Response Status: #{response.status}"
        puts
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

      def print_program_name
        GithubCLI.ui.info <<-TEXT

  #{GithubCLI.program_name}

        TEXT
      end
    end

  end # Terminal
end # GithubCLI
