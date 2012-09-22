# encoding: utf-8

module GithubCLI
  class Watching < API

    class << self

      def list(user, repo, params, format)
        output format do
          github_api.repos.watching.list user, repo, params
        end
      end

      def watched(params, format)
        output format do
          github_api.repos.watching.watched user, repo, id, params
        end
      end

      def watching?(user, repo, params, format)
        output format do
          github_api.repos.watching.watching? user, repo, params
        end
      end

      def start(user, repo, params, format)
        output format do
          github_api.repos.watching.watch user, repo, params
        end
      end

      def stop(user, repo, params, format)
        output format do
          github_api.repos.watching.unwatch user, repo, params
        end
      end
    end

  end # Watching
end # GithubCLI
