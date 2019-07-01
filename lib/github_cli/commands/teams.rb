# frozen_string_literal: true

require_relative '../apis/team'
require_relative '../util'
require_relative '../command'

module GithubCLI
  class Commands::Teams < Command

    namespace :team

    desc 'list <org>', "List teams"
    def list(org)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Team.all org, params, global_options
    end

    desc 'get <id>', "Get a team"
    def get(id)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Team.get id, params, global_options
    end

    option :name, :type => :string, :required => true
    option :repo_names, :type => :array
    option :permission, :type => :string, :banner => "pull|push|admin"
    desc 'create <org>', "Create a team"
    long_desc <<-DESC
      In order to create a team, the authenticated user must be an owner of :org.

      Input

      name - Required string\n
      repo_names - Optional array of strings\n
      permission - Optional string\n
      *  pull - team members can pull, but not push or administor this repositories. Default\n
      * push - team members can pull and push, but not administor this repositores.\n
      * admin - team members can pull, push and administor these repositories.\n
    DESC
    def create(org)
      global_options = options.dup
      params = options[:params].dup
      params['name']       = options[:name]
      params['repo_names'] = options[:repo_names] if options[:repo_names]
      params['permission'] = options[:permission] if options[:permission]
      Util.hash_without!(global_options, params.keys + ['params'])
      Team.create org, params, global_options
    end

    option :name, :type => :string, :required => true
    option :permission, :type => :string, :banner => "pull|push|admin"
    desc 'edit <id>', "Edit team <id>"
    long_desc <<-DESC
      In order to edit a team, the authenticated user must be an owner of the org that the team is associated with.

      Input

      name - Required string\n
      permission - Optional string\n
      *  pull - team members can pull, but not push or administor this repositories. Default\n
      * push - team members can pull and push, but not administor this repositores.\n
      * admin - team members can pull, push and administor these repositories.\n
    DESC
    def edit(id)
      global_options = options.dup
      params = options[:params].dup
      params['name']       = options[:name]
      params['permission'] = options[:permission] if options[:permission]
      Util.hash_without!(global_options, params.keys + ['params'])
      Team.edit id, params, global_options
    end

    desc 'delete <id>', 'Delete team <id>'
    long_desc <<-DESC
      In order to delete a team, the authenticated user must be an owner of the org that the team is associated with.
    DESC
    def delete(id)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Team.delete id, params, global_options
    end

    desc 'list_member <id>', "List team <id> members"
    def list_member(id)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Team.all_member id, params, global_options
    end

    desc 'member <id> <user>', 'Check if <user> is a team member'
    long_desc <<-DESC
      In order to get if a user is a member of a team, the authenticated user must be a member of the team.
    DESC
    def member(id, user)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Team.member id, user, params, global_options
    end

    desc 'add_member <id> <user>', 'Add team member'
    long_desc <<-DESC
      In order to add a user to a team, the authenticated user must have ‘admin’ permissions to the team or be an owner of the org that the team is associated with.
    DESC
    def add_member(id, user)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Team.add_member id, user, params, global_options
    end

    desc 'remove_member <id> <user>', 'Remove team member'
    long_desc <<-DESC
      In order to remove a user from a team, the authenticated user must have
      ‘admin’ permissions to the team or be an owner of the org that the team
      is associated with. NOTE: This does not delete the user, it just remove
      them from the team.
    DESC
    def remove_member(id, user)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Team.remove_member id, user, params, global_options
    end

    desc 'list_repo <id>', "List team <id> repositories"
    def list_repo(id)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Team.all_repo id, params, global_options
    end

    desc 'repo <id> <user> <repo>', 'Check if <repo> is managed by team <id>'
    def repo(id, user, repo)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Team.repo id, user, repo, params, global_options
    end

    desc 'add_repo <id> <user> <repo>', 'Add team <repo>'
    long_desc <<-DESC
      In order to add a repo to a team, the authenticated user must be an owner
      of the org that the team is associated with. Also, the repo must be owned
      by the organization, or a direct for of a repo owned by the organization.
    DESC
    def add_repo(id, user, repo)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Team.add_repo id, user, repo, params, global_options
    end

    desc 'remove_repo <id> <user> <repo>', 'Remove team <repo>'
    long_desc <<-DESC
      In order to remove a repo from a team, the authenticated user must be an
      owner of the org that the team is associated with. NOTE: This does not
      delete the repo, it just removes it from the team.
    DESC
    def remove_repo(id, user, repo)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Team.remove_repo id, user, repo, params, global_options
    end
  end # Teams
end # GithubCLI
