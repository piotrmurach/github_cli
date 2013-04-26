# encoding: utf-8

module GithubCLI
  class Event < API

    class << self

      def public(params, options)
        output options[:format], options[:quiet] do
          github_api(options).activity.events.public params
        end
      end

      def repository(user, repo, params, options)
        output options[:format], options[:quiet] do
          github_api(options).activity.events.repository user, repo, params
        end
      end

      def issue(user, repo, params, options)
        output options[:format], options[:quiet] do
          github_api(options).activity.events.issue user, repo, params
        end
      end

      def network(user, repo, params, options)
        output options[:format], options[:quiet] do
          github_api(options).activity.events.network user, repo, params
        end
      end

      def organization(org, params, options)
        output options[:format], options[:quiet] do
          github_api(options).activity.events.organization org, params
        end
      end

      def received(user, params, options)
        output options[:format], options[:quiet] do
          github_api(options).activity.events.received user, params
        end
      end

      def performed(user, params, options)
        output options[:format], options[:quiet] do
          github_api(options).activity.events.performed user, params
        end
      end

      def user_org(user, org, params, options)
        output options[:format], options[:quiet] do
          github_api(options).activity.events.user_org user, org, params
        end
      end
    end

  end # Event
end # GithubCLI
