# encoding: utf-8

module GithubCLI
  class Commands::Events < Command

    namespace :event

    desc 'public', 'Lists all public events'
    def public
      Event.public options[:params], options[:format]
    end

    desc 'repo <user> <repo>', 'Lists all repository events for a given user'
    def repo(user, repo)
      Event.repository user, repo, options[:params], options[:format]
    end

    desc 'issue <user> <repo>', 'Lists all issue events for a given repository'
    def issue(user, repo)
      Event.issue user, repo, options[:params], options[:format]
    end

    desc 'network <user> <repo>', 'Lists all public events for a network of repositories'
    def network(user, repo)
      Event.network user, repo, options[:params], options[:format]
    end

    desc 'org <org>', 'Lists all public events for an organization'
    def org(org)
      Event.organization org, options[:params], options[:format]
    end

    desc 'received <user>', 'Lists all events that a user has received'
    method_option :public, :type => :boolean,
                  :desc => 'Lists all public events that a user has received'
    long_desc <<-DESC
      These are events that you’ve received by watching repos and following users.
      If you are authenticated as the given user, you will see private events.
      Otherwise, you’ll only see public events.
    DESC
    def received(user)
      params = options[:params].dup
      if options[:public]
        params['public'] = true
      end
      Event.received user, params, options[:format]
    end

    desc 'performed <user>', 'Lists all events that a user has performed'
    method_option :public, :type => :boolean,
                  :desc => 'Lists all public events that a user has received'
    long_desc <<-DESC
      If you are authenticated as the given user, you will see your private
      events. Otherwise, you’ll only see public events.
    DESC
    def performed(user)
      params = options[:params].dup
      if options[:public]
        params['public'] = true
      end
      Event.performed user, params, options[:format]
    end

    desc 'user_org <user> <org>', "Lists all events for a user's organization"
    long_desc <<-DESC
      This is the user’s organization dashboard. You must be authenticated
      as the user to view this.
    DESC
    def user_org(user, org)
      Event.user_org user, org, options[:params], options[:format]
    end

  end # Events
end # GithubCLI
