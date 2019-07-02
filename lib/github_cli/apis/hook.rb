# frozen_string_literal: true

require_relative '../api'

module GithubCLI
  class Hook
    extend API

    def self.all(user, repo, params, options)
      output options do
        github_api(options).repos.hooks.list user, repo, params
      end
    end

    def self.get(user, repo, id, params, options)
      output options do
        github_api(options).repos.hooks.get user, repo, id, params
      end
    end

    def self.create(user, repo, params, options)
      output options do
        github_api(options).repos.hooks.create user, repo, params
      end
    end

    def self.edit(user, repo, id, params, options)
      output options do
        github_api(options).repos.hooks.edit user, repo, id, params
      end
    end

    def self.test(user, repo, id, params, options)
      output options do
        github_api(options).repos.hooks.test user, repo, id, params
      end
    end

    def self.delete(user, repo, id, params, options)
      output options do
        github_api(options).repos.hooks.delete user, repo, id, params
      end
    end
  end # Hook
end # GithubCLI
