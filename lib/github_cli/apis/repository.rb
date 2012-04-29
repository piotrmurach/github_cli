# encoding: utf-8

module GithubCLI
  class Repository < API

    class << self

      def all(params)
        github_api.repos.list params
      end

      def get(user, repo, params)
        github_api.repos.get user, repo, params
      end

      def create(params)
        github_api.repos.create user, repo, params
      end

      def edit(user, repo, params)
        github_api.repos.edit user, repo, params
      end

      def branches(user, repo, params)
        github_api.repos.branches user, repo, params
      end

      def contributors(user, repo, params)
        github_api.repos.contributors user, repo, params
      end

      def languages(user, repo, params)
        github_api.repos.languages user, repo, params
      end

      def tags(user, repo, params)
        github_api.repos.tags user, repo, params
      end

      def teams(user, repo, params)
        github_api.repos.teams user, repo, params
      end

    end

  end # Repository
end # GithubCLI
