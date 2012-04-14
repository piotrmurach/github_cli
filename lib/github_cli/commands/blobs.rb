# encoding: utf-8

module GithubCLI
  class Commands::Blobs < Command

    namespace :blob

    desc 'get <user> <repo> <sha>', 'Get a Blob'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def get(user, repo, sha)
      Blob.get user, repo, sha, options[:params]
    end

    desc 'create <user> <repo>', 'Create a new Blob'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def create(user, repo)
      Blob.create user, repo, options[:params]
    end

  end # Blobs
end # GithubCLI
