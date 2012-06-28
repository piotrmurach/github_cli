# encoding: utf-8

module GithubCLI
  class Content < API

    class << self

      def get(user, repo, path, params, format)
        output format do
          github_api.repos.contents.get user, repo, path, params
        end
      end

      def readme(user, repo, params, format)
        output format do
          github_api.repos.contents.readme user, repo, params
        end
      end

      def archive(user, repo, params, format)
        output format do
          github_api.repos.contents.archive user, repo, params
        end
      end
    end

  end # Content
end # GithubCLI
