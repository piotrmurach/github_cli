# encoding: utf-8

module GithubCLI
  class Organization < API

    class << self

      def list(params, format)
        output format do
          github_api.orgs.list params
        end
      end

      def get(org, params, format)
        output format do
          github_api.orgs.get org, params
        end
      end

      def edit(org, params, format)
        output format do
          github_api.orgs.edit org, params
        end
      end
    end

  end # Organization
end # GithubCLI
