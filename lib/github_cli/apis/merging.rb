# encoding: utf-8

module GithubCLI
  class Merging < API

    class << self

      def merge(user, repo, params, format)
        output format do
          github_api.repos.merging.merge user, repo, params
        end
      end

    end

  end # Merging
end # GithubCLI
