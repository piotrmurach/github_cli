# encoding: utf-8

module GithubCLI
  class Fork < API

    class << self

      def all(user, repo, params, format)
        output format do
          github_api.repos.forks.list user, repo, params
        end
      end

      def create(user, repo, params, format)
        output format do
          github_api.repos.forks.create user, repo, params
        end
      end
    end

  end # Fork
end # GithubCLI
