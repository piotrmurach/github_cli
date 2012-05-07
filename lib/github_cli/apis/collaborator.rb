# encoding: utf-8

module GithubCLI
  class Collaborator < API

    class << self

      def all(user, repo, params)
        github_api.repos.collaborators.list user, repo, params
      end

      def add(user, repo, collab, params)
        github_api.repos.collaborators.add user, repo, collab, params
      end

      def collaborator?(user, repo, collab, params)
        github_api.repos.collaborators.collaborator? user, repo, collab, params
      end

      def remove(user, repo, collab, params)
        github_api.repos.collaborators.remove user, repo, collab, params
      end
    end

  end # Collaborator
end # GithubCLI
