# encoding: utf-8

module GithubCLI
  class Repository < API

    class << self

      def all(params, format)
        output format do
          github_api.repos.list params
        end
      end

      def get(user, repo, params, format)
        output format do
          github_api.repos.get user, repo, params
        end
      end

      def create(params, format)
        output format do
          github_api.repos.create params
        end
      end

      def edit(user, repo, params, format)
        output format do
          github_api.repos.edit user, repo, params
        end
      end

      def branches(user, repo, params, format)
        output format do
          github_api.repos.branches user, repo, params
        end
      end

      def contributors(user, repo, params, format)
        output format do
          github_api.repos.contributors user, repo, params
        end
      end

      def languages(user, repo, params, format)
        output format do
          github_api.repos.languages user, repo, params
        end
      end

      def tags(user, repo, params, format)
        output format do
          github_api.repos.tags user, repo, params
        end
      end

      def teams(user, repo, params, format)
        output format do
          github_api.repos.teams user, repo, params
        end
      end
    end

  end # Repository
end # GithubCLI
