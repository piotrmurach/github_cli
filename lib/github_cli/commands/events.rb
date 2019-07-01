# frozen_string_literal: true

require_relative '../apis/event'
require_relative '../util'
require_relative '../command'

module GithubCLI
  module Commands
    class Events < Command

      namespace :event

      desc 'public', 'Lists all public events'
      def public
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ['params'])
        Event.public params, global_options
      end

      desc 'repo <user> <repo>', 'Lists all repository events for a given user'
      def repo(user, repo)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ['params'])
        Event.repository user, repo, params, global_options
      end

      desc 'issue <user> <repo>', 'Lists all issue events for a given repository'
      def issue(user, repo)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ['params'])
        Event.issue user, repo, params, global_options
      end

      desc 'network <user> <repo>', 'Lists all public events for a network of repositories'
      def network(user, repo)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ['params'])
        Event.network user, repo, params, global_options
      end

      desc 'org <org>', 'Lists all public events for an organization'
      def org(org)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ['params'])
        Event.organization org, params, global_options
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
        global_options = options.dup
        params = options[:params].dup
        params['public'] = options[:public] if options[:public]
        Util.hash_without!(global_options, params.keys + ['params'])
        Event.received user, params, global_options
      end

      desc 'performed <user>', 'Lists all events that a user has performed'
      method_option :public, :type => :boolean,
                    :desc => 'Lists all public events that a user has received'
      long_desc <<-DESC
        If you are authenticated as the given user, you will see your private
        events. Otherwise, you’ll only see public events.
      DESC
      def performed(user)
        global_options = options.dup
        params = options[:params].dup
        params['public'] = true if options[:public]
        Util.hash_without!(global_options, params.keys + ['params'])
        Event.performed user, params, global_options
      end

      desc 'user_org <user> <org>', "Lists all events for a user's organization"
      long_desc <<-DESC
        This is the user’s organization dashboard. You must be authenticated
        as the user to view this.
      DESC
      def user_org(user, org)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ['params'])
        Event.user_org user, org, params, global_options
      end
    end # Events
  end # Commands
end # GithubCLI
