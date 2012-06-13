# encoding: utf-8

module GithubCLI
  # The API class is the main entry point for creating GithubCLI APIs.
  class API

    @@api = nil

    class << self

      def github_api
        @@api ||= begin
          @@api = configure_api
        end
      end

      def configure_api
        @@api = Github.new
        @@api.oauth_token = GithubCLI.config['oauth_token']
        @@api.basic_auth  = GithubCLI.config['basic_auth']
        @@api
      end

      def output(format=:table, &block)
        response =  block.call
        formatter = Formatter.new response, :format => format
        formatter.render_output
      end

    end

    class All
      def initialize(params)
        puts Github::Repos.new.all params
      end
    end

  end # API
end # GithubCLI
