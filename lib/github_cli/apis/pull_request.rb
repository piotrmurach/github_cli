# encoding: utf-8

module GithubCLI
  class PullRequest < API

    class << self

      def list(user, repo, params, options)
        output options do
          github_api(options).pull_requests.list user, repo, params
        end
      end

      def get(user, repo, number, params, options)
        output options do
          github_api(options).pull_requests.get user, repo, number, params
        end
      end

      def create(user, repo, params, options)
        output options do
          github_api(options).pull_requests.create user, repo, params
        end
      end

      def update(user, repo, number, params, options)
        output options do
          github_api(options).pull_requests.update user, repo, number, params
        end
      end

      def commits(user, repo, number, params, options)
        output options do
          github_api(options).pull_requests.commits user, repo, number, params
        end
      end

      def files(user, repo, number, params, options)
        output options do
          github_api(options).pull_requests.files user, repo, number, params
        end
      end

      def merged(user, repo, number, params, options)
        output options do
          github_api(options).pull_requests.merged? user, repo, number, params
        end
      end

      def merge(user, repo, number, params, options)
        output options do
          github_api(options).pull_requests.merge user, repo, number, params
        end
      end
    end

  end # PullRequest
end # GithubCLI
