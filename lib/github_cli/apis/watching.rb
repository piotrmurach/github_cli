# encoding: utf-8

module GithubCLI
  class Watching < API

    class << self

      def list(user, repo, params, format)
        output format do
          github_api.activity.watching.list user, repo, params
        end
      end

      def watched(params, format)
        output format do
          github_api.activity.watching.watched params
        end
      end

      def watching?(user, repo, params, format)
        output format do
          github_api.activity.watching.watching? user, repo, params
        end
      end

      def start(user, repo, params, format)
        output format do
          github_api.activity.watching.watch user, repo, params
        end
      end

      def stop(user, repo, params, format)
        output format do
          github_api.activity.watching.unwatch user, repo, params
        end
      end
    end

  end # Watching
end # GithubCLI
