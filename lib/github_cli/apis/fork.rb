# encoding: utf-8

module GithubCLI
  class Fork < API

    class << self

      def all(user, repo, params, options)
        output options do
          github_api(options).repos.forks.list user, repo, params
        end
      end

      def create(user, repo, params, options)
        output options do
          github_api(options).repos.forks.create user, repo, params
        end
      end
    end

  end # Fork
end # GithubCLI
