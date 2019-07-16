# frozen_string_literal: true

require_relative "../apis/tag"
require_relative "../util"
require_relative "../command"

module GithubCLI
  module Commands
    class Tags < Command

      namespace :tag

      desc "get <user> <repo> <sha>", "Get a Tag"
      method_option :recursive, :type => :boolean, :aliases => ["-r"],
                    :desc => "get a tree recursively"
      def get(user, repo, sha)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        Tag.get user, repo, sha, params, global_options
      end

      desc "create <user> <repo>", "Create a Tag Object"
      option :tag, :type => :string, :desc => "String of the tag", :required => true
      option :message, :type => :string, :aliases => ["-m"], :required => true,
        :desc => "String of the tag message"
      option :object, :type => :string, :banner => "<SHA>", :required => true,
        :desc => "String of the SHA of the git object this is tagging"
      option :type, :type => :string, :banner => "commit/tree/blob", :required => true,
        :desc => "String of the type of the object we're tagging."
      option :tagger, :type => :hash, :desc => "Tag author information"
      long_desc <<-DESC
        Note that creating a tag object does not create the reference that
        makes a tag in Git. If you want to create an annotated tag in Git,
        you have to do this call to create the tag object, and then create
        the refs/tags/[tag] reference. If you want to create a lightweight tag,
        you simply have to create the reference - this call would be unnecessary.

        Parameters

        tag - string - Required. The tag's name. This is typically a version (e.g., "v0.0.1").\n
        message string  Required. The tag message.\n
        object  string  Required. The SHA of the git object this is tagging.\n
        type  string  Required. The type of the object we're tagging. Normally this is a commit but it can also be a tree or a blob.\n
        tagger - hash - An object with information about the individual creating the tag.\n

        The tagger hash contains the following keys:

        name - string - The name of the author of the tag\n
        email - string - The email of the author of the tag\n
        date - string - When this object was tagged. This is a timestamp in ISO 8601 format: YYYY-MM-DDTHH:MM:SSZ.
      DESC
      def create(user, repo)
        global_options = options.dup
        params = options[:params].dup
        params["tag"]     = options[:tag]
        params["message"] = options[:message]
        params["object"]  = options[:object]
        params["type"]    = options[:type]
        params["tagger"]  = options[:tagger] if options.key?("tagger")
        Util.hash_without!(global_options, params.keys + ["params"])
        Tag.create user, repo, params, global_options
      end
    end # Tag
  end # Commands
end # GithubCLI
