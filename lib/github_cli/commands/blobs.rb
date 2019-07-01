# frozen_string_literal: true

require_relative '../apis/blob'
require_relative '../util'
require_relative '../command'

module GithubCLI
  module Commands
    class Blobs < Command

      namespace :blob

      desc 'get <user> <repo> <sha>', 'Get a Blob'
      def get(user, repo, sha)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ['params'])

        Blob.get user, repo, sha, params, global_options
      end

      option :content, :type => :string
      option :encoding, :type => :string, :banner => "utf-8|base64",
            :desc => "String containing encoding utf-8 or base64"
      desc 'create <user> <repo>', 'Create a new Blob'
      long_desc <<-DESC
        Inputs

          content - String of content \n
          encoding - String containing encoding utf-8 or base64
      DESC
      def create(user, repo)
        global_options = options.dup
        params = options[:params].dup
        params['content']  = options[:content]  if options[:content]
        params['encoding'] = options[:encoding] if options[:encoding]
        Util.hash_without!(global_options, params.keys + ['params'])

        Blob.create user, repo, params, global_options
      end
    end # Blobs
  end # Commands
end # GithubCLI
