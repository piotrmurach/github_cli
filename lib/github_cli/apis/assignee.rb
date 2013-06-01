# encoding: utf-8

module GithubCLI
  class Assignee < API

    class << self

      def all(user, repo, params, options)
        output options do
          github_api(options).issues.assignees.list user, repo, params
        end
      end

      def check(user, repo, assignee, params, options)
        output options do
          github_api(options).issues.assignees.check user, repo, assignee, params
        end
      end
    end

  end # Assignee
end # GithubCLI
