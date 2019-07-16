# frozen_string_literal: true

require_relative "../api"

module GithubCLI
  class Release
    extend API

    def self.all(owner, repo, params, options)
      output options do
        github_api(options).repos.releases.list(owner, repo, params)
      end
    end

    def self.get(owner, repo, id, params, options)
      output options do
        github_api(options).repos.releases.get(owner, repo, id, params)
      end
    end

    def self.create(owner, repo, params, options)
      output options do
        github_api(options).repos.releases.create(owner, repo, params)
      end
    end

    def self.edit(owner, repo, id, params, options)
      output options do
        github_api(options).repos.releases.create(owner, repo, id, params)
      end
    end

    def self.delete(owner, repo, id, params, options)
      output options do
        github_api(options).repos.releases.delete(owner, repo, id, params)
      end
    end

    def self.latest(owner, repo, params, options)
      output options do
        github_api(options).repos.releases.latest(owner, repo, params)
      end
    end
  end # Release
end # GithubCLI
