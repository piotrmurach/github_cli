# frozen_string_literal: true

require 'github_api'

require_relative 'formatter'

module GithubCLI
  # The API class is the main entry point for creating GithubCLI APIs.
  module API
    # Access or initialize Github API client
    #
    # @api public
    def github_api(options = {})
      @github_api ||= configure(options)
    end
    module_function :github_api

    # Configures api options if provided in the configuration file
    #
    # @api public
    def configure(options = {})
      api    = Github.new
      config = GithubCLI.config

      ssl      = config.fetch('core.ssl')
      adapter  = config.fetch('core.adapter')
      token    = config.fetch('user.token')
      site     = config.fetch('core.site')
      endpoint = config.fetch('core.endpoint')

      api.basic_auth  = set_basic_auth(config, options)
      api.ssl         = ssl if ssl && ssl != ''
      api.adapter     = adapter.to_sym if adapter && adapter != ''
      api.oauth_token = token if token && token != ''
      api.site        = site if site && site != ''
      api.endpoint    = endpoint if endpoint && endpoint != ''
      api.auto_pagination = options['auto_pagination'] || config.fetch('core.auto_pagination')

      if (test_env = ENV['TEST_HOST'])
        api.endpoint = 'http://' + test_env
      end
      api
    end
    module_function :configure

    # Set user basic authentication
    #
    # @api public
    def set_basic_auth(config, options)
      if (login = options['login']) && (password = options['password'])
        "#{login}:#{password}"
      elsif (login = config.fetch('user.login') && (password = config.fetch('user.password')))
        "#{login}:#{password}"
      else
        nil
      end
    end
    module_function :set_basic_auth

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
      config = GithubCLI.config
      format = options.fetch(:format) {
        options["format"] || config.fetch('core.format') || :table }
      quiet  = options.fetch(:quiet) { config.fetch('core.quiet') }

      GithubCLI.on_error do
        response  = block.call
        if response.respond_to?(:body)
          formatter = Formatter.new(response, format: format, quiet: quiet)
          formatter.render_output
        else
          GithubCLI.ui.info "#{response}\n"
        end
        response
      end
    end
    module_function :output
  end # API
end # GithubCLI
