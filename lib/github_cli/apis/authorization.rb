# encoding: utf-8

module GithubCLI
  class Authorization < API

    class << self

      def all(params)
        github_api.oauth.list params
      end

      def get(id, params)
        github_api.oauth.get id, params
      end

      def create(params)
        github_api.oauth.create params
      end

      def update(id, params)
        github_api.oauth.update id, params
      end

      def delete(id, params)
        github_api.oauth.delete id, params
      end
    end

  end # Authorization
end # GithubCLI
