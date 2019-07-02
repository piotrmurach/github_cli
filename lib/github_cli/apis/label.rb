# frozen_string_literal: true

require_relative '../api'

module GithubCLI
  class Label
    extend API

    def self.all(user, repo, params, options)
      output options do
        github_api(options).issues.labels.list user, repo, params
      end
    end

    def self.get(user, repo, name, params, options)
      output options do
        github_api(options).issues.labels.get user, repo, name, params
      end
    end

    def self.create(user, repo, params, options)
      output options do
        github_api(options).issues.labels.create user, repo, params
      end
    end

    def self.update(user, repo, name, params, options)
      output options do
        github_api(options).issues.labels.update user, repo, name, params
      end
    end

    def self.delete(user, repo, name, params, options)
      output options do
        github_api(options).issues.labels.delete user, repo, name, params
      end
    end

    def self.add(user, repo, issue_id, *args)
      options, params = args.pop, args.pop
      output options do
        github_api(options).issues.labels.add user, repo, issue_id, args.flatten, params
      end
    end

    def self.remove(user, repo, issue_id, params, options)
      output options do
        github_api(options).issues.labels.remove user, repo, issue_id, params
      end
    end

    def self.replace(user, repo, issue_id, *args)
      options, params = args.pop, args.pop
      output options do
        github_api(options).issues.labels.replace user, repo, issue_id, args.flatten, params
      end
    end
  end # Label
end # GithubCLI
