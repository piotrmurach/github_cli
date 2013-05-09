# encoding: utf-8

module GithubCLI
  class User < API

    class << self

      def all(params, options)
        output options[:format], options[:quiet] do
          github_api(options).users.all params
        end
      end

      def get(params, options)
        output options[:format], options[:quiet] do
          github_api(options).users.get params
        end
      end

      def update(params, options)
        output options[:format], options[:quiet] do
          github_api(options).users.update params
        end
      end
    end

  end # User
end # GithubCLI
