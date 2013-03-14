# encoding: utf-8

module GithubCLI
  class Event < API

    class << self

      def public(params, format)
        output format do
          github_api.activity.events.public params
        end
      end

      def repository(user, repo, params, format)
        output format do
          github_api.activity.events.repository user, repo, params
        end
      end

      def issue(user, repo, params, format)
        output format do
          github_api.activity.events.issue user, repo, params
        end
      end

      def network(user, repo, params, format)
        output format do
          github_api.activity.events.network user, repo, params
        end
      end

      def organization(org, params, format)
        output format do
          github_api.activity.events.organization org, params
        end
      end

      def received(user, params, format)
        output format do
          github_api.activity.events.received user, params
        end
      end

      def performed(user, params, format)
        output format do
          github_api.activity.events.performed user, params
        end
      end

      def user_org(user, org, params, format)
        output format do
          github_api.activity.events.user_org user, org, params
        end
      end
    end

  end # Event
end # GithubCLI
