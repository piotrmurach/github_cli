# frozen_string_literal: true

require_relative "../api"

module GithubCLI
  class Status
    extend API

    def self.all(user, repo, sha, params, options)
      output options do
        github_api(options).repos.statuses.list(user, repo, sha, params)
      end
    end

    def self.create(user, repo, sha, params, options)
      output options do
        github_api(options).repos.statuses.create(user, repo, sha, params)
      end
    end
  end # Status
end # GithubCLI
