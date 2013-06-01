# encoding: utf-8

module GithubCLI
  class Watching < API

    class << self

      def list(user, repo, params, options)
        output options do
          github_api(options).activity.watching.list user, repo, params
        end
      end

      def watched(params, options)
        output options do
          github_api(options).activity.watching.watched params
        end
      end

      def watching?(user, repo, params, options)
        output options do
          github_api(options).activity.watching.watching? user, repo, params
        end
      end

      def start(user, repo, params, options)
        output options do
          github_api(options).activity.watching.watch user, repo, params
        end
      end

      def stop(user, repo, params, options)
        output options do
          github_api(options).activity.watching.unwatch user, repo, params
        end
      end
    end

  end # Watching
end # GithubCLI
