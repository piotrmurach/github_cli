# encoding: utf-8

module GithubCLI
  class Blob < API

    class << self

      def get(user, repo, sha, params)
        github_api.git_data.blobs.get user, repo, params
      end

      def create(user, repo, params)
        github_api.git_data.blobs.create user, repo, params
      end
    end

  end # Blob
end # GithubCLI
