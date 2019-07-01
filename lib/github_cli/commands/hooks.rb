# frozen_string_literal: true

require_relative '../apis/hook'
require_relative '../util'
require_relative '../command'

module GithubCLI
  class Commands::Hooks < Command

    namespace :hook

    desc 'list <user> <repo>', 'List repository hooks'
    def list(user, repo)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, %w[ params ])
      Hook.all user, repo, params, global_options
    end

    desc 'get <user> <repo> <id>', 'Get a hook'
    def get(user, repo, id)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, %w[ params ])
      Hook.get user, repo, id, params, global_options
    end

    option :name, :type => :string, :required => true, :banner => "service",
           :desc => "the name of the service that is being called"
    option :config, :type => :hash, :required => :true, :banner => "",
           :desc => "a hash containing key/value pairs to provide settings for this hook"
    option :events, :type => :array,
           :desc => "Determines what events the hook is triggered for. Default: ['push']"
    option :active, :type => :boolean, :default => true,
           :desc => "determines whether the hook is actually triggered on pushes"
    desc 'create <user> <repo>', 'Create a hook'
    long_desc <<-DESC
      Inputs

      name - Required string - the name of the service that is being called.\n
      config - Required hash - A Hash containing key/value pairs to provide settings for this hook. \n
      events - Optional array - Determines what events the hook is triggered for. Default: ["push"] \n
      active - Optional boolean - Determines whether the hook is actually triggered on pushes.
    DESC
    def create(user, repo)
      global_options = options.dup
      params = options[:params].dup
      params['name']   = options[:name]
      params['config'] = options[:config]
      params['events'] = options[:events] if options[:events]
      params['active'] = options[:active] if options[:active]
      Util.hash_without!(global_options, %w[ params name config events active ])
      Hook.create user, repo, params, global_options
    end

    option :name, :type => :string, :required => true, :banner => "service",
           :desc => "the name of the service that is being called"
    option :config, :type => :hash, :required => :true, :banner => "",
           :desc => "a hash containing key/value pairs to provide settings for this hook"
    option :events, :type => :array,
           :desc => "Determines what events the hook is triggered for. Default: ['push']"
    option :add_events, :type => :array,
           :desc => "Determines a list of events to be added to the list of events that the Hook triggers for."
    option :remove_events, :type => :array,
           :desc => "Determines a list of events to be removed from the list of events that the Hook triggers for."
    option :active, :type => :boolean, :default => true,
           :desc => "determines whether the hook is actually triggered on pushes"
    desc 'edit <user> <repo> <id>', 'Edit a hook'
    long_desc <<-DESC
      Inputs

      name - Required string - the name of the service that is being called. \n
      config - Required hash - A Hash containing key/value pairs to provide settings for this hook. \n
      events - Optional array - Determines what events the hook is triggered for. This replaces the entire array of events. Default: ["push"]. \n
      add_events - Optional array - Determines a list of events to be added to the list of events that the Hook triggers for. \n
      remove_events - Optional array - Determines a list of events to be removed from the list of events that the Hook triggers for. \n
      active - Optional boolean - Determines whether the hook is actually triggered on pushes. \n
    DESC
    def edit(user, repo, id)
      global_options = options.dup
      params = options[:params].dup
      params['name']          = options[:name]
      params['config']        = options[:config]
      params['events']        = options[:events]        if options[:events]
      params['add_events']    = options[:add_events]    if options[:add_events]
      params['remove_events'] = options[:remove_events] if options[:remove_events]
      params['active']        = options[:active]        if options[:active]
      Util.hash_without!(global_options, params.keys + ['params'])
      Hook.edit user, repo, id, params, global_options
    end

    desc 'test <user> <repo> <id>', 'Test a hook'
    def test(user, repo, id)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, %w[ params ])
      Hook.test user, repo, id, params, global_options
    end

    desc 'delete <user> <repo> <id>', 'Delete a hook'
    def delete(user, repo, id)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, %w[ params ])
      Hook.delete user, repo, id, params, global_options
    end
  end # Hooks
end # GithubCLI
