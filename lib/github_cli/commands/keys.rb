# frozen_string_literal: true

require_relative '../apis/key'
require_relative '../util'
require_relative '../command'

module GithubCLI
  module Commands
    class Keys < Command

      namespace :key

      desc 'list <user> <repo>', 'Lists keys'
      def list(user, repo)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ['params'])
        Key.all user, repo, params, global_options
      end

      desc 'get <user> <repo> <id>', 'Get a key'
      def get(user, repo, id)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ['params'])
        Key.get user, repo, id, params, global_options
      end

      desc 'create <user> <repo>', 'Create a new key'
      long_desc <<-DESC
        Inputs

        title - Required string. \n
        key - Required string.
      DESC
      def create(user, repo)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ['params'])
        Key.create user, repo, params, global_options
      end

      desc 'edit <user> <repo> <id>', 'Edit a key'
      long_desc <<-DESC
        Inputs

        title - Required string. \n
        key - Required string.
      DESC
      def edit(user, repo, id)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ['params'])
        Key.edit user, repo, id, params, global_options
      end

      desc 'delete <user> <repo> <id>', 'Delete a key'
      def delete(user, repo, id)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ['params'])
        Key.delete user, repo, id, params, global_options
      end
    end # Keys
  end # Commands
end # GithubCLI
