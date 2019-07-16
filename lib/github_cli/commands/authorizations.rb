# frozen_string_literal: true

require_relative "../apis/authorization"
require_relative "../util"
require_relative "../command"

module GithubCLI
  module Commands
    class Authorizations < Command

      namespace :auth

      desc "list", "Lists your authorizations"
      long_desc <<-DESC
        You can only list your own tokens, and only through Basic Authentication.
      DESC
      def list
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        Authorization.all params, global_options
      end

      desc "get <id>", "Get a single authorization"
      long_desc <<-DESC
        You can only access your own token, and only through Basic Authentication.
      DESC
      def get(id)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        Authorization.get id, params, global_options
      end

      desc "create", "Create a new authorization"
      option :scopes, :type => :array, :banner => "user public_repo repo...",
        :desc => "A list of scopes that this authorization is in."
      option :note, :type => :string, :required => true,
        :desc => "A note to remind you what the OAuth token is for."
      option :note_url, :type => :string,
        :desc => "A URL to remind you what the OAuth token is for."
      option :client_id, :type => :string,
             :desc => "The 20 character OAuth app client key for which to create the token."
      option :client_secret, :type => :string,
        :desc => "The 40 character OAuth app client secret for which to create the token."
      option :fingerprint, :type => :string,
             :desc => "A unique string to distinguish an authorization from others created for the same client ID and user."
      long_desc <<-DESC
        You can only create your own token, and only through Basic Authentication.\n

        Inputs

        scopes - array - A list of scopes that this authorization is in.\n
        note -  string - Required. A note to remind you what the OAuth token is for. Tokens not associated with a specific OAuth application (i.e. personal access tokens) must have a unique note.\n
        note_url - string - A URL to remind you what app the OAuth token is for.\n
        client_id - string - The 20 character OAuth app client key for which to create the token.\n
        client_secret - string - The 40 character OAuth app client secret for which to create the token.\n
        fingerprint - string - A unique string to distinguish an authorization from others created for the same client ID and user.
      DESC
      def create
        global_options     = options.dup
        params             = options[:params].dup
        params["scopes"]   = options[:scopes]   if options.key?("scopes")
        params["note"]     = options[:note]     if options.key?("note")
        params["note_url"] = options[:note_url] if options.key?("note_url")
        params["client_id"] = options[:note_url] if options.key?("client_id")
        params["client_secret"] = options[:note_url] if options.key?("client_secret")
        params["fingerprint"] = options[:fingerprint] if options.key?("fingerprint")
        Util.hash_without!(global_options, params.keys + ["params"])
        Authorization.create(params, global_options)
      end

      desc "update <id>", "Update an existing authorization"
      option :scopes, :type => :array, :banner => "user public_repo repo...",
        :desc => "A list of scopes that this authorization is in."
      option :add_scopes, :type => :array,
        :desc => "A list of scopes to add to this authorization."
      option :remove_scopes, :type => :array,
        :desc => "A list of scopes to remove from this authorization."
      option :note, :type => :string,
        :desc => "A note to remind you what the OAuth token is for."
      option :note_url, :type => :string,
        :desc => "A URL to remind you what the OAuth token is for."
      option :fingerprint, :type => :string,
        :desc => "A unique string to distinguish an authorization from others created for the same client ID and user."
      long_desc <<-DESC
        Inputs

        scopes - Optional array - A list of scopes that this authorization is in.\n
        add_scopes - Optional array - A list of scopes to add to this authorization.\n
        remove_scopes - Optional array - A list of scopes to remove from this authorization.\n
        note - Optional string - A note to remind you what the OAuth token is for.\n
        note_url - Optional string - A URL to remind you what the OAuth token is for.
        fingerprint - string - A unique string to distinguish an authorization from others created for the same client ID and user.
      DESC
      def update(id)
        global_options = options.dup
        params                  = options[:params].dup
        params["scopes"]        = options[:scopes] if options.key?("scopes")
        params["add_scopes"]    = options[:add_scopes] if options.key?("add_scopes")
        params["remove_scopes"] = options[:remove_scopes] if options.key?("remove_scopes")
        params["note"]          = options[:note] if options.key?("note")
        params["note_url"]      = options[:note_url] if options.key?("note_url")
        params["fingerprint"]   = options[:note_url] if options.key?("fingerprint")
        Util.hash_without!(global_options, params.keys + ["params"])
        Authorization.update(id, params, global_options)
      end

      desc "delete <id>", "Delete an authorization"
      def delete(id)
        global_options = options.dup
        params         = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        Authorization.delete(id, params, global_options)
      end
    end # Authorizations
  end # Commands
end # GithubCLI
