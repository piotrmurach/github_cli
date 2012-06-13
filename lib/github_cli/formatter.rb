# encoding: utf-8

module GithubCLI
  # This is the main entry point for formatting output.
  # It delegates to other objects like Formatter::Table
  # to perform actual rendering.
  class Formatter
    attr_reader :response, :format

    def initialize(response, options={})
      @response = response
      @format   = options[:format]
    end

    def render_output
      render_status
      Terminal.paged_output
      determine_output_formatter
    end

    def determine_output_formatter
      case format.to_s
      when 'table'
        formatter = Formatters::Table.new(response)
        formatter.format
      when 'csv'
        formatter = Formatters::CSV.new(response)
        formatter.format
      when 'json'
        'json output'
      else
        raise UnknownFormatError, format
      end
    end

    # Render status code
    def render_status
      if response.respond_to? :status
        Terminal.line "Response Status: #{response.status}\n"
        Terminal.newline
      end
    end

  end # Formatter
end # GithubCLi
