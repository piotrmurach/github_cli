# encoding: utf-8

module GithubCLI
  class Key < API

    class << self

      def all(user, repo, params)
        github_api.repos.keys user, repo, params
      end

      def get(user, repo, id, params)
        github_api.repos.get_key user, repo, id, params
      end

      def create(user, repo, params)
        github_api.repos.create_key user, repo, params
      end

      def edit(user, repo, id, params)
        github_api.repos.edit_key user, repo, id, params
      end

      def delete(user, repo, id, params)
        github_api.repos.delete_key user, repo, id, params
      end
    end

  end # Key
end # GithubCLI
