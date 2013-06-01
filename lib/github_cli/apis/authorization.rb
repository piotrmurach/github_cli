# encoding: utf-8

module GithubCLI
  class Authorization < API

    class << self

      def all(params, options)
        output options do
          github_api(options).oauth.list params
        end
      end

      def get(id, params, options)
        output options do
          github_api(options).oauth.get id, params
        end
      end

      def create(params, options)
        output options do
          github_api(options).oauth.create params
        end
      end

      def update(id, params, options)
        output options do
          github_api(options).oauth.update id, params
        end
      end

      def delete(id, params, options)
        output options do
          github_api(options).oauth.delete id, params
        end
      end
    end

  end # Authorization
end # GithubCLI
