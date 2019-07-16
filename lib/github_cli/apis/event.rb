# frozen_string_literal: true

require_relative "../api"

module GithubCLI
  class Event
    extend API

    def self.public(params, options)
      output options do
        github_api(options).activity.events.public(params)
      end
    end

    def self.repository(user, repo, params, options)
      output options do
        github_api(options).activity.events.repository(user, repo, params)
      end
    end

    def self.issue(user, repo, params, options)
      output options do
        github_api(options).activity.events.issue(user, repo, params)
      end
    end

    def self.network(user, repo, params, options)
      output options do
        github_api(options).activity.events.network(user, repo, params)
      end
    end

    def self.organization(org, params, options)
      output options do
        github_api(options).activity.events.organization(org, params)
      end
    end

    def self.received(user, params, options)
      output options do
        github_api(options).activity.events.received(user, params)
      end
    end

    def self.performed(user, params, options)
      output options do
        github_api(options).activity.events.performed(user, params)
      end
    end

    def self.user_org(user, org, params, options)
      output options do
        github_api(options).activity.events.user_org(user, org, params)
      end
    end
  end # Event
end # GithubCLI
