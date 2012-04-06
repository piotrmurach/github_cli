# encoding: utf-8

require 'github_cli/command'

module GithubCLI
  class Commands::Labels < Command

    namespace :label

    desc 'list', 'Listing all labels for this repository.'
    def list
    end

    desc 'get <user>, <repo>', 'Get a single label.'
    method_option :name, :type => :string, :required => true
    def get(user, repo)
    end

    desc 'create <user>, <repo>', 'Create a label.'
    method_option :params, :type => :hash
    def create(user, repo)
    end

    method_option :name, :type => :string, :required => true
    desc 'update <user>, <repo>', 'Create a label.'
    method_option :params, :type => :hash
    def update(user, repo)
    end

    method_option :name, :type => :string, :required => true
    desc 'delete <user>, <repo>', 'Delete a label.'
    method_option :params, :type => :hash
    def delete(user, repo)
    end

  end # Labels
end # GithubCLI
