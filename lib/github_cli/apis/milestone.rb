# frozen_string_literal: true

require_relative '../api'

module GithubCLI
  class Milestone
    extend API

    def self.all(user, repo, params, options)
      output options do
        github_api(options).issues.milestones.list user, repo, params
      end
    end

    def self.get(user, repo, id, params, options)
      output options do
        github_api(options).issues.milestones.get user, repo, id, params
      end
    end

    def self.create(user, repo, params, options)
      output options do
        github_api(options).issues.milestones.create user, repo, params
      end
    end

    def self.update(user, repo, id, params, options)
      output options do
        github_api(options).issues.milestones.update user, repo, id, params
      end
    end

    def self.delete(user, repo, id, params, options)
      output options do
        github_api(options).issues.milestones.delete user, repo, id, params
      end
    end
  end # Milestone
end # GithubCLI
