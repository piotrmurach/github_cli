# encoding: utf-8

module GithubCLI
  class Commands::Collaborators < Command

    namespace :collab

    desc 'list <user> <repo>', 'Lists collaborators'
    def list(user, repo)
      Collaborator.all user, repo, options[:params], options[:format]
    end

    desc 'add <user> <repo> <collab>', 'Add a collaborator'
    def add(user, repo, collab)
      Collaborator.add user, repo, collab, options[:params], options[:format]
    end

    desc 'collab <user> <repo> <collab>', 'Checks if user is a collaborator on a given repo'
    def collab(user, repo, collab)
      Collaborator.collaborator? user, repo, collab, options[:params], options[:format]
    end

    desc 'remove <user> <repo> <id>', 'Remove a collaborator'
    def remove(user, repo, collab)
      Collaborator.remove user, repo, collab, options[:params], options[:format]
    end

  end # Collaborators
end # GithubCLI
