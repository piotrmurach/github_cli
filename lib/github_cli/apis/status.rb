# encoding: utf-8

module GithubCLI
  class Status < API

    class << self

      def list(user, repo, sha, params, format)
        output format do
          github_api.repos.statuses.list user, repo, sha, params
        end
      end

      def create(user, repo, sha, params, format)
        output format do
          github_api.repos.statuses.create user, repo, sha, params
        end
      end
    end

  end # Status
end # GithubCLI
