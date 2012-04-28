# encoding: utf-8

module GithubCLI
  class Download < API

    class << self

      def all(user, repo, params)
        github_api.repos.downloads user, repo, params
      end

      def get(user, repo, id, params)
        github_api.repos.download user, repo, id, params
      end

      def create(user, repo, params)
        github_api.repos.create_download user, repo, params
      end

      def upload(resource, filename)
        github_api.repos.upload resource, filename
      end

      def delete(user, repo, id, params)
        github_api.repos.delete_download user, repo, id, params
      end
    end

  end # Download
end # GithubCLI
