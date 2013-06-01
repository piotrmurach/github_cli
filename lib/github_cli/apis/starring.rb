# encoding: utf-8

module GithubCLI
  class Starring < API

    class << self

      def list(user, repo, params, options)
        output options do
          github_api(options).activity.starring.list user, repo, params
        end
      end

      def starred(params, options)
        output options do
          github_api(options).activity.starring.starred params
        end
      end

      def starring?(user, repo, params, options)
        output options do
          github_api(options).activity.starring.starring? user, repo, params
        end
      end

      def star(user, repo, params, options)
        output options do
          github_api(options).activity.starring.star user, repo, params
        end
      end

      def unstar(user, repo, params, options)
        output options do
          github_api(options).activity.starring.unstar user, repo, params
        end
      end
    end

  end # Starring
end # GithubCLI
