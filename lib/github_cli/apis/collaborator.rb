# frozen_string_literal: true

require_relative '../api'

module GithubCLI
  class Collaborator
    extend API

    def self.all(user, repo, params, options)
      output options do
        github_api(options).repos.collaborators.list user, repo, params
      end
    end

    def self.add(user, repo, collab, params, options)
      output options do
        github_api(options).repos.collaborators.add user, repo, collab, params
      end
    end

    def self.collaborator?(user, repo, collab, params, options)
      output options do
        github_api(options).repos.collaborators.collaborator? user, repo, collab, params
      end
    end

    def self.remove(user, repo, collab, params, options)
      output options do
        github_api(options).repos.collaborators.remove user, repo, collab, params
      end
    end
  end # Collaborator
end # GithubCLI
