# frozen_string_literal: true

require_relative "../apis/issue"
require_relative "../util"
require_relative "../command"

module GithubCLI
  module Commands
    class Issues < Command

      namespace :issue

      option :filter, :type => :string,
            :banner => "assigned|created|mentioned|subscribed|all"
      option :milstone, :type => :string,
            :banner => "number|none|*"
      option :creator, :type => :string,
            :desc => "user login"
      option :mentioned, :type => :string,
            :desc => "user login"
      option :state, :type => :string, :banner => "open|closed",
            :desc => "open, closed, default: open"
      option :labels, :type => :array,
            :desc => "list of comma separated Label names. Example: bug,ui,@high"
      option :sort, :type => :string, :banner => "created|updated|comments",
            :desc => "created, updated, comments, default: created"
      option :direction, :type => :string, :banner => "asc|desc",
            :desc => "asc or desc, default: desc"
      option :since, :type => :string,
            :desc => "string of a timestamp in ISO 8601 format: YYYY-MM-DDTHH:MM:SSZ"
      option :org, :type => :string, :aliases => ["-o"]
      option :user, :type => :string, :aliases => ["-u"]
      option :repo, :type => :string, :aliases => ["-r"]
      option :all, :type => :boolean,
            :desc => "List all issues across all the authenticated user’s visible repositories"
      desc "list", "List issues"
      long_desc <<-DESC
        ghc issue list --filter=assigned --state=open

        Parameters

          filter\n
            * assigned: Issues assigned to you (default) \n
            * created: Issues assigned to you (default) \n
            * mentioned: Issues assigned to you (default)\n
            * subscribed: Issues assigned to you (default)\n
          milestone:\n
            * Integer Milestone number\n
            * none for Issues with no Milestone.\n
            *  * for Issues with any Milestone\n
          assignee:\n
            * String User login\n
            * none for Issues with no assigned User.\n
            *  * for Issues with any assigned User.\n
          creator - string - user login\n
          mentioned - string - user login\n
          state - open, closed, default: open \n
          labels - String list of comma separated Label names. Example: bug,ui,@high
          sort - created, updated, comments, default: created \n
          direction - asc, desc, default: desc \n
          since - Optional string of a timestamp in ISO 8601 format: YYYY-MM-DDTHH:MM:SSZ \n
      DESC
      def list
        global_options = options.dup
        params = options[:params].dup
        params["org"]       = options[:org]       if options.key?("org")
        params["user"]      = options[:user]      if options.key?("user")
        params["repo"]      = options[:repo]      if options.key?("repo")
        params["filter"]    = options[:filter]    if options.key?("filter")
        params["milestone"] = options[:milestone] if options.key?("milestone")
        params["assignee"]  = options[:assignee]  if options.key?("assignee")
        params["creator"]   = options[:creator]   if options.key?("creator")
        params["mentioned"] = options[:mentioned] if options.key?("mentioned")
        params["sort"]      = options[:sort]      if options.key?("sort")
        params["state"]     = options[:state]     if options.key?("state")
        params["labels"]    = options[:labels]    if options.key?("labels")
        params["direction"] = options[:direction] if options.key?("direction")
        params["since"]     = options[:since]     if options.key?("since")

        arg = []
        arg = :user if !options[:all] && !(options[:user] || options[:org])
        Util.hash_without!(global_options, params.keys + ["params", "all"])

        Issue.all arg, params, global_options
      end

      desc "get <user> <repo> <number>", "Get a single issue"
      def get(user, repo, number)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        Issue.get(user, repo, number, params, global_options)
      end

      option :title, :type => :string, :required => true
      option :body, :type => :string
      option :assignee, :type => :string,
            :desc => "Login for the user that this issue should be assigned to."
      option :milestone, :type => :numeric,
            :desc => "Milestone to associate this issue with."
      option :labels, :type => :array,
            :desc => "Labels to associate with this issue."
      option :assignees, :type => :array,
            :desc => "Logins for Users to assign to this issue."
      desc "create <user> <repo>", "Create an issue."
      long_desc <<-DESC
        Parameters

          title - Required string\n
          body - Optional string\n
          assignee - Optional string - Login for the user that this issue should be assigned to.\n
          milestone - Optional number - Milestone to associate this issue with\n
          labels - Optional array of strings - Labels to associate with this issue
          assignees - Options array of strings - Logins for Users to assign to this issue

        Example

        ghc issue create wycats thor --title='Found a bug'
      DESC
      def create(user, repo)
        global_options = options.dup
        params = options[:params].dup
        params["title"]     = options[:title]
        params["body"]      = options[:body]      if options.key?("body")
        params["assignee"]  = options[:assignee]  if options.key?("assignee")
        params["milestone"] = options[:milestone] if options.key?("milestone")
        params["labels"]    = options[:labels]    if options.key?("labels")
        params["assignees"]    = options[:assignees] if options.key?("assignees")
        Util.hash_without!(global_options, params.keys + ["params"])
        Issue.create(user, repo, params, global_options)
      end

      option :title, :type => :string, :required => true
      option :body, :type => :string
      option :assignee, :type => :string,
            :desc => "Login for the user that this issue should be assigned to."
      option :state, :type => :string, :banner => "open|closed",
            :desc => "open, closed, default: open"
      option :milestone, :type => :string,
            :desc => "Milestone to associate this issue with."
      option :labels, :type => :array,
            :desc => "Labels to associate with this issue."
      option :assignees, :type => :array,
            :desc => "Logins for Users to assign to this issue."
      desc "edit <user> <repo> <number>", "Edit an issue."
      long_desc <<-DESC
        Parameters

          title - Required string\n
          body - Optional string\n
          assignee - Optional string - Login for the user that this issue should be assigned to.\n
          state - Optional string - State of the issue: open or closed.
          milestone - Optional number - Milestone to associate this issue with\n
          labels - Optional array of strings - Labels to associate with this issue
          assignees - Options array of strings - Logins for Users to assign to this issue

        Example

        ghc issue edit wycats thor 1 --title='Found a bug'
      DESC
      def edit(user, repo, number)
        global_options = options.dup
        params = options[:params].dup
        params["title"]     = options[:title]
        params["body"]      = options[:body]      if options.key?("body")
        params["assignee"]  = options[:assignee]  if options.key?("assignee")
        params["state"]     = options[:state]     if options.key?("state")
        params["milestone"] = options[:milestone] if options.key?("milestone")
        params["labels"]    = options[:labels]    if options.key?("labels")
        params["assignees"]    = options[:assignees] if options.key?("assignees")
        Util.hash_without!(global_options, params.keys + ["params"])
        Issue.edit(user, repo, number, params, global_options)
      end
    end # Issues
  end # Commands
end # GithubCLI
