# frozen_string_literal: true

require_relative "../apis/release"
require_relative "../util"
require_relative "../command"

module GithubCLI
  module Commands
    class Releases < Command

      namespace :release

      desc "list <owner> <repo>", "Lists releases for a repository"
      def list(owner, repo)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        Release.all(owner, repo, params, global_options)
      end

      desc "get <owner> <repo> <id>", "Get a single release"
      def get(owner, repo, id)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        Release.get(owner, repo, id, params, global_options)
      end

      desc "latest <owner> <repo>", "Get the latest release"
      def latest(owner, repo)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        Release.latest(owner, repo, params, global_options)
      end

      option :tag_name, :type => :string, :required => true, :desc => "The name of the tag."
      option :target_commitish, :type => :string, :desc => "Specifies the commitish value that determines where the Git tag is created from."
      option :name, :type => :string, :desc => "The name of the release."
      option :body, :type => :string, :desc => "Text describing the contents of the tag."
      option :draft, :type => :boolean, :desc => "true to create a draft (unpublished) release, false to create a published one. Default: false"
      option :prerelease, :type => :boolean, :desc => "true to identify the release as a prerelease. false to identify the release as a full release. Default: false"
      desc "create <owner> <repo>", "Create a release"
      long_desc <<-DESC
        Create a new download resource

        Users with push access to the repository can create a release.

        Inputs

          tag_name - string - Required. The name of the tag.\n
          target_commitish - string - Specifies the commitish value that determines where the Git tag is created from. Can be any branch or commit SHA. Unused if the Git tag already exists. Default: the repository's default branch (usually master).\n
          name - string - The name of the release.\n
          body - string - Text describing the contents of the tag.\n
          draft - boolean true to create a draft (unpublished) release, false to create a published one. Default: false\n
          prerelease - boolean - true to identify the release as a prerelease. false to identify the release as a full release. Default: false\n
      DESC
      def create(owner, repo)
        global_options = options.dup
        params = options[:params].dup
        params["tag_name"] = options[:tag_name]
        params["target_commitish"]  = options[:target_commitish] if options[:target_commitish]
        params["name"]  = options[:name] if options.key?("name")
        params["body"]  = options[:body] if options.key?("body")
        params["draft"] = options[:draft] if options.key?("draft")
        params["prerelease"] = options["prerelease"] if options.key?("prerelease")
        Util.hash_without!(global_options, params.keys + ["params"])
        Release.create(owner, repo, params, global_options)
      end

      option :tag_name, :type => :string, :required => true, :desc => "The name of the tag."
      option :target_commitish, :type => :string, :desc => "Specifies the commitish value that determines where the Git tag is created from."
      option :name, :type => :string, :desc => "The name of the release."
      option :body, :type => :string, :desc => "Text describing the contents of the tag."
      option :draft, :type => :boolean, :desc => "true to create a draft (unpublished) release, false to create a published one. Default: false"
      option :prerelease, :type => :boolean, :desc => "true to identify the release as a prerelease. false to identify the release as a full release. Default: false"
      desc "edit <owner> <repo>", "Edit a release"
      long_desc <<-DESC
        Edit a release

        Users with push access to the repository can edit a release.

        Inputs

          tag_name - string - Required. The name of the tag.\n
          target_commitish - string - Specifies the commitish value that determines where the Git tag is created from. Can be any branch or commit SHA. Unused if the Git tag already exists. Default: the repository's default branch (usually master).\n
          name - string - The name of the release.\n
          body - string - Text describing the contents of the tag.\n
          draft - boolean true to create a draft (unpublished) release, false to create a published one. Default: false\n
          prerelease - boolean - true to identify the release as a prerelease. false to identify the release as a full release. Default: false\n
      DESC
      def edit(owner, repo)
        global_options = options.dup
        params = options[:params].dup
        params["tag_name"] = options[:tag_name]
        params["target_commitish"]  = options[:target_commitish] if options.key?("target_commitish")
        params["name"]  = options[:name] if options.key?("name")
        params["body"]  = options[:body] if options.key?("body")
        params["draft"] = options[:draft] if options.key?("draft")
        params["prerelease"] = options["prerelease"] if options.key?("prerelease")
        Util.hash_without!(global_options, params.keys + ["params"])
        Release.edit(owner, repo, params, global_options)
      end

      desc "delete <owner> <repo> <id>", "Delete a release"
      def delete(owner, repo, id)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        Release.delete(owner, repo, id, params, global_options)
      end
    end # Downloads
  end # Commands
end # GithubCLI
