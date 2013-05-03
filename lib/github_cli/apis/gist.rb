# encoding: utf-8

module GithubCLI
  class Gist < API

    class << self

      def all(params, options)
        output options[:format], options[:quiet] do
          github_api(options).gists.list params
        end
      end

      def starred(params, options)
        output options[:format], options[:quiet] do
          github_api(options).gists.starred params
        end
      end

      def get(id, params, options)
        output options[:format], options[:quiet] do
          github_api(options).gists.get id, params
        end
      end

      def create(params, options)
        output options[:format], options[:quiet] do
          github_api(options).gists.create params
        end
      end

      def edit(id, params, options)
        output options[:format], options[:quiet] do
          github_api(options).gists.edit id, params
        end
      end

      def star(id, params, options)
        output options[:format], options[:quiet] do
          github_api(options).gists.star id, params
        end
      end

      def unstar(id, params, options)
        output options[:format], options[:quiet] do
          github_api(options).gists.unstar id, params
        end
      end

      def starred?(id, params, options)
        output options[:format], options[:quiet] do
          github_api(options).gists.starred? id, params
        end
      end

      def fork(id, params, options)
        output options[:format], options[:quiet] do
          github_api(options).gists.fork id, params
        end
      end

      def delete(id, params, options)
        output options[:format], options[:quiet] do
          github_api(options).gists.delete id, params
        end
      end
    end

  end # Gist
end # GithubCLI
