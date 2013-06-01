# encoding: utf-8

module GithubCLI

  # The API class is the main entry point for creating GithubCLI APIs.
  class API

    class << self

      # Access or initialize Github API client
      #
      # @api public
      def github_api(options={})
        @github_api ||= begin
          @github_api = configure(options)
        end
      end

      # this could become a command such as configure that gets class options
      #
      # @api public
      def configure(options={})
        api    = Github.new
        config = GithubCLI.config.data

        api.oauth_token = config['user.token'] if config['user.token']

        api.basic_auth  = set_basic_auth(config, options)

        api.endpoint    = config['core.endpoint'] if config['core.endpoint']

        if ENV['TEST_HOST']
          api.endpoint = 'http://' + ENV['TEST_HOST']
        end
        api
      end

      # Set user basic authentication
      #
      # @api public
      def set_basic_auth(config, options)
        if options['login'] && options['password']
           "#{options['login']}:#{options['password']}"
        elsif config['user.login'] && config['user.password']
          "#{config['user.login']}:#{config['user.password']}"
        else
          nil
        end
      end

      # Procoess response and output to shell
      #
      # @param [Hash] options the options to format the output
      # @option options [String] :format
      #   The format type
      # @option options [String] :quiet
      #   The flag for reducing the output
      #
      # @api public
      def output(options, &block)
        format = options.fetch(:format) { :table }
        quiet  = options.fetch(:quiet)  { false }

        GithubCLI.on_error do
          response  = block.call
          if response.respond_to?(:body)
            formatter = Formatter.new response, :format => format, :quiet => quiet
            formatter.render_output
          else
            Terminal.line response
          end
          response
        end
      end

    end

  end # API
end # GithubCLI
