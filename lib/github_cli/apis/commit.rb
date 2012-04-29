# encoding: utf-8

module GithubCLI
  class Commit < API

    class << self

      def get(user, repo, sha, params)
        github_api.git_data.commits.get user, repo, params
      end

      def create(user, repo, params)
        github_api.git_data.commits.create user, repo, params
      end
    end

  end # Commit
end # GithubCLI
