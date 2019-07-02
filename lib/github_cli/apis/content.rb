# frozen_string_literal: true

require_relative '../api'

module GithubCLI
  class Content
    extend API

    def self.get(user, repo, path, params, options)
      output options do
        github_api(options).repos.contents.get user, repo, path, params
      end
    end

    def self.create(user, repo, path, params, options)
      output options do
        github_api(options).repos.contents.create user, repo, path, params
      end
    end

    def self.readme(user, repo, params, options)
      output options do
        github_api(options).repos.contents.readme user, repo, params
      end
    end

    def self.archive(user, repo, params, options)
      output options do
        github_api(options).repos.contents.archive user, repo, params
      end
    end
  end # Content
end # GithubCLI
