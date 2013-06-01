# encoding: utf-8

module GithubCLI
  class Tree < API

    class << self

      def get(user, repo, sha, params, options)
        output options do
          github_api(options).git_data.trees.get user, repo, sha, params
        end
      end

      def create(user, repo, params, options)
        output options do
          github_api(options).git_data.trees.create user, repo, params
        end
      end
    end

  end # Repository
end # GithubCLI
