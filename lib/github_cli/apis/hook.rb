# encoding: utf-8

module GithubCLI
  class Hook < API

    class << self

      def all(user, repo, params, options)
        output options[:format], options[:quiet] do
          github_api(options).repos.hooks.list user, repo, params
        end
      end

      def get(user, repo, id, params, options)
        output options[:format], options[:quiet] do
          github_api(options).repos.hooks.get user, repo, id, params
        end
      end

      def create(user, repo, params, options)
        output options[:format], options[:quiet] do
          github_api(options).repos.hooks.create user, repo, params
        end
      end

      def edit(user, repo, id, params, options)
        output options[:format], options[:quiet] do
          github_api(options).repos.hooks.edit user, repo, id, params
        end
      end

      def test(user, repo, id, params, options)
        output options[:format], options[:quiet] do
          github_api(options).repos.hooks.test user, repo, id, params
        end
      end

      def delete(user, repo, id, params, options)
        output options[:format], options[:quiet] do
          github_api(options).repos.hooks.delete user, repo, id, params
        end
      end
    end

  end # Hook
end # GithubCLI
