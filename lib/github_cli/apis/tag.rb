# encoding: utf-8

module GithubCLI
  class Tag < API

    class << self

      def get(user, repo, sha, params)
        github_api.git_data.tags.get user, repo, params
      end

      def create(user, repo, params)
        github_api.git_data.tags.create user, repo, params
      end
    end

  end # Tag
end # GithubCLI
