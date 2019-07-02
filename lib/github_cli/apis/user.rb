# frozen_string_literal: true

require_relative '../api'

module GithubCLI
  class User
    extend API

    def self.all(params, options)
      output options do
        github_api(options).users.all params
      end
    end

    def self.get(params, options)
      output options do
        github_api(options).users.get params
      end
    end

    def self.update(params, options)
      output options do
        github_api(options).users.update params
      end
    end
  end # User
end # GithubCLI
