# frozen_string_literal: true

require_relative '../api'

module GithubCLI
  class Notification
    extend API

    def self.all(params, options)
      output options do
        github_api(options).activity.notifications.list params
      end
    end

    def self.get(id, params, options)
      output options do
        github_api(options).activity.notifications.get id, params
      end
    end

    def self.mark(params, options)
      output options do
        github_api(options).activity.notifications.mark params
      end
    end

    def self.subscribed?(id, params, options)
      output options do
        github_api(options).activity.notifications.subscribed? id, params
      end
    end

    def self.create(id, params, options)
      output options do
        github_api(options).activity.notifications.create id, params
      end
    end

    def self.delete(id, params, options)
      output options do
        github_api(options).activity.notifications.delete id, params
      end
    end
  end # Notification
end # GithubCLI
