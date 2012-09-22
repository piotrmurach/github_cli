# encoding: utf-8

module GithubCLI
  class Label < API

    class << self

      def all(user, repo, params, format)
        output format do
          github_api.issues.labels.list user, repo, params
        end
      end

      def get(user, repo, name, params, format)
        output format do
          github_api.issues.labels.get user, repo, name, params
        end
      end

      def create(user, repo, params, format)
        output format do
          github_api.issues.labels.create user, repo, params
        end
      end

      def update(user, repo, name, params, format)
        output format do
          github_api.issues.labels.update user, repo, name, params
        end
      end

      def delete(user, repo, name, params, format)
        output format do
          github_api.issues.labels.delete user, repo, name, params
        end
      end

      def issue(user, repo, issue_id, params, format)
        output format do
          github_api.issues.labels.issue user, repo, issue_id, params
        end
      end

      def add(user, repo, issue_id, *args)
        format, params = args.pop, args.pop

        output format do
          github_api.issues.labels.add user, repo, issue_id, args.flatten, params
        end
      end

      def remove(user, repo, issue_id, label_id, params, format)
        output format do
          github_api.issues.labels.remove user, repo, issue_id, label_id, params
        end
      end

      def replace(user, repo, issue_id, *args)
        format, params = args.pop, args.pop

        output format do
          github_api.issues.labels.replace user, repo, issue_id, args.flatten, params
        end
      end

      def milestone(user, repo, number, params, format)
        output format do
          github_api.issues.labels.milestone user, repo, number, params
        end
      end
    end

  end # Label
end # GithubCLI
