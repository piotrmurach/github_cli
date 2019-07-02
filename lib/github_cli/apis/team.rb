# frozen_string_literal: true

require_relative '../api'

module GithubCLI
  class Team
    extend API

    def self.all(org, params, options)
      output options do
        github_api(options).orgs.teams.list org, params
      end
    end

    def self.get(id, params, options)
      output options do
        github_api(options).orgs.teams.get id, params
      end
    end

    def self.create(org, params, options)
      output options do
        github_api(options).orgs.teams.create org, params
      end
    end

    def self.edit(id, params, options)
      output options do
        github_api(options).orgs.teams.edit id, params
      end
    end

    def self.delete(id, params, options)
      output options do
        github_api(options).orgs.teams.delete id, params
      end
    end

    def self.all_member(id, params, options)
      output options do
        github_api(options).orgs.teams.list_members id, params
      end
    end

    def self.member(id, user, params, options)
      output options do
        github_api(options).orgs.teams.team_member? id, user, params
      end
    end

    def self.add_member(id, user, params, options)
      output options do
        github_api(options).orgs.teams.add_member id, user, params
      end
    end

    def self.remove_member(id, user, params, options)
      output options do
        github_api(options).orgs.teams.remove_member id, user, params
      end
    end

    def self.all_repo(id, params, options)
      output options do
        github_api(options).orgs.teams.list_repos id, params
      end
    end

    def self.repo(id, user, repo, params, options)
      output options do
        github_api(options).orgs.teams.team_repo? id, user, repo, params
      end
    end

    def self.add_repo(id, user, repo, params, options)
      output options do
        github_api(options).orgs.teams.add_repo id, user, repo, params
      end
    end

    def self.remove_repo(id, user, repo, params, options)
      output options do
        github_api(options).orgs.teams.remove_repo id, user, repo, params
      end
    end
  end # Team
end # GithubCLI
