# encoding: utf-8

module GithubCLI
  class Collaborator < API

    class << self

      def all(user, repo, params, options)
        output options do
          github_api(options).repos.collaborators.list user, repo, params
        end
      end

      def add(user, repo, collab, params, options)
        output options do
          github_api(options).repos.collaborators.add user, repo, collab, params
        end
      end

      def collaborator?(user, repo, collab, params, options)
        output options do
          github_api(options).repos.collaborators.collaborator? user, repo, collab, params
        end
      end

      def remove(user, repo, collab, params, options)
        output options do
          github_api(options).repos.collaborators.remove user, repo, collab, params
        end
      end
    end

  end # Collaborator
end # GithubCLI
