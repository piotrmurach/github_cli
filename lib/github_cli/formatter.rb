# encoding: utf-8

module GithubCLI
  # This is the main entry point for formatting output.
  # It delegates to other objects like Formatter::Table
  # to perform actual rendering.
  class Formatter

    class << self

      def render_output(response, options={})
        render_status response
        Terminal.paged_output
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

      # Render status code
      def render_status(response)
        if response.respond_to? :status
          Terminal.line "Response Status: #{response.status}\n"
          Terminal.newline
        end
      end

    end

  end # Formatter
end # GithubCLi
