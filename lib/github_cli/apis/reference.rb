# frozen_string_literal: true

require_relative '../api'

module GithubCLI
  class Reference
    extend API

    def self.list(user, repo, params, options)
      output options do
        github_api(options).git_data.references.list user, repo, params
      end
    end

    def self.get(user, repo, ref, params, options)
      output options do
        github_api(options).git_data.references.get user, repo, ref, params
      end
    end

    def self.create(user, repo, params, options)
      output options do
        github_api(options).git_data.references.create user, repo, params
      end
    end

    def self.update(user, repo, ref, params, options)
      output options do
        github_api(options).git_data.references.update user, repo, ref, params
      end
    end

    def self.delete(user, repo, ref, params, options)
      output options do
        github_api(options).git_data.references.delete user, repo, ref, params
      end
    end
  end # Reference
end # GithubCLI
