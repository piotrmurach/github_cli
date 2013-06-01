# encoding: utf-8

module GithubCLI
  class Organization < API

    class << self

      def list(params, options)
        output options do
          github_api(options).orgs.list params
        end
      end

      def get(org, params, options)
        output options do
          github_api(options).orgs.get org, params
        end
      end

      def edit(org, params, options)
        output options do
          github_api(options).orgs.edit org, params
        end
      end
    end

  end # Organization
end # GithubCLI
