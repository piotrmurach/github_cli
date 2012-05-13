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

    # TODO
    # Will need to detect if all attribute names fit inside the terminal
    # width, if not then rotate the table to display on each row. Try to
    # create view like hirb.
    # Finally all this needs to be moved to terminal class.

    # output can take first parameter of type, whether :show, :table, :status
    # status - would be a format to show only response from the request
    # table  - used for listing more than one returned element
    # show - shows details for a single resource

    def self.output(type=:show, &block)
      response =  block.call
      case response
      when Array
        response.each do |item|
          GithubCLI::Terminal.render_output item, :horizontal => true
          puts
        end
      else
        GithubCLI::Terminal.render_output response, :vertical => true
      end
    end

    class All
      def initialize(params)
        puts Github::Repos.new.all params
      end
    end

  end # API
end # GithubCLI
