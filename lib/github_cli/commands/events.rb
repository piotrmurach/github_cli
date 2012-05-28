# encoding: utf-8

module GithubCLI
  class Commands::Events < Command

    namespace :event

    desc 'public', 'Lists all public events'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additional request parameters e.i per_page:100'
    def public
      Event.public options[:params], options[:format]
    end

    desc 'repo <user> <repo>', 'Lists all repository events for a given user'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additional request parameters e.i per_page:100'
    def repo(user, repo)
      Event.repository user, repo, options[:params], options[:format]
    end

    desc 'issue <user> <repo>', 'Lists all issue events for a given repository'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additional request parameters e.i per_page:100'
    def issue(user, repo)
      Event.issue user, repo, options[:params], options[:format]
    end

    desc 'network <user> <repo>', 'Lists all public events for a network of repositories'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additional request parameters e.i per_page:100'
    def network(user, repo)
      Event.network user, repo, options[:params], options[:format]
    end

    desc 'org <org>', 'Lists all public events for an organization'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additional request parameters e.i per_page:100'
    def org(org)
      Event.organization org, options[:params], options[:format]
    end

    desc 'received <user>', 'Lists all events that a user has received'
    method_option :public, :type => :boolean,
                  :desc => 'Lists all public events that a user has received'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additional request parameters e.i per_page:100'
    long_desc <<-DESC
      These are events that you’ve received by watching repos and following users.
      If you are authenticated as the given user, you will see private events.
      Otherwise, you’ll only see public events.
    DESC
    def received(user)
      if options[:public]
        options[:params]['public'] = true
      end
      Event.received user, options[:params], options[:format]
    end

    desc 'performed <user>', 'Lists all events that a user has performed'
    method_option :public, :type => :boolean,
                  :desc => 'Lists all public events that a user has received'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additional request parameters e.i per_page:100'
    long_desc <<-DESC
      If you are authenticated as the given user, you will see your private
      events. Otherwise, you’ll only see public events.
    DESC
    def performed(user)
      if options[:public]
        options[:params]['public'] = true
      end
      Event.performed user, options[:params], options[:format]
    end

    desc 'user_org <user> <org>', "Lists all events for a user's organization"
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additional request parameters e.i per_page:100'
    long_desc <<-DESC
      This is the user’s organization dashboard. You must be authenticated
      as the user to view this.
    DESC
    def user_org(user, org)
      Event.user_org user, org, options[:params], options[:format]
    end

  end # Events
end # GithubCLI
