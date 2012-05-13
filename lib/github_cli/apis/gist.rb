# encoding: utf-8

module GithubCLI
  class Gist < API

    class << self

      def all(params, format)
        output format do
          github_api.gists.list params
        end
      end

      def starred(params, format)
        output format do
          github_api.gists.starred params
        end
      end

      def get(id, params, format)
        output format do
          github_api.gists.get id, params
        end
      end

      def create(params, format)
        output format do
          github_api.gists.create params
        end
      end

      def edit(id, params, format)
        output format do
          github_api.gists.edit id, params
        end
      end

      def star(id, params, format)
        output format do
          github_api.gists.star id, params
        end
      end

      def unstar(id, params, format)
        output format do
          github_api.gists.unstar id, params
        end
      end

      def starred?(id, params, format)
        output format do
          github_api.gists.starred? id, params
        end
      end

      def fork(id, params, format)
        output format do
          github_api.gists.fork id, params
        end
      end

      def delete(id, params, format)
        output format do
          github_api.gists.delete id, params
        end
      end
    end

  end # Gist
end # GithubCLI
