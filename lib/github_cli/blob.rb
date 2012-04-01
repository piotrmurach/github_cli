# encoding: utf-8

module GithubCLI
  class Blob < API

    class << self

      def get(user, repo, sha, params)
        github_api.repos.get_blob user, repo, params
      end

      def create(user, repo, params)
        github_api.repos.create_blob user, repo, params
      end
    end

  end # Repository
end # GithubCLI
