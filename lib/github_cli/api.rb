# encoding: utf-8

module GithubCLI

  # The API class is the main entry point for creating GithubCLI APIs.
  class API

    # Access or initialize Github API client
    #
    # @api public
    def self.github_api(options={})
      @github_api ||= configure(options)
    end

    # Configures api options if provided in the configuration file
    #
    # @api public
    def self.configure(options={})
      api    = Github.new
      config = GithubCLI.config

      api.basic_auth  = set_basic_auth(config, options)
      api.ssl         = config['core.ssl']      if config['core.ssl']
      api.adapter     = config['core.adapter']  if config['core.adapter']
      api.oauth_token = config['user.token']    if config['user.token']
      api.site        = config['core.site']     if config['core.site']
      api.endpoint    = config['core.endpoint'] if config['core.endpoint']
      api.auto_pagination = options['auto_pagination'] || config['core.auto_pagination']

      if (test_env = ENV['TEST_HOST'])
        api.endpoint = 'http://' + test_env
      end
      api
    end

    # Set user basic authentication
    #
    # @api public
    def self.set_basic_auth(config, options)
      if (login = options['login']) && (password = options['password'])
        "#{login}:#{password}"
      elsif (login = config['user.login']) && (password = config['user.password'])
        "#{login}:#{password}"
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
    def self.output(options, &block)
      config = GithubCLI.config
      format = options.fetch(:format) { config['core.format'] }
      quiet  = options.fetch(:quiet)  { config['core.quiet'] }

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

  end # API
end # GithubCLI
