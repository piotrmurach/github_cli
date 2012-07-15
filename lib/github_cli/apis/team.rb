# encoding: utf-8

module GithubCLI
  class Team < API

    class << self

      def all(org, params, format)
        output format do
          github_api.orgs.teams.list org, params
        end
      end

      def get(id, params, format)
        output format do
          github_api.orgs.teams.get id, params
        end
      end

      def create(org, params, format)
        output format do
          github_api.orgs.teams.create org, params
        end
      end

      def edit(id, params, format)
        output format do
          github_api.orgs.teams.edit id, params
        end
      end

      def delete(id, params, format)
        output format do
          github_api.orgs.teams.delete id, params
        end
      end

      def all_member(id, params, format)
        output format do
          github_api.orgs.teams.list_members id, params
        end
      end

      def member(id, user, params, format)
        output format do
          github_api.orgs.teams.team_member? id, user, params
        end
      end

      def add_member(id, user, params, format)
        output format do
          github_api.orgs.teams.add_member id, user, params
        end
      end

      def remove_member(id, user, params, format)
        output format do
          github_api.orgs.teams.remove_member id, user, params
        end
      end

      def all_repo(id, params, format)
        output format do
          github_api.orgs.teams.list_repos id, params
        end
      end

      def repo(id, user, repo, params, format)
        output format do
          github_api.orgs.teams.team_repo? id, user, repo, params
        end
      end

      def add_repo(id, user, repo, params, format)
        output format do
          github_api.orgs.teams.add_repo id, user, repo, params
        end
      end

      def remove_repo(id, user, repo, params, format)
        output format do
          github_api.orgs.teams.remove_repo id, user, repo, params
        end
      end
    end

  end # Team
end # GithubCLI
