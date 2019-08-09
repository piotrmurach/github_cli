# frozen_string_literal: true

require_relative "../api"

module GithubCLI
  class Merging
    extend API

    def self.merge(user, repo, params, options)
      output options do
        github_api(options).repos.merging.merge(user, repo, params)
      end
    end
  end # Merging
end # GithubCLI
