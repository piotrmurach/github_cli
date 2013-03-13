# encoding: utf-8

module GithubCLI
  class Commands::Labels < Command

    namespace :label

    desc 'list <user> <repo>', 'Listing all labels for this repository.'
    method_option :milestone, :type => :string, :aliases => ["-m"],
                  :desc => 'List labels for every issue in a milestone.',
                  :banner => '<milestone>'
    method_option :issue, :type => :string, :aliases => ["-i"],
                  :desc => 'List labels on an issue.',
                  :banner => '<issue>'
    def list(user, repo)
      params = options[:params].dup
      if (milestone_id = options[:milestone])
        params['milestone_id'] = milestone_id
      elsif (issue_id = options[:issue])
        params['issue_id'] = issue_id
      end
      Label.all user, repo, params, options[:format]
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

    desc 'add <user> <repo> <number> <label>[<label>...]', 'Add labels to issue <number>.'
    def add(user, repo, number, *args)
      Label.add user, repo, number, args, options[:params], options[:format]
    end

    desc 'remove <user> <repo> [<name>/]<number>', 'Remove label<name> from an issue<number>'
    def remove(user, repo, number)
      name, number  = Arguments.new(number).parse
      Label.remove user, repo, number, name, options[:params], options[:format]
    end

    desc 'replace <user> <repo> <number> <label>[<label>...]', 'Replace all labels for an issue <number>.'
    def replace(user, repo, number, *args)
      Label.replace user, repo, number, args, options[:params], options[:format]
    end

  end # Labels
end # GithubCLI
