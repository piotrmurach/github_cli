# encoding: utf-8

module GithubCLI
  class Search < API

    class << self

      def issue(owner, repo, keyword, params, format)
        output format do
          github_api.search.issues params.update(:owner => owner, :repo => repo, :keyword => keyword)
        end
      end

      def repo(params, format)
        output format do
          github_api.search.repos params
        end
      end

      def user(params, format)
        output format do
          github_api.search.users params
        end
      end

      def email(params, format)
        output format do
          github_api.search.email params
        end
      end

    end

  end # Search
end # GithubCLI
