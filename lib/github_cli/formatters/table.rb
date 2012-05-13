# encoding: utf-8

module GithubCLI
  module Formatters
    class Table

      def initialize(response)
        @response = response
      end

      def format
        case @response
        when Array
          @response.each do |item|
            render_vertical item
            $stdout.puts
          end
        else
          render_vertical @response
        end
      end

      def render_vertical(item)
        output = {}
        GithubCLI::Util.flatten_hash(item.to_hash, output)
        GithubCLI.ui.print_table(
          output.keys.zip(GithubCLI::Util.convert_values(output.values))
        )
      end

      def render_horizontal
      end

    end # Table
  end # Formatters
end # GithubCLI
