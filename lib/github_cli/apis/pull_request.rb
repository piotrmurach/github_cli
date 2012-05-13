# encoding: utf-8

module GithubCLI
  class PullRequest < API

    class << self

      def get(user, repo, number, params, format)
        output format do
          github_api.pull_requests.pull_request user, repo, number, params
        end
      end

      def list(user, repo, ref, params, format)
        output format do
          github_api.pull_requests.pull_requests user, repo, ref, params
        end
      end

      def create(user, repo, params, format)
        output format do
          github_api.pull_requests.create_request user, repo, params
        end
      end

      def update(user, repo, number, params, format)
        output format do
          github_api.pull_requests.update_request user, repo, number, params
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
          github_api.pull_requests.merged user, repo, number, params
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
