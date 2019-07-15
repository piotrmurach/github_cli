# frozen_string_literal: true

require_relative '../api'

module GithubCLI
  class Assignee
    extend API

    def self.all(user, repo, params, options)
      output options do
        github_api(options).issues.assignees.list user, repo, params
      end
    end

    def self.check(user, repo, assignee, params, options)
      output options do
        github_api(options).issues.assignees.check user, repo, assignee, params
      end
    end

    def self.add(user, repo, number, params, options)
      output output do
        github_api(options).issues.assignees.add(user, repo, number, params)
      end
    end

    def self.delete(user, repo, number, params, options)
      output options do
        github_api(options).issues.assignees.remove(user, repo, number, params)
      end
    end
  end # Assignee
end # GithubCLI
