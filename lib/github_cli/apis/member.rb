# encoding: utf-8

module GithubCLI
  class Member < API

    class << self

      def all(org, params, format)
        output format do
          github_api.orgs.members.list org, params
        end
      end

      def all_public(org, params, format)
        output format do
          github_api.orgs.members.list_public org, params
        end
      end

      def member?(org, user, params, format)
        output format do
          github_api.orgs.members.member? org, user, params
        end
      end

      def public_member?(org, user, params, format)
        output format do
          github_api.orgs.members.public_member? org, user, params
        end
      end

      def delete(org, user, params, format)
        output format do
          github_api.orgs.members.delete org, user, params
        end
      end

      def publicize(org, user, params, format)
        output format do
          github_api.orgs.members.publicize org, user, params
        end
      end

      def conceal(org, user, params, format)
        output format do
          github_api.orgs.members.conceal org, user, params
        end
      end
    end

  end # Member
end # GithubCLI
