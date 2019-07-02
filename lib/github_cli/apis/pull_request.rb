# frozen_string_literal: true

require_relative '../api'

module GithubCLI
  class PullRequest
    extend API

    def self.list(user, repo, params, options)
      output options do
        github_api(options).pull_requests.list user, repo, params
      end
    end

    def self.get(user, repo, number, params, options)
      output options do
        github_api(options).pull_requests.get user, repo, number, params
      end
    end

    def self.create(user, repo, params, options)
      output options do
        github_api(options).pull_requests.create user, repo, params
      end
    end

    def self.update(user, repo, number, params, options)
      output options do
        github_api(options).pull_requests.update user, repo, number, params
      end
    end

    def self.commits(user, repo, number, params, options)
      output options do
        github_api(options).pull_requests.commits user, repo, number, params
      end
    end

    def self.files(user, repo, number, params, options)
      output options do
        github_api(options).pull_requests.files user, repo, number, params
      end
    end

    def self.merged(user, repo, number, params, options)
      output options do
        github_api(options).pull_requests.merged? user, repo, number, params
      end
    end

    def self.merge(user, repo, number, params, options)
      output options do
        github_api(options).pull_requests.merge user, repo, number, params
      end
    end
  end # PullRequest
end # GithubCLI
