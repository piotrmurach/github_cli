# frozen_string_literal: true

require_relative '../api'

module GithubCLI
  class Fork
    extend API

    def self.all(user, repo, params, options)
      output options do
        github_api(options).repos.forks.list user, repo, params
      end
    end

    def self.create(user, repo, params, options)
      output options do
        github_api(options).repos.forks.create user, repo, params
      end
    end
  end # Fork
end # GithubCLI
