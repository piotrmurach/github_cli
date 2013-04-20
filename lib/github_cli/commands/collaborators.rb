# encoding: utf-8

module GithubCLI
  class Commands::Collaborators < Command

    namespace :collab

    desc 'list <owner> <repo>', 'Lists collaborators'
    def list(owner, repo)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Collaborator.all owner, repo, params, global_options
    end

    desc 'add <owner> <repo> <user>', 'Add a collaborator'
    def add(owner, repo, user)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Collaborator.add owner, repo, user, params, global_options
    end

    desc 'collab <owner> <repo> <user>', 'Checks if user is a collaborator on a given repo'
    def collab(owner, repo, user)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Collaborator.collaborator? owner, repo, user, params, global_options
    end

    desc 'remove <owner> <repo> <user>', 'Remove a collaborator'
    def remove(owner, repo, user)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Collaborator.remove owner, repo, user, params, global_options
    end

  end # Collaborators
end # GithubCLI
