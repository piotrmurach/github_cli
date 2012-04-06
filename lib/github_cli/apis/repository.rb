# encoding: utf-8

module GithubCLI
  class Repository < API

    class << self

      def all(params)
        github_api.repos.repos params
      end

      def get(user, repo, params)
        github_api.repos.get_repo user, repo, params
      end

      def create
        github_api.repos.create_repo user, repo, params
      end

      def edit
        github_api.repos.edit_repo user, repo, params
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
