# frozen_string_literal: true

module GithubCLI
  module Formatters
    class Raw

      attr_reader :response

      def initialize(response)
        @response = response
      end

      def format
        response.to_h
      end
    end # Raw
  end # Formatters
end # GithubCLI
