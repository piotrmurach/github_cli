# encoding: utf-8

require 'github_cli/command'

module GithubCLI
  class Trees < Command

    namespace :tree

    desc 'get <user> <repo> <sha>', 'Get a Tree'
    method_option :recursive, :type => :boolean, :aliases => ["-r"],
                  :desc => 'get a tree recursively'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def get(user, repo, sha)
      if options[:recursive]
        options[:params]['recursive'] = true
      end
      Tree.get user, repo, sha, options[:params]
    end

    desc 'create <user> <repo>', 'Create a new Tree'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def create(user, repo)
      Tree.create user, repo, options[:params]
    end

  end # Blobs
end # GithubCLI
