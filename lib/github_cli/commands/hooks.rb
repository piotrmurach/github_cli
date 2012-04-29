# encoding: utf-8

module GithubCLI
  class Commands::Hooks < Command

    namespace :hook

    desc 'list <user> <repo>', 'Lists hooks'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additional request parameters e.i per_page:100'
    def list(user, repo)
      Hook.all user, repo, options[:params]
    end

    desc 'get <user> <repo> <id>', 'Get a hook'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additional request parameters e.i per_page:100'
    def get(user, repo, id)
      Hook.get user, repo, id, options[:params]
    end

    desc 'create <user> <repo>', 'Create a hook'
    long_desc <<-DESC
      Inputs

      name - Required string - the name of the service that is being called.\n
      config - Required hash - A Hash containing key/value pairs to provide settings for this hook. \n
      events - Optional array - Determines what events the hook is triggered for. Default: ["push"] \n
      active - Optional boolean - Determines whether the hook is actually triggered on pushes.
    DESC
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def create(user, repo)
      Hook.create user, repo, options[:params]
    end

    desc 'edit <user> <repo> <id>', 'Edit a hook'
    long_desc <<-DESC
      Inputs

      name - Required string - the name of the service that is being called. \n
      config - Required hash - A Hash containing key/value pairs to provide settings for this hook. \n
      events - Optional array - Determines what events the hook is triggered for. This replaces the entire array of events. Default: ["push"]. \n
      add_events - Optional array - Determines a list of events to be added to the list of events that the Hook triggers for. \n
      remove_events - Optional array - Determines a list of events to be removed from the list of events that the Hook triggers for. \n
      active - Optional boolean - Determines whether the hook is actually triggered on pushes. \n
    DESC
    def edit(user, repo, id)
      Hook.edit user, repo, id, options[:params]
    end

    desc 'test <user> <repo> <id>', 'Test a hook'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def test(user, repo, id)
      Hook.test user, repo, id, options[:params]
    end

    desc 'delete <user> <repo> <id>', 'Delete a hook'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def delete(user, repo, id)
      Hook.delete user, repo, id, options[:params]
    end

  end # Hooks
end # GithubCLI
