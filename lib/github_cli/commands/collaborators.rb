# encoding: utf-8

module GithubCLI
  class Commands::Collaborators < Command

    namespace :collab

    desc 'list <user> <repo>', 'Lists collaborators'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additional request parameters e.i per_page:100'
    def list(user, repo)
      Collaborator.all user, repo, options[:params]
    end

    desc 'add <user> <repo> <collab>', 'Add a collaborator'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additional request parameters e.i per_page:100'
    def add(user, repo, collab)
      Collaborator.add user, repo, collab, options[:params]
    end

    desc 'collab <user> <repo> <collab>', 'Checks if user is a collaborator on a given repo'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additional request parameters e.i per_page:100'
    def collab(user, repo, collab)
      Collaborator.collaborator? user, repo, collab, options[:params]
    end

    desc 'remove <user> <repo> <id>', 'Remove a collaborator'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def remove(user, repo, collab)
      Collaborator.remove user, repo, collab, options[:params]
    end

  end # Collaborators
end # GithubCLI
