# frozen_string_literal: true

require_relative "../api"

module GithubCLI
  class Starring
    extend API

    def self.list(user, repo, params, options)
      output options do
        github_api(options).activity.starring.list(user, repo, params)
      end
    end

    def self.starred(params, options)
      output options do
        github_api(options).activity.starring.starred(params)
      end
    end

    def self.starring?(user, repo, params, options)
      output options do
        github_api(options).activity.starring.starring?(user, repo, params)
      end
    end

    def self.star(user, repo, params, options)
      output options do
        github_api(options).activity.starring.star(user, repo, params)
      end
    end

    def self.unstar(user, repo, params, options)
      output options do
        github_api(options).activity.starring.unstar(user, repo, params)
      end
    end
  end # Starring
end # GithubCLI
