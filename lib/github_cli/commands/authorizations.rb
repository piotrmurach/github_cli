# encoding: utf-8

module GithubCLI
  class Commands::Authorizations < Command

    namespace :auth

    desc 'list', 'Lists your authorizations'
    long_desc <<-DESC
      You can only list your own tokens, and only through Basic Authentication.
    DESC
    def list
      Authorization.all options[:params], options[:format]
    end

    desc 'get <id>', 'Get a single authorization'
    long_desc <<-DESC
      You can only access your own token, and only through Basic Authentication.
    DESC
    def get(id)
      Authorization.get id, options[:params], options[:format]
    end

    desc 'create', 'Create a new authorization'
    long_desc <<-DESC
      You can only create your own token, and only through Basic Authentication.\n

      Inputs

      scopes - Optional array - A list of scopes that this authorization is in.\n
      note - Optional string - A note to remind you what the OAuth token is for.\n
      note_url - Optional string - A URL to remind you what the OAuth token is for.
    DESC
    def create
      Authorization.create options[:params], options[:format]
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
      Authorization.update id, options[:params], options[:format]
    end

    desc 'delete <id>', 'Delete an authorization'
    def delete(id)
      Authorization.delete id, options[:params], options[:format]
    end

  end # Authorizations
end # GithubCLI
