# frozen_string_literal: true

require_relative "../apis/pull_request"
require_relative "../util"
require_relative "../command"

module GithubCLI
  module Commands
    class PullRequests < Command

      namespace :pull

      option :state, :type => :string,
        desc: "Either open, closed, or all to filter by state. Default: open"
      option :head, :type => :string,
        desc: "Filter pulls by head user or head organization and branch name in the format of user:ref-name or organization:ref-name. For example: github:new-script-format or octocat:test-branch."
      option :base, :type => :string,
        desc: "Filter pulls by base branch name. Example: gh-pages."
      option :sort, :type => :string,
        desc: "What to sort results by. Can be either created, updated, popularity (comment count) or long-running (age, filtering by pulls updated in the last month). Default: created"
      option :direction, :type => :string,
        desc: "The direction of the sort. Can be either asc or desc. Default: desc when sort is created or sort is not specified, otherwise asc."
      desc "list <user> <repo>", "List all Pull Requests"
      def list(user, repo)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        PullRequest.list user, repo, params, global_options
      end

      desc "get <user> <repo> <number>", "Get a Pull Request"
      def get(user, repo, number)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        PullRequest.get user, repo, number, params, global_options
      end

      desc "create <user> <repo>", "Create a new Pull Request"
      option :title, :type => :string,
        desc: "The title of the pull request."
      option :body, :type => :string,
        desc: "The name of the branch where your changes are implemented."
      option :base, :type => :string,
        :desc => "The branch you want your changes pulled into."
      option :head, :type => :string,
        :desc => "The branch where your changes are implemented"
      option :issue, :type => :numeric,
        desc: "The issue number in this repository to turn into a Pull Request."
      option :maintainer_can_modify, :type => :boolean,
        :desc => "Indicates whether maintainers can modify the pull request."
      option :draft, :type => :boolean,
        :desc => "Indicates whether the pull request is a draft."
      def create(user, repo)
        global_options = options.dup
        params = options[:params].dup
        params["title"] = options[:title] if options.key?("title")
        params["body"]  = options[:body]  if options.key?("body")
        params["base"]  = options[:base]  if options.key?("base")
        params["head"]  = options[:head]  if options.key?("head")
        params["issue"] = options[:issue] if options.key?("issue")
        params["draft"] = options[:draft] if options.key?("draft")
        params["maintainer_can_modify"]  = options[:maintainer_can_modify] if options.key?("maintainer_can_modify")
        Util.hash_without!(global_options, params.keys + ["params"])
        PullRequest.create user, repo, params, global_options
      end

      desc "update <user> <repo> <number>", "Update a Pull Request"
      option :title, :type => :string,
        desc: "The title of the pull request."
      option :body, :type => :string,
        desc: "The name of the branch where your changes are implemented."
      option :base, :type => :string,
        :desc => "The branch you want your changes pulled into."
      option :state, :type => :string,
        :desc => "State of this Pull Request. Valid values are open and closed"
      option :maintainer_can_modify, :type => :boolean,
        :desc => "Indicates whether maintainers can modify the pull request."
      def update(user, repo, number)
        global_options = options.dup
        params = options[:params].dup
        params["title"] = options[:title] if options.key?("title")
        params["body"]  = options[:body]  if options.key?("body")
        params["base"]  = options[:base]  if options.key?("base")
        params["state"] = options[:state] if options.key?("state")
        params["maintainer_can_modify"]  = options[:maintainer_can_modify] if options.key?("maintainer_can_modify")
        Util.hash_without!(global_options, params.keys + ["params"])
        PullRequest.update user, repo, number, params, global_options
      end

      desc "commits <user> <repo> <number>", "List commits on a Pull Request"
      def commits(user, repo, number)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        PullRequest.commits user, repo, number, params, global_options
      end

      desc "files <user> <repo> <number>", "List Pull Requests Files"
      def files(user, repo, number)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        PullRequest.files user, repo, number, params, global_options
      end

      desc "merged <user> <repo> <number>", "Get if a pull request has been merged"
      def merged(user, repo, number)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        PullRequest.merged user, repo, number, params, global_options
      end

      desc "merge <user> <repo> <number>", "Merge a pull request"
      def merge(user, repo, number)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        PullRequest.merge user, repo, number, params, global_options
      end
    end # PullRequests
  end # Commands
end # GithubCLI
