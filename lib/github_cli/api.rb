# encoding: utf-8

module GithubCLI

  # The API class is the main entry point for creating GithubCLI APIs.
  class API

    @@api = nil

    class << self

      attr_reader :config

      def github_api
        @@api ||= begin
          @@api = configure_api
        end
      end

      def configure_api
        @@api = Github.new
        config = GithubCLI.config.data

        if config['user.token']
          @@api.oauth_token = config['user.token']
        end
        if config['user.login'] && config['user.password']
          @@api.basic_auth = "#{config['user.login']}:#{config['user.password']}"
        end
        @@api.endpoint = GithubCLI.config['core.endpoint'] || @@api.endpoint
        if ENV['TEST_HOST']
          @@api.endpoint = 'http://' + ENV['TEST_HOST']
        end
        @@api
      end

      def output(format=:table, &block)
        GithubCLI.on_error do
          response  = block.call
          if response.respond_to?(:body)
            formatter = Formatter.new response, :format => format
            formatter.render_output
          else
            response
          end
        end
      end

    end

    class All
      def initialize(params)
        puts Github::Repos.new.all params
      end
    end

  end # API
end # GithubCLI
