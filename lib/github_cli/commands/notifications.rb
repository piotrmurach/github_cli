# frozen_string_literal: true

require_relative "../apis/notification"
require_relative "../util"
require_relative "../command"

module GithubCLI
  module Commands
    class Notifications < Command

      namespace :notify

      option :all, :type => :boolean,
            :desc => "true to show notifications marked as read."
      option :participating, :type => :boolean,
            :desc => "true to show only notifications in which the user is directly participating or mentioned."
      option :since, :type => :string,
            :desc => "filters out any notifications updated before the given time"
      option :user, :type => :string, :aliases => ["-u"]
      option :repo, :type => :string, :aliases => ["-r"]
      desc "list", "List your notifications"
      long_desc <<-DESC
        Parameters

          all - Optional boolean - true to show notifications marked as read.\n
          participating - Optional boolean - true to show only notifications in which the user is directly participating or mentioned.\n
          since - Optional time - filters out any notifications updated before the given time.\n
      DESC
      def list
        global_options = options.dup
        params = options[:params].dup
        params["user"] = options[:user] if options[:user]
        params["repo"] = options[:repo] if options[:repo]
        Util.hash_without!(global_options, params.keys + ["params"])
        Notification.all params, global_options
      end

      desc "get <id>", "View a single thread"
      def get(id)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        Notification.get id, params, global_options
      end

      option :user, :type => :string, :aliases => ["-u"]
      option :repo, :type => :string, :aliases => ["-r"]
      option :read, :type => :boolean
      option :id, :type => :numeric, :desc => "thread id to be marked"
      desc "mark", "Mark as read"
      def mark
        global_options = options.dup
        params = options[:params].dup
        params["user"]      = options[:user] if options[:user]
        params["repo"]      = options[:repo] if options[:repo]
        params["read"]      = options[:read] if options[:read]
        params["thread_id"] = options[:id]   if options[:id]
        Util.hash_without!(global_options, params.keys + ["params", "id"])
        Notification.mark params, global_options
      end

      desc "check", "Check to see if the current user is subscribed to a thread"
      def check(id)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        Notification.subscribed? id, params, global_options
      end

      option :subscribed, :type => :boolean,
            :desc => "determines if notifications should be received from this thread"
      option :ignored, :type => :boolean,
            :desc => "determines if all notifications should be blocked from this thread"
      desc "create", "Create a thread subscription"
      long_desc <<-DESC
        This lets you subscribe to a thread, or ignore it. Subscribing to a thread
        is unnecessary if the user is already subscribed to the repository. Ignoring
        a thread will mute all future notifications (until you comment or get @mentioned).
      DESC
      def create(id)
        global_options = options.dup
        params = options[:params].dup
        params["subscribed"] = options[:subscribed] if options[:subscrirbed]
        params["ignored"]    = options[:ignored]    if options[:ignored]
        Util.hash_without!(global_options, params.keys + ["params"])
        Notification.create id, params, global_options
      end

      desc "delete", "Delete a thread subscription"
      def delete(id)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        Notification.delete id, params, global_options
      end
    end # Notifications
  end # Commands
end # GithubCLI
