# frozen_string_literal: true

require_relative '../apis/search'
require_relative '../util'
require_relative '../command'

module GithubCLI
  module Commands
    class Search < Command

      namespace :search

      option :state, :type => :string, :aliases => ["-s"], :desc => 'Repository name'
      desc 'issue <owner> <repo> <keyword>', 'Search issues'
      long_desc <<-DESC
        Search issues

        Parameters

        state - open or closed. \n
        keyword - search term
      DESC
      def issue(owner, repo, keyword)
        global_options = options.dup
        params = options[:params].dup
        params['owner']   = owner
        params['repo']    = repo
        params['keyword'] = keyword
        params['state']   = options[:state] if options[:state]
        Util.hash_without!(global_options, params.keys + ['params'])
        Search.issue params, global_options
      end

      desc 'repo <keyword>', 'Repository search'
      def repo(keyword)
        global_options = options.dup
        params = options[:params].dup
        params['keyword'] = keyword
        Util.hash_without!(global_options, params.keys + ['params'])
        Search.repo params, global_options
      end

      desc 'user <keyword>', 'User search'
      def user(keyword)
        global_options = options.dup
        params = options[:params].dup
        params['keyword'] = keyword
        Util.hash_without!(global_options, params.keys + ['params'])
        Search.user params, global_options
      end

      desc 'email <email>', 'Email search'
      def email(email)
        global_options = options.dup
        params = options[:params].dup
        params['email'] = email
        Util.hash_without!(global_options, params.keys + ['params'])
        Search.email params, global_options
      end
    end # Search
  end # Commands
end # GithubCLI
