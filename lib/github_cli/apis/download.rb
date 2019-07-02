# frozen_string_literal: true

require_relative '../api'

module GithubCLI
  class Download
    extend API

    def self.all(user, repo, params, options)
      output options do
        github_api(options).repos.downloads.list user, repo, params
      end
    end

    def self.get(user, repo, id, params, options)
      output options do
        github_api(options).repos.downloads.get user, repo, id, params
      end
    end

    def self.create(user, repo, params, options)
      output options do
        github_api(options).repos.downloads.create user, repo, params
      end
    end

    def self.upload(resource, filename, options)
      output options do
        github_api(options).repos.downloads.upload resource, filename
      end
    end

    def self.delete(user, repo, id, params, options)
      output options do
        github_api(options).repos.downloads.delete user, repo, id, params
      end
    end
  end # Download
end # GithubCLI
