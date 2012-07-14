# encoding: utf-8

module GithubCLI
  class PullRequest < API

    class << self

      def list(user, repo, params, format)
        output format do
          github_api.pull_requests.list user, repo, params
        end
      end

      def get(user, repo, number, params, format)
        output format do
          github_api.pull_requests.get user, repo, number, params
        end
      end

      def create(user, repo, params, format)
        output format do
          github_api.pull_requests.create user, repo, params
        end
      end

      def update(user, repo, number, params, format)
        output format do
          github_api.pull_requests.update user, repo, number, params
        end
      end

      def commits(user, repo, number, params, format)
        output format do
          github_api.pull_requests.commits user, repo, number, params
        end
      end

      def files(user, repo, number, params, format)
        output format do
          github_api.pull_requests.files user, repo, number, params
        end
      end

      def merged(user, repo, number, params, format)
        output format do
          github_api.pull_requests.merged? user, repo, number, params
        end
      end

      def merge(user, repo, number, params, format)
        output format do
          github_api.pull_requests.merge user, repo, number, params
        end
      end
    end

  end # PullRequest
end # GithubCLI
