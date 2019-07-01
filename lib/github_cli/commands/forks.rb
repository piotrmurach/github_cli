# frozen_string_literal: true

require_relative '../apis/fork'
require_relative '../util'
require_relative '../command'

module GithubCLI
  module Commands
    class Forks < Command

      namespace :fork

      option :sort, :type => :string, :aliases => ["-s"],
            :banner => '<sort-category>',
            :desc => 'Sort by newest, oldest or watchers'
      desc 'list <user> <repo>', 'Lists forks'
      long_desc <<-DESC
        List repository forks

        Parameters

        sort - newest, oldest, watchers, default: newest
      DESC
      def list(user, repo)
        global_options = options.dup
        params = options[:params].dup
        params['sort'] = options[:sort] if options[:sort]
        Util.hash_without!(global_options, params.keys + ['params'])
        Fork.all user, repo, params, global_options
      end

      option :org, :type => :string,
            :desc => 'Organization login. The repository will be forked into this organization.'
      desc 'create <user> <repo>', 'Create a new fork'
      def create(user, repo)
        global_options = options.dup
        params = options[:params].dup
        params['organization'] = options[:org] if options[:org]
        Util.hash_without!(global_options, params.keys + ['params', 'org'])
        Fork.create user, repo, params, global_options
      end
    end # Forks
  end # Commands
end # GithubCLI
