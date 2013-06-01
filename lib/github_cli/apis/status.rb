# encoding: utf-8

module GithubCLI
  class Status < API

    class << self

      def all(user, repo, sha, params, options)
        output options do
          github_api(options).repos.statuses.list user, repo, sha, params
        end
      end

      def create(user, repo, sha, params, options)
        output options do
          github_api(options).repos.statuses.create user, repo, sha, params
        end
      end
    end

  end # Status
end # GithubCLI
