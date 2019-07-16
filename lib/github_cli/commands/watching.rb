# frozen_string_literal: true

require_relative "../apis/watching"
require_relative "../util"
require_relative "../command"

module GithubCLI
  module Commands
    class Watching < GithubCLI::Command

      namespace :watch

      desc "list <user> <repo>", "Lists repo watchers"
      def list(user, repo)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        GithubCLI::Watching.list user, repo, params, global_options
      end

      desc "watched", "Lists repos being watched by a user"
      method_option :user, :type => :string, :aliases => ["-u"],
                    :desc => "Watch repositories for <user>"
      def watched
        global_options = options.dup
        params = options[:params].dup
        if options[:user]
          params["user"] = options[:user]
        end
        Util.hash_without!(global_options, params.keys + ["params"])
        GithubCLI::Watching.watched params, global_options
      end

      option :subscribed, :type => :boolean, :desc => "Determines if notifications should be received from this repository."
      option :ignored, :type => :boolean, :desc => "Determines if all notifications should be blocked from this repository."
      desc "create <user> <repo>", "Set a Repository Subscription"
      def create(user, repo)
        global_options = options.dup
        params = options[:params].dup
        params["subscribed"] = options["subscribed"] if options.key?("subscribed")
        Util.hash_without!(global_options, params.keys + ["params"])
        GithubCLI::Watching.create(user, repo, params, global_options)
      end

      desc "delete <user> <repo>", "Delete a Repository Subscription"
      def delete(user, repo)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        GithubCLI::Watching.delete(user, repo, params, global_options)
      end

      desc "get <user> <repo>", "Get a Repository Subscription"
      def get(user, repo)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        GithubCLI::Watching.subscribed?(user, repo, params, global_options)
      end

      desc "watching <user> <repo>", "Check if you are watching a repository"
      def watching(user, repo)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        GithubCLI::Watching.watching? user, repo, params, global_options
      end

      desc "start <user> <repo>", "Watch a repository"
      def start(user, repo)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        GithubCLI::Watching.start user, repo, params, global_options
      end

      desc "stop <user> <repo>", "Stop watching a repository"
      def stop(user, repo)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        GithubCLI::Watching.stop user, repo, params, global_options
      end
    end # Watching
  end # Commands
end # GithubCLI
