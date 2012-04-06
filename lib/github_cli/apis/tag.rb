# encoding: utf-8

module GithubCLI
  class Tag < API

    class << self

      def get(user, repo, sha, params)
        github_api.repos.get_tag user, repo, params
      end

      def create(user, repo, params)
        github_api.repos.create_tag user, repo, params
      end
    end

  end # Tag
end # GithubCLI
