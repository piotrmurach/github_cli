# encoding: utf-8

module GithubCLI
  class Watching < API

    class << self

      def watchers(user, repo, params)
        github_api.repos.watching.watchers user, repo, params
      end

      def watched(params)
        github_api.repos.watching.watched user, repo, id, params
      end

      def watching?(user, repo, params)
        github_api.repos.watching.watching? user, repo, params
      end

      def start_watching(user, repo, params)
        github_api.repos.watching.start_watching user, repo, params
      end

      def stop_watching(user, repo, params)
        github_api.repos.watching.stop_watching user, repo, params
      end
    end

  end # Watching
end # GithubCLI
