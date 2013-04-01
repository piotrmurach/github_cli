# encoding: utf-8

module GithubCLI
  class User < API

    class << self

      def all(params, format)
        output format do
          github_api.users.all params
        end
      end

      def get(params, format)
        output format do
          github_api.users.get params
        end
      end

      def update(params, format)
        output format do
          github_api.users.update params
        end
      end
    end

  end # User
end # GithubCLI
