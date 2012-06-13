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
          @response.each_with_index do |item, indx|
            GithubCLI.ui.confirm "##{indx + 1}"
            render_vertical item
            Terminal.newline
          end
        when Hash
          render_vertical @response
        else
          Terminal.line "#{@response}\n"
        end
      end

      def render_vertical(item)
        output = GithubCLI::Util.flatten_hash(item.to_hash)
        GithubCLI.ui.print_table(
          output.keys.zip(GithubCLI::Util.convert_values(output.values))
        )
      end

      def render_horizontal
      end

    end # Table
  end # Formatters
end # GithubCLI
