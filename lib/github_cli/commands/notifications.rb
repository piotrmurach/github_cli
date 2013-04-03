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

  end # Notifications
end # GithubCLI
