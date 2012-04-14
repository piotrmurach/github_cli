# encoding: utf-8

module GithubCLI
  class Reference < API

    class << self

      def get(user, repo, ref, params)
        github_api.git_data.reference user, repo, ref, params
      end

      def list(user, repo, ref, params)
        github_api.git_data.references user, repo, ref, params
      end

      def create(user, repo, params)
        github_api.git_data.create_reference user, repo, params
      end

      def update(user, repo, ref, params)
        github_api.git_data.update_reference user, repo, ref, params
      end

      def delete(user, repo, ref, params)
        github_api.git_data.delete_reference user, repo, ref, params
      end
    end

  end # Reference
end # GithubCLI
