# encoding: utf-8

module GithubCLI
  class Commit < API

    class << self

      def get(user, repo, sha, params)
        github_api.git_data.commit user, repo, params
      end

      def create(user, repo, params)
        github_api.repos.create_commit user, repo, params
      end
    end

  end # Commit
end # GithubCLI
