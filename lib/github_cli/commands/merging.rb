# frozen_string_literal: true

require_relative "../apis/merging"
require_relative "../util"
require_relative "../command"

module GithubCLI
  module Commands
    class Merging < Command

      namespace :merge

      option :base, :type => :string, :required => true,
            :desc => "The name of the base branch that the head will be merged into"
      option :head, :type => :string, :required => true,
            :desc => "The head to merge. This can be a branch name or a commit SHA1"
      option :message, :type => :string,
            :desc => "Commit message to use for the merge commit"
      desc "perform <user> <repo>", "Perform merge"
      long_desc <<-DESC
        Inputs

        base - Required String - The name of the base branch that the head will be merged into.\n
        head - Required String - The head to merge. This can be a branch name or a commit SHA1. \n
        message - Optional String - Commit message to use for the merge commit. If omitted, a default message will be used.\n
      DESC
      def perform(user, repo)
        global_options = options.dup
        params = options[:params].dup
        params["base"] = options[:base] if options.key?("base")
        params["head"] = options[:head] if options.key?("head")
        params["commit_message"] = options[:message] if options.key?("message")
        Util.hash_without!(global_options, params.keys + ["params", "message"])
        GithubCLI::Merging.merge user, repo, params, global_options
      end
    end # Merging
  end # Commands
end # GithubCLI
