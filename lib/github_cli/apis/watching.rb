# encoding: utf-8

module GithubCLI
  class Watching < API

    class << self

      def watchers(user, repo, params, format)
        output format do
          github_api.repos.watching.watchers user, repo, params
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

      def start_watching(user, repo, params, format)
        output format do
          github_api.repos.watching.start_watching user, repo, params
        end
      end

      def stop_watching(user, repo, params, format)
        output format do
          github_api.repos.watching.stop_watching user, repo, params
        end
      end
    end

  end # Watching
end # GithubCLI
