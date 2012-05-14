# encoding: utf-8

module GithubCLI
  class Milestone < API

    class << self

      def all(user, repo, params, format)
        output format do
          github_api.issues.milestones.list user, repo, params
        end
      end

      def get(user, repo, id, params, format)
        output format do
          github_api.issues.milestones.get user, repo, id, params
        end
      end

      def create(user, repo, params, format)
        output format do
          github_api.issues.milestones.create user, repo, params
        end
      end

      def update(user, repo, id, params, format)
        output format do
          github_api.issues.milestones.update user, repo, id, params
        end
      end

      def delete(user, repo, id, params, format)
        output format do
          github_api.issues.milestones.delete user, repo, id, params
        end
      end
    end

  end # Milestone
end # GithubCLI
