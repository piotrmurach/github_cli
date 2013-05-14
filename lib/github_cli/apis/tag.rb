# encoding: utf-8

module GithubCLI
  class Tag < API

    class << self

      def get(user, repo, sha, params, options)
        output options[:format], options[:quiet] do
          github_api(options).git_data.tags.get user, repo, sha, params
        end
      end

      def create(user, repo, params, options)
        output options[:format], options[:quiet] do
          github_api(options).git_data.tags.create user, repo, params
        end
      end
    end

  end # Tag
end # GithubCLI
