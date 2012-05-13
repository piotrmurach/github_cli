# encoding: utf-8

module GithubCLI
  class Tree < API

    class << self

      def get(user, repo, sha, params, format)
        output format do
          github_api.git_data.trees.get user, repo, sha, params
        end
      end

      def create(user, repo, params, format)
        output format do
          github_api.git_data.trees.create user, repo, params
        end
      end
    end

  end # Repository
end # GithubCLI
