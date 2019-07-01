# frozen_string_literal: true

require_relative '../apis/member'
require_relative '../util'
require_relative '../command'

module GithubCLI
  class Commands::Members < Command

    namespace :member

    desc 'list [--public] <org>', "Lists an organization members"
    long_desc <<-DESC
      List all users who are members of an organization. A member is a user
      that belongs to at least 1 team in the organization.

      If the authenticated user is also a member of this organization then
      both concealed and public members will be returned.
      Otherwise only public members are returned.

      Members of an organization can choose to have their membership publicized or not.
    DESC
    method_option :public, :type => :boolean, :default => false,
                  :desc => 'List public members'
    def list(org)
      global_options = options.dup
      params = options[:params].dup
      params_remove = params.keys + ['params']

      if options[:public]
        params['public'] = true
        params_remove << 'public'
      end
      Util.hash_without!(global_options, params_remove)
      Member.all org, params, global_options
    end

    desc 'member [--public] <org> <user>', 'Checks if user is a member of an organization'
    method_option :public, :type => :boolean, :default => false,
                  :desc => 'Get if a user is a public member of an organization'
    def member(org, user)
      global_options = options.dup
      params = options[:params].dup
      params_remove = params.keys + ['params']

      if options[:public]
        params['public'] = true
        params_remove << 'public'
      end
      Util.hash_without!(global_options, params_remove)
      Member.member? org, user, params, global_options
    end

    desc 'delete <org> <user>', 'Remove a member from an organization'
    long_desc <<-DESC
      Removing a user from this list will remove them from all teams and they
      will no longer have any access to the organization’s repositories.
    DESC
    def delete(org, user)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Member.delete org, user, params, global_options
    end

    desc 'publicize <org> <user>', "Publicize a user’s membership"
    def publicize(org, user)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Member.publicize org, user, params, global_options
    end

    desc 'conceal <org> <user>', "Conceal a user’s membership"
    def conceal(org, user)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Member.conceal org, user, params, global_options
    end
  end # Members
end # GithubCLI
