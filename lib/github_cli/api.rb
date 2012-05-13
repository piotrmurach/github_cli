# encoding: utf-8

module GithubCLI
  # The API class is the main entry point for creating GithubCLI APIs.
  class API
    class ApiError < StandardError; end

    @@api = nil

    def self.github_api
      if @@api
        @@api
      else
        @@api = Github.new
        @@api.oauth_token = GithubCLI.config['oauth_token']
        @@api.basic_auth  = GithubCLI.config['basic_auth']
        @@api
      end
    end

    def self.configure_api
    end

    def self.output(format=:table, &block)
      response =  block.call
      case response
      when Array
        response.each do |item|
          GithubCLI::Terminal.render_output item, :format => format
          puts
        end
      else
        GithubCLI::Terminal.render_output response, :format => format
      end
    end

    class All
      def initialize(params)
        puts Github::Repos.new.all params
      end
    end

  end # API
end # GithubCLI
