# encoding: utf-8

module GithubCLI
  class Tag < API

    class << self

      def get(user, repo, sha, params, format)
        output format do
          github_api.git_data.tags.get user, repo, sha, params
        end
      end

      def create(user, repo, params, format)
        output format do
          github_api.git_data.tags.create user, repo, params
        end
      end
    end

  end # Tag
end # GithubCLI
