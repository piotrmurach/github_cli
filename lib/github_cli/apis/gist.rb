# encoding: utf-8

module GithubCLI
  class Gist < API

    class << self

      def all(params)
        github_api.gists.list params
      end

      def starred(params)
        github_api.gists.starred params
      end

      def get(id, params)
        puts github_api.gists.get id, params
      end

      def create(params)
        github_api.gists.create params
      end

      def edit(id, params)
        github_api.gists.edit id, params
      end

      def star(id, params)
        github_api.gists.star id, params
      end

      def unstar(id, params)
        github_api.gists.unstar id, params
      end

      def starred?(id, params)
        github_api.gists.starred? id, params
      end

      def fork(id, params)
        github_api.gists.fork id, params
      end

      def delete(id, params)
        github_api.gists.delete id, params
      end
    end

  end # Gist
end # GithubCLI
