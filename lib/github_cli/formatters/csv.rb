# frozen_string_literal: true

require_relative '../terminal'
require_relative '../util'

module GithubCLI
  module Formatters
    class CSV

      attr_reader :response

      def initialize(response)
        @response = response
      end

      def format
        if response.respond_to?(:to_ary)
          render_headers(response.first)
          response.each_with_index do |item, indx|
            render_line(indx, item)
            Terminal.newline
          end
        elsif response.respond_to?(:keys)
          render_headers(response)
          render_line(1, response)
        else
          Terminal.line "#{response}\n"
        end
      end

      def render_headers(header)
        output = header
        if header.respond_to?(:to_hash)
          output = GithubCLI::Util.flatten_hash(header.to_hash)
          output = "Index,#{output.keys.join(',')}\n"
        elsif header.respond_to?(:to_ary)
          output = "Index,#{header.join(',')}\n"
        end

        Terminal.line output
      end

      def render_line(index, item)
        output = item
        if item.respond_to?(:to_hash)
          output = GithubCLI::Util.flatten_hash(item.to_hash)
          output = output.values.join(',')
        elsif item.respond_to?(:to_ary)
          output = item.join(',')
        end

        $stdout.printf "%d,%s", index, output
      end
    end # CSV
  end # Formatters
end # GithubCLI
