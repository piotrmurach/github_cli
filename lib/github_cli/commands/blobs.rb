# encoding: utf-8

require 'github_cli/command'

module GithubCLI
  class Commands::Blobs < Command

    namespace :blob

    desc 'get <user> <repo> <sha>', 'Get a Blob'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def get(user, repo)
      Blob.get user, repo, options[:params]
    end

    desc 'create <user> <repo>', 'Create a new Blob'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def create(user, repo, sha)
      Blob.create user, repo, sha, options[:params]
    end

  end # Blobs
end # GithubCLI
