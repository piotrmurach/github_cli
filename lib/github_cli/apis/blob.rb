# frozen_string_literal: true

module GithubCLI
  class Blob
    extend API

    def self.get(user, repo, sha, params, options)
      output options do
        github_api(options).git_data.blobs.get user, repo, sha, params
      end
    end

    def self.create(user, repo, params, options)
      output options do
        github_api(options).git_data.blobs.create user, repo, params
      end
    end
  end # Blob
end # GithubCLI
