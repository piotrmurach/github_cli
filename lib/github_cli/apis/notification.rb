# encoding: utf-8

module GithubCLI
  class Notification < API

    class << self

      def all(params, format)
        output format do
          github_api.activity.notifications.list params
        end
      end

      def get(id, params, format)
        output format do
          github_api.activity.notifications.get id, params
        end
      end
    end

  end # Notification
end # GithubCLI
