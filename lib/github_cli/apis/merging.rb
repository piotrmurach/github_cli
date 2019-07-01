# encoding: utf-8

require_relative '../api'

module GithubCLI
  class Merging < API

    class << self
      def merge(user, repo, params, options)
        output options do
          github_api(options).repos.merging.merge user, repo, params
        end
      end
    end
  end # Merging
end # GithubCLI
