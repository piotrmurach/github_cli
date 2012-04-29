# encoding: utf-8

module GithubCLI
  class Reference < API

    class << self

      def list(user, repo, ref, params)
        github_api.git_data.references.list user, repo, ref, params
      end

      def get(user, repo, ref, params)
        github_api.git_data.references.get user, repo, ref, params
      end

      def create(user, repo, params)
        github_api.git_data.references.create user, repo, params
      end

      def update(user, repo, ref, params)
        github_api.git_data.references.update user, repo, ref, params
      end

      def delete(user, repo, ref, params)
        github_api.git_data.references.delete user, repo, ref, params
      end
    end

  end # Reference
end # GithubCLI
