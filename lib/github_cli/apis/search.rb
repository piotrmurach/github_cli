# frozen_string_literal: true

require_relative '../api'

module GithubCLI
  class Search
    extend API

    def self.issue(params, options)
      output options do
        github_api(options).search.issues(params)
      end
    end

    def self.repo(params, options)
      output options do
        github_api(options).search.repos(params)
      end
    end

    def self.user(params, options)
      output options do
        github_api(options).search.users(params)
      end
    end

    def self.code(params, options)
      output options do
        github_api(options).search.code(params)
      end
    end
  end # Search
end # GithubCLI
