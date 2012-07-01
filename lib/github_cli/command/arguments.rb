# encoding: utf-8

module GithubCLI
  class Command
    # Makes it easy to parse required and options arguments.
    class Arguments

      SEPARATOR = '/'

      attr_reader :args

      def initialize(args)
        @args = args
      end

      # Returns seperated arguments
      def parse
        required, non_required = nil, nil

        if !args.empty?
          required = args
          non_required, required = required.split('/', 2) if required.index('/')
        else
          raise RequiredArgumentMissingError, "No value provided for required argument"
        end
        [non_required, required]
      end

      # Returns a concise string representation of Arguments instance
      #
      def inspect
        "#<#{self.class.inspect} @args=#{args.inspect}"
      end

    end # Arguments
  end # Command
end # GithubCLI
