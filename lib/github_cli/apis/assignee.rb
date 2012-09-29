# encoding: utf-8

module GithubCLI
  class Assignee < API

    class << self

      def all(user, repo, params, format)
        output format do
          github_api.issues.assignees.list user, repo, params
        end
      end

      def check(user, repo, assignee, params, format)
        output format do
          github_api.issues.assignees.check user, repo, assignee, params
        end
      end
    end

  end # Assignee
end # GithubCLI
