# encoding: utf-8

module GithubCLI
  class Label < API

    class << self

      def all(user, repo, params, options)
        output options do
          github_api(options).issues.labels.list user, repo, params
        end
      end

      def get(user, repo, name, params, options)
        output options do
          github_api(options).issues.labels.get user, repo, name, params
        end
      end

      def create(user, repo, params, options)
        output options do
          github_api(options).issues.labels.create user, repo, params
        end
      end

      def update(user, repo, name, params, options)
        output options do
          github_api(options).issues.labels.update user, repo, name, params
        end
      end

      def delete(user, repo, name, params, options)
        output options do
          github_api(options).issues.labels.delete user, repo, name, params
        end
      end

      def add(user, repo, issue_id, *args)
        options, params = args.pop, args.pop
        output options do
          github_api(options).issues.labels.add user, repo, issue_id, args.flatten, params
        end
      end

      def remove(user, repo, issue_id, params, options)
        output options do
          github_api(options).issues.labels.remove user, repo, issue_id, params
        end
      end

      def replace(user, repo, issue_id, *args)
        options, params = args.pop, args.pop
        output options do
          github_api(options).issues.labels.replace user, repo, issue_id, args.flatten, params
        end
      end
    end

  end # Label
end # GithubCLI
