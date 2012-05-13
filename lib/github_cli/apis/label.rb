# encoding: utf-8

module GithubCLI
  class Label < API

    class << self

      def all(params, format)
        output format do
          github_api.issues.labels params
        end
      end

      def get(user, repo, name, params, format)
        output format do
          github_api.issues.get_label user, repo, name, params
        end
      end

      def create(user, repo, params, format)
        output format do
          github_api.issues.create_label user, repo, params
        end
      end

      def update(user, repo, name, params, format)
        output format do
          github_api.issues.update_label user, repo, params
        end
      end

      def delete(user, repo, name, params, format)
        output format do
          github_api.issues.delete_label user, repo, name, params
        end
      end

      def issue(user, repo, number, params, format)
        output format do
          github_api.issues.labels_for user, repo, number, params
        end
      end

      def add(user, repo, number, *args)
        # TODO extract params from args
        output :table do
          github_api.issues.add_labels user, repo, args
        end
      end

      def remove(user, repo, number, name=nil, params, format)
        output format do
          github_api.issues.remove_label user, repo, number, name, params
        end
      end

      def replace(user, repo, number, *args)
        # TODO extract params from args
        output :table do
          github_api.issues.replace_labels user, repo, number, args
        end
      end

      def milestone(user, repo, number, params, format)
        output format do
          gitub_api.issues.milestone_labels user, repo, number, params
        end
      end
    end

  end # Label
end # GithubCLI
