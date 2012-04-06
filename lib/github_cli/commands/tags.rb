# encoding: utf-8

module GithubCLI
  class Commands::Tags < Command

    namespace :tag

    desc 'get <user> <repo> <sha>', 'Get a Tag'
    method_option :recursive, :type => :boolean, :aliases => ["-r"],
                  :desc => 'get a tree recursively'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def get(user, repo, sha)
      Tag.get user, repo, sha, options[:params]
    end

    desc 'create <user> <repo>', 'Create a Tag Object'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def create(user, repo)
      Tag.create user, repo, options[:params]
    end

  end # Tag
end # GithubCLI
