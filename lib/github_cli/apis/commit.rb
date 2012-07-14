# encoding: utf-8

module GithubCLI
  class Commit < API

    class << self

      def get(user, repo, sha, params, format)
        output format do
          github_api.git_data.commits.get user, repo, sha, params
        end
      end

      def create(user, repo, params, format)
        output format do
          github_api.git_data.commits.create user, repo, params
        end
      end
    end

  end # Commit
end # GithubCLI
