# encoding: utf-8

module GithubCLI
  class Label < API

    class << self

      def all(params)
        github_api.issues.labels params
      end

      def get(user, repo, name, params)
        github_api.issues.get_label user, repo, name, params
      end

      def create(user, repo, params)
        github_api.issues.create_label user, repo, params
      end

      def update(user, repo, name, params)
        github_api.issues.update_label user, repo, params
      end

      def delete(user, repo, name, params)
        github_api.issues.delete_label user, repo, name, params
      end

      def issue(user, repo, number, params)
        github_api.issues.labels_for user, repo, number, params
      end

      def add(user, repo, number, *args)
        github_api.issues.add_labels user, repo, args
      end

      def remove(user, repo, number, name=nil, params)
        github_api.issues.remove_label user, repo, number, name, params
      end

      def replace(user, repo, number, *args)
        github_api.issues.replace_labels user, repo, number, args
      end

      def milestone(user, repo, number, params)
        gitub_api.issues.milestone_labels user, repo, number, params
      end
    end

  end # Label
end # GithubCLI
