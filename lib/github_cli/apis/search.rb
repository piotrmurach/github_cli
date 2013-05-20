# encoding: utf-8

module GithubCLI
  class Search < API

    class << self

      def issue(params, options)
        output options[:format], options[:quiet] do
          github_api(options).search.issues params
        end
      end

      def repo(params, options)
        output options[:format], options[:quiet] do
          github_api(options).search.repos params
        end
      end

      def user(params, options)
        output options[:format], options[:quiet] do
          github_api(options).search.users params
        end
      end

      def email(params, options)
        output options[:format], options[:quiet] do
          github_api(options).search.email params
        end
      end

    end

  end # Search
end # GithubCLI
