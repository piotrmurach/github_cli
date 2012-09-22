# encoding: utf-8

module GithubCLI
  class Starring < API

    class << self

      def list(user, repo, params, format)
        output format do
          github_api.repos.starring.list user, repo, params
        end
      end

      def starred(params, format)
        output format do
          github_api.repos.starring.starred params
        end
      end

      def starring?(user, repo, params, format)
        output format do
          github_api.repos.starring.starring? user, repo, params
        end
      end

      def star(user, repo, params, format)
        output format do
          github_api.repos.starring.star user, repo, params
        end
      end

      def unstar(user, repo, params, format)
        output format do
          github_api.repos.starring.unstar user, repo, params
        end
      end
    end

  end # Starring
end # GithubCLI
