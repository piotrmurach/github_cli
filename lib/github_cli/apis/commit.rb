# encoding: utf-8

module GithubCLI
  class Commit < API

    class << self

      def get(user, repo, sha, params, options)
        output options do
          github_api(options).git_data.commits.get user, repo, sha, params
        end
      end

      def create(user, repo, params, options)
        output options do
          github_api(options).git_data.commits.create user, repo, params
        end
      end
    end

  end # Commit
end # GithubCLI
