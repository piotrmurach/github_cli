# frozen_string_literal: true

require_relative '../api'

module GithubCLI
  class Repository
    extend API

    def self.all(params, options)
      args = options[:every] ? ['every', params] : [params]
      output options do
        github_api(options).repos.list *args
      end
    end

    def self.get(user, repo, params, options)
      output options do
        github_api(options).repos.get user, repo, params
      end
    end

    def self.create(params, options)
      output options do
        github_api(options).repos.create params
      end
    end

    def self.edit(user, repo, params, options)
      output options do
        github_api(options).repos.edit user, repo, params
      end
    end

    def self.delete(user, repo, params, options)
      output options do
        github_api(options).repos.delete user, repo, params
      end
    end

    def self.branches(user, repo, params, options)
      output options do
        github_api(options).repos.branches user, repo, params
      end
    end

    def self.branch(user, repo, name, params, options)
      output options do
        github_api(options).repos.branch user, repo, name, params
      end
    end

    def self.contributors(user, repo, params, options)
      output options do
        github_api(options).repos.contributors user, repo, params
      end
    end

    def self.languages(user, repo, params, options)
      output options do
        github_api(options).repos.languages user, repo, params
      end
    end

    def self.tags(user, repo, params, options)
      output options do
        github_api.repos.tags user, repo, params
      end
    end

    def self.teams(user, repo, params, options)
      output options do
        github_api(options).repos.teams user, repo, params
      end
    end
  end # Repository
end # GithubCLI
