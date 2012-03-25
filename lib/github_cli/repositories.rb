# encoding: utf-8

require 'github_cli/command'

module GithubCLI
  class Repositories < Command

    namespace :repo

    option :orgs, :type => :boolean,
           :desc => 'List repositories for <organization>'
    desc 'list', 'Listing all repositories'
    def list
      say 'listing'
    end

    desc 'get', 'Get a repository'
    def get
    end

    desc 'create', 'Create <repo> <user>'
    def create
      say 'creating...'
    end

    desc 'remove', 'Remove <repo> <user>'
    def remove
      say 'removing'
    end

  end # Repositories
end # GithubCLI
