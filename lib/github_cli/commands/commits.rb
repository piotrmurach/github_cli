# encoding: utf-8

module GithubCLI
  class Commands::Commits < Command

    namespace :commit

    desc 'get <user> <repo> <sha>', 'Get a Commit'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def get(user, repo, sha)
      Commit.get user, repo, sha, options[:params]
    end

    desc 'create <user> <repo>', 'Create a Commit'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def create(user, repo)
      Commit.create user, repo, options[:params]
    end

  end # Commit
end # GithubCLI
