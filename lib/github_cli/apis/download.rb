# encoding: utf-8

module GithubCLI
  class Download < API

    class << self

      def all(user, repo, params, options)
        output options do
          github_api(options).repos.downloads.list user, repo, params
        end
      end

      def get(user, repo, id, params, options)
        output options do
          github_api(options).repos.downloads.get user, repo, id, params
        end
      end

      def create(user, repo, params, options)
        output options do
          github_api(options).repos.downloads.create user, repo, params
        end
      end

      def upload(resource, filename, options)
        output options do
          github_api(options).repos.downloads.upload resource, filename
        end
      end

      def delete(user, repo, id, params, options)
        output options do
          github_api(options).repos.downloads.delete user, repo, id, params
        end
      end
    end

  end # Download
end # GithubCLI
