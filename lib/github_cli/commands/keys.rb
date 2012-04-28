# encoding: utf-8

module GithubCLI
  class Commands::Keys < Command

    namespace :key

    desc 'list <user> <repo>', 'Lists keys'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additional request parameters e.i per_page:100'
    def list(user, repo)
      Key.all user, repo, options[:params]
    end

    desc 'get <user> <repo> <id>', 'Get a key'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additional request parameters e.i per_page:100'
    def get(user, repo, id)
      Key.get user, repo, id, options[:params]
    end

    desc 'create <user> <repo>', 'Create a new key'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def create(user, repo)
      Key.create user, repo, options[:params]
    end

    desc 'edit <user> <repo> <id>', 'Edit a key'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def edit(user, repo, id)
      Key.edit user, repo, id, options[:params]
    end

    desc 'delete <user> <repo> <id>', 'Delete a key'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def delete(user, repo, id)
      Key.delete user, repo, id, options[:params]
    end

  end # Keys
end # GithubCLI
