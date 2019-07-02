# frozen_string_literal: true

require_relative '../api'

module GithubCLI
  class Watching
    extend API

    def self.list(user, repo, params, options)
      output options do
        github_api(options).activity.watching.list user, repo, params
      end
    end

    def self.watched(params, options)
      output options do
        github_api(options).activity.watching.watched params
      end
    end

    def self.watching?(user, repo, params, options)
      output options do
        github_api(options).activity.watching.watching? user, repo, params
      end
    end

    def self.start(user, repo, params, options)
      output options do
        github_api(options).activity.watching.watch user, repo, params
      end
    end

    def self.stop(user, repo, params, options)
      output options do
        github_api(options).activity.watching.unwatch user, repo, params
      end
    end
  end # Watching
end # GithubCLI
