# encoding: utf-8

module GithubCLI
  class Notification < API

    class << self

      def all(params, options)
        output options[:format], options[:quiet] do
          github_api(options).activity.notifications.list params
        end
      end

      def get(id, params, options)
        output options[:format], options[:quiet] do
          github_api(options).activity.notifications.get id, params
        end
      end

      def mark(params, options)
        output options[:format], options[:quiet] do
          github_api(options).activity.notifications.mark params
        end
      end

      def subscribed?(id, params, options)
        output options[:format], options[:quiet] do
          github_api(options).activity.notifications.subscribed? id, params
        end
      end

      def create(id, params, options)
        output options[:format], options[:quiet] do
          github_api(options).activity.notifications.create id, params
        end
      end

      def delete(id, params, options)
        output options[:format], options[:quiet] do
          github_api(options).activity.notifications.delete id, params
        end
      end
    end

  end # Notification
end # GithubCLI
