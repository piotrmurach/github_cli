# encoding: utf-8

module GithubCLI
  class Key < API

    class << self

      def all(user, repo, params, format)
        output format do
          github_api.repos.keys.list user, repo, params
        end
      end

      def get(user, repo, id, params, format)
        output format do
          github_api.repos.keys.get user, repo, id, params
        end
      end

      def create(user, repo, params, format)
        output format do
          github_api.repos.keys.create user, repo, params
        end
      end

      def edit(user, repo, id, params, format)
        output format do
          github_api.repos.keys.edit user, repo, id, params
        end
      end

      def delete(user, repo, id, params, format)
        output format do
          github_api.repos.keys.delete user, repo, id, params
        end
      end
    end

  end # Key
end # GithubCLI
