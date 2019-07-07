# frozen_string_literal: true

require_relative '../util'

module GithubCLI
  module Formatters
    class CSV

      attr_reader :response

      def initialize(response)
        @response = response
      end

      def format
        output = []

        if response.respond_to?(:to_ary)
          output << render_headers(response.first)
          response.each_with_index do |item, indx|
            output << "%d,%s" % [indx, render_line(item)]
            output << "\n"
          end
        elsif response.respond_to?(:keys)
          output << render_headers(response)
          output << "%d,%s" % [1, render_line(item)]
        else
          output << "#{response}\n"
        end

        output.join
      end

      def render_headers(header)
        if header.respond_to?(:to_hash)
          data = GithubCLI::Util.flatten_hash(header.to_hash)
          "Index,#{data.keys.join(',')}\n"
        elsif header.respond_to?(:to_ary)
          "Index,#{header.join(',')}\n"
        end
      end

      def render_line(item)
        if item.respond_to?(:to_hash)
          data = GithubCLI::Util.flatten_hash(item.to_hash)
          data.values.join(',')
        elsif item.respond_to?(:to_ary)
          item.join(',')
        end
      end
    end # CSV
  end # Formatters
end # GithubCLI
