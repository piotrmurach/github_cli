# frozen_string_literal: true

require_relative '../apis/status'
require_relative '../util'
require_relative '../command'

module GithubCLI
  module Commands
    class Statuses < Command

      namespace :status

      desc 'list <user> <repo> <sha>', 'Lists statuses for a <sha>'
      def list(user, repo, sha)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ['params'])
        Status.all user, repo, sha, params, global_options
      end

      option :state, :type => :string, :required => true,
            :banner => "pending|success|error|failure",
            :desc => "State of the status"
      option :target, :type => :string, :banner => "url",
            :desc => "Target url to associate with this status"
      option :desc, :type => :string, :desc => "Short description of the status"
      desc 'create <user> <repo> <sha>', 'Create a status'
      long_desc <<-DESC
        Inputs

        state - Required string - State of the status - can be one of pending, success, error, or failure.\n
        target_url - Optional string - Target url to associate with this status. This URL will be linked from the GitHub UI to allow users to easily see the ‘source’ of the Status. \n
        description - Optional string - Short description of the status\n
      DESC
      def create(user, repo, sha)
        global_options = options.dup
        params = options[:params].dup
        params['state']       = options[:state]  if options[:state]
        params['target_url']  = options[:target] if options[:target]
        params['description'] = options[:desc]   if options[:desc]
        Util.hash_without!(global_options, params.keys + ['params', 'target'])
        Status.create user, repo, sha, params, global_options
      end
    end # Statuses
  end # Commands
end # GithubCLI
