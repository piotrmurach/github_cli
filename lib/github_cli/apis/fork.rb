# encoding: utf-8

module GithubCLI
  class Fork < API

    class << self

      def all(user, repo, params)
        github_api.repos.forks user, repo, params
      end

      def create(user, repo, params)
        github_api.repos.create_fork user, repo, params
      end
    end

  end # Fork
end # GithubCLI
