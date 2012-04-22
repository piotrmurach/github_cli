# encoding: utf-8

module GithubCLI
  class Commands::Labels < Command

    namespace :label

    desc 'list <user> <repo>', 'Listing all labels for this repository.'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def list(user, repo)
      Label.all user, repo, options[:params]
    end

    desc 'get <user> <repo> <name>', 'Get a single label.'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def get(user, repo, name)
      Label.get user, repo, name, options[:params]
    end

    desc 'create <user> <repo>', 'Create a label.'
    long_desc <<-DESC
      Inputs
        name - Required string
        color - Required string - 6 character hex code, without leading #
    DESC
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def create(user, repo)
      Label.create user, repo, options[:params]
    end

    desc 'update <user> <repo> <name>', 'Update a label.'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def update(user, repo, name)
      Label.update user, repo, name, options[:params]
    end

    desc 'delete <user> <repo> <name>', 'Delete a label.'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def delete(user, repo, name)
      Label.delete user, repo, name, options[:params]
    end

    desc 'issue <user> <repo> <number>', 'List labels on an issue.'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def issue(user, repo, number)
      Label.issue user, repo, number, options[:params]
    end

    desc 'add <user> <repo> <number>', 'Add labels to an issue.'
    method_option :labels, :type => :string,
                  :desc => 'Labels to be added to this issue.'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additional request parameters e.i per_page:100'
    def add(user, repo, number)
      Label.add user, repo, number, options[:labels], options[:params]
    end

    desc 'remove <user> <repo> <number>', 'List labels on an issue.'
    method_option :name, :type => :string, :default => nil,
                  :desc => 'Label name'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def remove(user, repo, number)
      Label.issue user, repo, number, options[:name], options[:params]
    end

    desc 'replace <user> <repo> <number>', 'Replace all labels for an issue.'
    method_option :labels, :type => :string,
                  :desc => 'Labels to be replace in this issue.'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def replace(user, repo, number)
      Label.replace user, repo, number, options[:labels], options[:params]
    end

    desc 'milestone <user> <repo> <number>', 'Get labels for every issue in a milestone.'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def milestone(user, repo, number)
      Label.milestone user, repo, number, options[:params]
    end

  end # Labels
end # GithubCLI
