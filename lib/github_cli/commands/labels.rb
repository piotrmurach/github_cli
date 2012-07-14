# encoding: utf-8

module GithubCLI
  class Commands::Labels < Command

    namespace :label

    desc 'list <user> <repo>', 'Listing all labels for this repository.'
    def list(user, repo)
      Label.all user, repo, options[:params], options[:format]
    end

    desc 'get <user> <repo> <name>', 'Get a single label.'
    def get(user, repo, name)
      Label.get user, repo, name, options[:params], options[:format]
    end

    desc 'create <user> <repo>', 'Create a label.'
    long_desc <<-DESC
      Inputs
        name - Required string
        color - Required string - 6 character hex code, without leading #
    DESC
    def create(user, repo)
      Label.create user, repo, options[:params], options[:format]
    end

    desc 'update <user> <repo> <name>', 'Update a label.'
    def update(user, repo, name)
      Label.update user, repo, name, options[:params], options[:format]
    end

    desc 'delete <user> <repo> <name>', 'Delete a label.'
    def delete(user, repo, name)
      Label.delete user, repo, name, options[:params], options[:format]
    end

    desc 'issue <user> <repo> <number>', 'List labels on an issue.'
    def issue(user, repo, number)
      Label.issue user, repo, number, options[:params], options[:format]
    end

    desc 'add <user> <repo> <issue_id> <label>[<label>...]', 'Add labels to <issue_id>.'
    def add(user, repo, issue_id, *args)
      Label.add user, repo, issue_id, *args, options[:params], options[:format]
    end

    desc 'remove <user> <repo> [<label_id>/]<issue_id>', 'Remove <label_id> from an <issue_id>'
    def remove(user, repo, number)
      label_id, issue_id  = Arguments.new(number).parse
      Label.remove user, repo, issue_id, label_id, options[:params], options[:format]
    end

    desc 'replace <user> <repo> <issue_id> <label>[<label>...]', 'Replace all labels for an <issue_id>.'
    def replace(user, repo, issue_id, *args)
      Label.replace user, repo, issue_id, *args, options[:params], options[:format]
    end

    desc 'milestone <user> <repo> <number>', 'Get labels for every issue in a milestone.'
    def milestone(user, repo, number)
      Label.milestone user, repo, number, options[:params], options[:format]
    end

  end # Labels
end # GithubCLI
