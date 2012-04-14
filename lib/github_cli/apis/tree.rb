# encoding: utf-8

module GithubCLI
  class Tree < API

    class << self

      def get(user, repo, sha, params)
        github_api.repos.get_tree user, repo, params
      end

      def create(user, repo, params)
        github_api.repos.create_tree user, repo, params
      end
    end

  end # Repository
end # GithubCLI
