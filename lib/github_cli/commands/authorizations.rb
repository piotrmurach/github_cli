# encoding: utf-8

module GithubCLI
  class Commands::Authorizations < Command

    namespace :auth

    desc 'list', 'Lists your authorizations'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additional request parameters e.i per_page:100'
    def list
      Authorization.all options[:params]
    end

    desc 'get <id>', 'Get a single authorization'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additional request parameters e.i per_page:100'
    def get(id)
      Authorization.get id, options[:params]
    end

    desc 'create <user> <repo>', 'Create a new authorization'
    long_desc <<-DESC
      Inputs

      scopes - Optional array - A list of scopes that this authorization is in.\n
      note - Optional string - A note to remind you what the OAuth token is for.\n
      note_url - Optional string - A URL to remind you what the OAuth token is for.
    DESC
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def create
      Authorization.create options[:params]
    end

    desc 'update <id>', 'Update an existing authorization'
    long_desc <<-DESC
      Inputs

      scopes - Optional array - A list of scopes that this authorization is in.\n
      add_scopes - Optional array - A list of scopes to add to this authorization.\n
      remove_scopes - Optional array - A list of scopes to remove from this authorization.\n
      note - Optional string - A note to remind you what the OAuth token is for.\n
      note_url - Optional string - A URL to remind you what the OAuth token is for.
    DESC
    def update(id)
      Authorization.update id, options[:params]
    end

    desc 'delete <id>', 'Delete an authorization'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def delete(id)
      Authorization.delete id, options[:params]
    end

  end # Authorizations
end # GithubCLI
