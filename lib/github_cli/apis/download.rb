# encoding: utf-8

module GithubCLI
  class Download < API

    class << self

      def all(user, repo, params, format)
        output format do
          github_api.repos.downloads.list user, repo, params
        end
      end

      def get(user, repo, id, params, format)
        output format do
          github_api.repos.downloads.get user, repo, id, params
        end
      end

      def create(user, repo, params, format)
        output format do
          github_api.repos.downloads.create user, repo, params
        end
      end

      def upload(resource, filename, format)
        output format do
          github_api.repos.downloads.upload resource, filename
        end
      end

      def delete(user, repo, id, params, format)
        output format do
          github_api.repos.downloads.delete user, repo, id, params
        end
      end
    end

  end # Download
end # GithubCLI
