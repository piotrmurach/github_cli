# encoding: utf-8

module GithubCLI
  class Issue < API

    class << self

      def all(params, format)
        output format do
          github_api.issues.list params
        end
      end

      def all_repo(user, repo, params, format)
        output format do
          github_api.issues.list_repo user, repo, params
        end
      end

      def get(user, repo, id, params, format)
        output format do
          github_api.issues.get user, repo, id, params
        end
      end

      def create(user, repo, params, format)
        output format do
          github_api.issues.create user, repo, params
        end
      end

      def edit(user, repo, id, params, format)
        output format do
          github_api.issues.edit user, repo, id, params
        end
      end
    end

  end # Issue
end # GithubCLI
