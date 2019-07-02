# frozen_string_literal: true

require_relative '../api'

module GithubCLI
  class Issue
    extend API

    def self.all(arg, params, options)
      output options do
        github_api(options).issues.list arg, params
      end
    end

    def self.get(user, repo, id, params, options)
      output options do
        github_api(options).issues.get user, repo, id, params
      end
    end

    def self.create(user, repo, params, options)
      output options do
        github_api(options).issues.create user, repo, params
      end
    end

    def self.edit(user, repo, id, params, options)
      output options do
        github_api(options).issues.edit user, repo, id, params
      end
    end
  end # Issue
end # GithubCLI
