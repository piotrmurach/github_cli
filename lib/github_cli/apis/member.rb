# frozen_string_literal: true

require_relative '../api'

module GithubCLI
  class Member
    extend API

    def self.all(org, params, options)
      output options do
        github_api(options).orgs.members.list org, params
      end
    end

    def self.member?(org, user, params, options)
      output options do
        github_api(options).orgs.members.member? org, user, params
      end
    end

    def self.delete(org, user, params, options)
      output options do
        github_api(options).orgs.members.delete org, user, params
      end
    end

    def self.publicize(org, user, params, options)
      output options do
        github_api(options).orgs.members.publicize org, user, params
      end
    end

    def self.conceal(org, user, params, options)
      output options do
        github_api(options).orgs.members.conceal org, user, params
      end
    end
  end # Member
end # GithubCLI
