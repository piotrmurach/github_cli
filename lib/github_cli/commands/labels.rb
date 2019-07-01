# frozen_string_literal: true

require_relative '../apis/label'
require_relative '../util'
require_relative '../command'
require_relative '../command/arguments'

module GithubCLI
  class Commands::Labels < Command

    namespace :label

    desc 'list <user> <repo>', 'Listing all labels for this repository.'
    option :milestone, :type => :string, :aliases => ["-m"],
           :banner => '<milestone>',
           :desc => 'List labels for every issue in a milestone.'
    option :issue, :type => :string, :aliases => ["-i"], :banner => '<issue>',
           :desc => 'List labels on an issue.'
    def list(user, repo)
      global_options = options.dup
      params = options[:params].dup
      params_remove = params.keys + ['params']
      if (milestone_id = options[:milestone])
        params['milestone_id'] = milestone_id
        params_remove << 'milestone'
      elsif (issue_id = options[:issue])
        params['issue_id'] = issue_id
        params_remove << 'issue'
      end
      Util.hash_without!(global_options, params_remove)
      Label.all user, repo, params, global_options
    end

    desc 'get <user> <repo> <name>', 'Get a single label.'
    def get(user, repo, name)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Label.get user, repo, name, params, global_options
    end

    option :name, :type => :string, :required => true
    option :color, :type => :string, :required => true
    desc 'create <user> <repo>', 'Create a label.'
    long_desc <<-DESC
      Inputs
        name - Required string
        color - Required string - 6 character hex code, without leading #
    DESC
    def create(user, repo)
      global_options = options.dup
      params = options[:params].dup
      params['name']  = options[:name]  if options[:name]
      params['color'] = options[:color] if options[:color]
      Util.hash_without!(global_options, params.keys + ['params'])
      Label.create user, repo, params, global_options
    end

    option :name, :type => :string, :required => true
    option :color, :type => :string, :required => true
    desc 'update <user> <repo> <name>', 'Update a label.'
    long_desc <<-DESC
      Inputs
        name - Required string
        color - Required string - 6 character hex code, without leading #
    DESC
    def update(user, repo, name)
      global_options = options.dup
      params = options[:params].dup
      params['name']  = options[:name]  if options[:name]
      params['color'] = options[:color] if options[:color]
      Util.hash_without!(global_options, params.keys + ['params'])
      Label.update user, repo, name, params, global_options
    end

    desc 'delete <user> <repo> <name>', 'Delete a label.'
    def delete(user, repo, name)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Label.delete user, repo, name, params, global_options
    end

    desc 'add <user> <repo> <number> <label>[<label>...]', 'Add labels to issue <number>.'
    def add(user, repo, number, *args)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Label.add user, repo, number, args, params, global_options
    end

    desc 'remove <user> <repo> [<name>/]<number>', 'Remove label<name> from an issue<number>'
    def remove(user, repo, number)
      name, number  = Arguments.new(number).parse
      global_options = options.dup
      params = options[:params].dup
      params['label_name'] = name if name
      Util.hash_without!(global_options, params.keys + ['params'])
      Label.remove user, repo, number, params, global_options
    end

    desc 'replace <user> <repo> <number> <label>[<label>...]', 'Replace all labels for an issue <number>.'
    def replace(user, repo, number, *args)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Label.replace user, repo, number, args, params, global_options
    end

  end # Labels
end # GithubCLI
