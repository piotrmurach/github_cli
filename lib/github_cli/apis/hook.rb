# encoding: utf-8

module GithubCLI
  class Hook < API

    class << self

      def all(user, repo, params, format)
        output format do
          github_api.repos.hooks.list user, repo, params
        end
      end

      def get(user, repo, id, params, format)
        output format do
          github_api.repos.hooks.get user, repo, id, params
        end
      end

      def create(user, repo, params, format)
        output format do
          github_api.repos.hooks.create user, repo, params
        end
      end

      def edit(user, repo, id, params, format)
        output format do
          github_api.repos.hooks.edit user, repo, id, params
        end
      end

      def test(user, repo, id, params, format)
        output format do
          github_api.repos.hooks.test user, repo, id, params
        end
      end

      def delete(user, repo, id, params, format)
        output format do
          github_api.repos.hooks.delete user, repo, id, params
        end
      end
    end

  end # Hook
end # GithubCLI
