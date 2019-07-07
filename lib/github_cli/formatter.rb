# frozen_string_literal: true

require 'tty-pager'

require_relative 'errors'
require_relative 'formatters/csv'
require_relative 'formatters/table'

module GithubCLI
  # This is the main entry point for formatting output.
  # It delegates to other objects like Formatter::Table
  # to perform actual rendering.
  class Formatter
    attr_reader :response, :format, :message, :quiet

    def initialize(response, options={})
      @response = response
      @message  = options[:message]
      @format   = options[:format]
      @quiet    = options[:quiet]
      @pager    = TTY::Pager.new
    end

    def render_output
      Terminal.line render_status
      return if quiet
      formatter = determine_output_formatter
      Terminal.line formatter.format # TODO: page when too much content
      Terminal.line message if message
    end

    # @api private
    def determine_output_formatter
      if !(response.body && !response.body.empty?)
        return
      end

      case format.to_s
      when 'table', /table:v.*/, /table:h.*/
        Formatters::Table.new(response.body, transform: format.to_s.split(':').last)
      when 'csv'
        Formatters::CSV.new(response)
      when 'json'
        'json output'
      else
        raise UnknownFormatError, format
      end
    end

    # Render status code
    def render_status
      if response.respond_to? :status
        "Response Status: #{response.status}\n"
      end
    end
  end # Formatter
end # GithubCLi
