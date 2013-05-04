# encoding: utf-8

module GithubCLI
  class Issue < API

    class << self

      def all(arg, params, options)
        output options[:format], options[:quiet] do
          github_api(options).issues.list arg, params
        end
      end

      def get(user, repo, id, params, options)
        output options[:format], options[:quiet] do
          github_api(options).issues.get user, repo, id, params
        end
      end

      def create(user, repo, params, options)
        output options[:format], options[:quiet] do
          github_api(options).issues.create user, repo, params
        end
      end

      def edit(user, repo, id, params, options)
        output options[:format], options[:quiet] do
          github_api(options).issues.edit user, repo, id, params
        end
      end
    end

  end # Issue
end # GithubCLI
