# encoding: utf-8

module GithubCLI
  class Commands::Notifications < Command

    namespace :notify

    option :all, :type => :boolean,
           :desc => "true to show notifications marked as read."
    option :participating, :type => :boolean,
           :desc => "true to show only notifications in which the user is directly participating or mentioned."
    option :since, :type => :string,
           :desc => "filters out any notifications updated before the given time"
    option :user, :type => :string, :aliases => ["-u"]
    option :repo, :type => :string, :aliases => ["-r"]
    desc 'list', 'List your notifications'
    long_desc <<-DESC
      Parameters

        all - Optional boolean - true to show notifications marked as read.\n
        participating - Optional boolean - true to show only notifications in which the user is directly participating or mentioned.\n
        since - Optional time - filters out any notifications updated before the given time.\n
    DESC
    def list
      params = options[:params].dup
      params['user'] = options[:user] if options[:user]
      params['repo'] = options[:repo] if options[:repo]

      Notification.all params, options[:format]
    end

    desc 'get <id>', 'View a single thread'
    def get(id)
      Notification.get id, options[:params], options[:format]
    end

    option :user, :type => :string, :aliases => ["-u"]
    option :repo, :type => :string, :aliases => ["-r"]
    option :read, :type => :boolean
    option :id, :type => :numeric, :desc => "thread id to be marked"
    desc 'mark', 'Mark as read'
    def mark
      params = options[:params].dup
      params['user']      = options[:user] if options[:user]
      params['repo']      = options[:repo] if options[:repo]
      params['read']      = options[:read] if options[:read]
      params['thread_id'] = options[:id]   if options[:id]

      Notification.mark params, options[:format]
    end

    desc 'check', 'Check to see if the current user is subscribed to a thread'
    def check(id)
      params = options[:params].dup

      Notification.subscribed? id, params, options[:format]
    end

    option :subscribed, :type => :boolean,
           :desc => 'determines if notifications should be received from this thread'
    option :ignored, :type => :boolean,
           :desc => 'determines if all notifications should be blocked from this thread'
    desc 'create', 'Create a thread subscription'
    long_desc <<-DESC
      This lets you subscribe to a thread, or ignore it. Subscribing to a thread
      is unnecessary if the user is already subscribed to the repository. Ignoring
      a thread will mute all future notifications (until you comment or get @mentioned).
    DESC
    def create(id)
      params = options[:params].dup
      params['subscribed'] = options[:subscribed] if options[:subscrirbed]
      params['ignored']    = options[:ignored]    if options[:ignored]

      Notification.create id, params, options[:format]
    end

    desc 'delete', 'Delete a thread subscription'
    def delete(id)
      params = options[:params].dup

      Notification.delete id, params, options[:format]
    end

  end # Notifications
end # GithubCLI
