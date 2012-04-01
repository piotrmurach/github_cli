# encoding: utf-8

require 'github_cli/command'

module GithubCLI
  class Repositories < Command

    namespace :repo

    desc 'list', 'Lists all repositories'
    method_option :org, :type => :string, :aliases => ["-o"],
                  :desc => 'List repositories for <organization>',
                  :banner => '<organization>'
    method_option :user, :type => :string, :aliases => ["-u"],
                  :desc => 'List repositories for <user>',
                  :banner => '<user>'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def list
      if options[:org]
        options[:params]['org'] = options[:org]
      elsif options[:user]
        options[:params]['user'] = options[:user]
      end
      Repository.all options[:params]
    end

    desc 'get <user> <repo>', 'Get a repository'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def get(user, repo)
      Repository.get user, repo, options[:params]
    end

    desc 'create', 'Create a new repository for the authenticated user.'
    method_option :org, :type => :string, :aliases => ["-o"],
                  :desc => 'Create repository in <organization>',
                  :banner => '<organization>'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def create
      if options[:org]
        options[:params]['org'] = options[:org]
      end
      Repository.create user, repo, options[:params]
    end

    desc 'edit <user> <repo>', 'Edit <repo> for an <user>.'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def edit(user, repo)
      Repository.edit user, repo, options[:params]
    end

    desc 'branches <user> <repo>', 'List branches'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def branches(user, repo)
      Repository.branches user, repo, options[:params]
    end

    desc 'contributors <user> <repo>', 'List contributors'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def contributors(user, repo)
      Repository.contributors user, repo, options[:params]
    end

    desc 'languages <user> <repo>', 'Listing all languages'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def languages(user, repo)
      Repository.languages user, repo, options[:params]
    end

    desc 'tags <user> <repo>', 'Listing all tags'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def tags(user, repo)
      Repository.tags user, repo, options[:params]
    end

    desc 'teams <user> <repo>', 'Listing all teams'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def teams(user, repo)
      Repository.teams user, repo, options[:params]
    end

  end # Repositories
end # GithubCLI
