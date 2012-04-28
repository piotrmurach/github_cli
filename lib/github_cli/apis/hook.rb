# encoding: utf-8

module GithubCLI
  class Hook < API

    class << self

      def all(user, repo, params)
        github_api.repos.hooks user, repo, params
      end

      def get(user, repo, id, params)
        github_api.repos.hook user, repo, id, params
      end

      def create(user, repo, params)
        github_api.repos.create_hook user, repo, params
      end

      def edit(user, repo, id, params)
        github_api.repos.edit_hook user, repo, id, params
      end

      def test(user, repo, id, params)
        github_api.repos.test_hook user, repo, id, params
      end

      def delete(user, repo, id, params)
        github_api.repos.delete_hook user, repo, id, params
      end
    end

  end # Hook
end # GithubCLI
