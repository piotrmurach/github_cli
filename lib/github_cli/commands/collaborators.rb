# encoding: utf-8

module GithubCLI
  class Commands::Collaborators < Command

    namespace :collab

    desc 'list <owner> <repo>', 'Lists collaborators'
    def list(owner, repo)
      Collaborator.all owner, repo, options[:params], options[:format]
    end

    desc 'add <owner> <repo> <user>', 'Add a collaborator'
    def add(owner, repo, user)
      Collaborator.add owner, repo, user, options[:params], options[:format]
    end

    desc 'collab <owner> <repo> <user>', 'Checks if user is a collaborator on a given repo'
    def collab(owner, repo, user)
      Collaborator.collaborator? owner, repo, user, options[:params], options[:format]
    end

    desc 'remove <owner> <repo> <user>', 'Remove a collaborator'
    def remove(owner, repo, user)
      Collaborator.remove owner, repo, user, options[:params], options[:format]
    end

  end # Collaborators
end # GithubCLI
