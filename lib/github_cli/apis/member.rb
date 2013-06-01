# encoding: utf-8

module GithubCLI
  class Member < API

    class << self

      def all(org, params, options)
        output options do
          github_api(options).orgs.members.list org, params
        end
      end

      def member?(org, user, params, options)
        output options do
          github_api(options).orgs.members.member? org, user, params
        end
      end

      def delete(org, user, params, options)
        output options do
          github_api(options).orgs.members.delete org, user, params
        end
      end

      def publicize(org, user, params, options)
        output options do
          github_api(options).orgs.members.publicize org, user, params
        end
      end

      def conceal(org, user, params, options)
        output options do
          github_api(options).orgs.members.conceal org, user, params
        end
      end
    end

  end # Member
end # GithubCLI
