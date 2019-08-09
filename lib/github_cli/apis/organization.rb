# frozen_string_literal: true

require_relative "../api"

module GithubCLI
  class Organization
    extend API

    def self.list(params, options)
      output options do
        github_api(options).orgs.list(params)
      end
    end

    def self.get(org, params, options)
      output options do
        github_api(options).orgs.get(org, params)
      end
    end

    def self.edit(org, params, options)
      output options do
        github_api(options).orgs.edit(org, params)
      end
    end
  end # Organization
end # GithubCLI
