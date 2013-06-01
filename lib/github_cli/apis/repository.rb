# encoding: utf-8

module GithubCLI
  class Repository < API

    class << self

      def all(params, options)
        output options do
          if options[:every]
            github_api(options).repos.list 'every', params
          else
            github_api(options).repos.list params
          end
        end
      end

      def get(user, repo, params, options)
        output options[:format], options[:quiet] do
          github_api(options).repos.get user, repo, params
        end
      end

      def create(params, options)
        output options[:format], options[:quiet] do
          github_api(options).repos.create params
        end
      end

      def edit(user, repo, params, options)
        output options[:format], options[:quiet] do
          github_api(options).repos.edit user, repo, params
        end
      end

      def delete(user, repo, params, options)
        output options[:format], options[:quiet] do
          github_api(options).repos.delete user, repo, params
        end
      end

      def branches(user, repo, params, options)
        output options[:format], options[:quiet] do
          github_api(options).repos.branches user, repo, params
        end
      end

      def branch(user, repo, name, params, options)
        output options[:format], options[:quiet] do
          github_api(options).repos.branch user, repo, name, params
        end
      end

      def contributors(user, repo, params, options)
        output options[:format], options[:quiet] do
          github_api(options).repos.contributors user, repo, params
        end
      end

      def languages(user, repo, params, options)
        output options[:format], options[:quiet] do
          github_api(options).repos.languages user, repo, params
        end
      end

      def tags(user, repo, params, options)
        output options[:format], options[:quiet] do
          github_api.repos.tags user, repo, params
        end
      end

      def teams(user, repo, params, options)
        output options[:format], options[:quiet] do
          github_api(options).repos.teams user, repo, params
        end
      end
    end

  end # Repository
end # GithubCLI
