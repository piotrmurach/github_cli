# frozen_string_literal: true

require_relative "../apis/reference"
require_relative "../util"
require_relative "../command"

module GithubCLI
  module Commands
    class References < Command

      namespace :ref

      desc "list <user> <repo>", "List all References"
      option :ref, :type => :string, :banner => "branch reference"
      def list(user, repo)
        global_options = options.dup
        params = options[:params].dup
        if options[:ref]
          params["ref"] = options[:ref]
        end
        Util.hash_without!(global_options, params.keys + ["params"])
        Reference.list(user, repo, params, global_options)
      end

      desc "get <user> <repo> <ref>", "Get a Reference"
      def get(user, repo, ref)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        Reference.get(user, repo, ref, params, global_options)
      end

      desc "create <user> <repo>", "Create a new Reference"
      option :ref, :type => :string, :required => true, :banner => "<ref>",
        :desc => "String of the name of the fully qualified reference (ie: refs/heads/master). If it doesn’t start with ‘refs’ and have at least two slashes, it will be rejected."
      option :sha, :type => :string, :required => true,
        :desc => "String of the SHA1 value to set this reference to."
      long_desc <<-DESC
        Inputs

        ref - String of the name of the fully qualified reference (ie: refs/heads/master). If it doesn’t start with ‘refs’ and have at least two slashes, it will be rejected.\n
        sha - String of the SHA1 value to set this reference to.
      DESC
      def create(user, repo)
        global_options = options.dup
        params = options[:params].dup
        params["ref"] = options[:ref]
        params["sha"] = options[:sha]
        Util.hash_without!(global_options, params.keys + ["params"])
        Reference.create(user, repo, params, global_options)
      end

      desc "update <user> <repo> <ref>", "Update a Reference"
      option :sha, :type => :string, :required => true,
        :desc => "String of the SHA1 value to set this reference to."
      option :force => false, :default => "false", :aliases => ["-f"],
        :desc => "Boolean indicating whether to force the update or to make sure the update is a fast-forward update."
      long_desc <<-DESC
        Inputs

        sha - String of the SHA1 value to set this reference to\n
        force - Boolean indicating whether to force the update or to make sure the update is a fast-forward update. The default is <tt>false</tt>, so leaving this out or setting it to false will make sure you’re not overwriting work.
      DESC
      def update(user, repo, ref)
        global_options = options.dup
        params = options[:params].dup
        params["sha"]   = options[:sha]
        params["force"] = options[:force] || false
        Util.hash_without!(global_options, params.keys + ["params"])
        Reference.update(user, repo, ref, params, global_options)
      end

      desc "delete <user> <repo> <ref>", "Delete a Reference"
      def delete(user, repo, ref)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        Reference.delete(user, repo, ref, params, global_options)
      end
    end # References
  end # Commands
end # GithubCLI
