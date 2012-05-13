# encoding: utf-8

module GithubCLI
  class Authorization < API

    class << self

      def all(params, format)
        output format do
          github_api.oauth.list params
        end
      end

      def get(id, params, format)
        output format do
          github_api.oauth.get id, params
        end
      end

      def create(params, format)
        output format do
          github_api.oauth.create params
        end
      end

      def update(id, params, format)
        output format do
          github_api.oauth.update id, params
        end
      end

      def delete(id, params, format)
        output format do
          github_api.oauth.delete id, params
        end
      end
    end

  end # Authorization
end # GithubCLI
