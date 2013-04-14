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

      def mark(params, format)
        output format do
          github_api.activity.notifications.mark params
        end
      end

      def subscribed?(id, params, format)
        output format do
          github_api.activity.notifications.subscribed? id, params
        end
      end

      def create(id, params, format)
        output format do
          github_api.activity.notifications.create id, params
        end
      end

      def delete(id, params, format)
        output format do
          github_api.activity.notifications.delete id, params
        end
      end
    end

  end # Notification
end # GithubCLI
