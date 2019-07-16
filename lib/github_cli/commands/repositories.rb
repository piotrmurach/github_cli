# frozen_string_literal: true

require_relative "../apis/repository"
require_relative "../util"
require_relative "../command"
require_relative "../command/arguments"

module GithubCLI
  module Commands
    class Repositories < Command

      namespace :repo

      option :org, :type => :string, :aliases => ["-o"], :banner => "<organization>",
            :desc => "List repositories for <organization>"
      option :user, :type => :string, :aliases => ["-u"], :banner => "<user>",
            :desc => "List repositories for <user>"
      option :every, :type => :boolean, :default => false,
            :desc => "This provides a dump of every repository, in the order that they were created."
      option :since, :type => :string, :banner => "<id>",
            :desc => "the integer ID of the last Repository that you've seen"
      option :type, :type => :string,
            :desc => "all, owner, public, private, member. Default: all."
      option :sort, :type => :string,
            :desc => "created, updated, pushed, full_name, default: full_name."
      option :direction, :type => :string,
            :desc => "asc or desc, default: when using full_name: asc, otherwise desc."
      desc "list", "Lists all repositories for the authenticated user"
      def list
        global_options = options.dup
        params = options[:params].dup
        params["org"]   = options[:org]   if options.key?("org")
        params["user"]  = options[:user]  if options.key?("user")
        params["since"] = options[:since] if options.key?("since")
        params["type"]  = options[:type]  if options.key?("type")
        params["sort"]  = options[:sort]  if options.key?("sort")
        params["direction"] = options[:direction] if options.key?("direction")
        Util.hash_without!(global_options, params.keys + ["params"])
        Repository.all params, global_options
      end

      desc "get <user> <repo>", "Get a repository"
      def get(user, repo)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, %w[ params ])
        Repository.get user, repo, params, global_options
      end

      option :org, :type => :string, :aliases => ["-o"],
            :desc => "Create repository in <organization>",
            :banner => "<organization>"
      option :desc, :type => :string, :banner => "description"
      option :homepage, :type => :string, :banner => "homepage"
      option :private, :type => :boolean, :default => false,
            :desc => "true to create a private repository, false to create a public one"
      option :issues, :type => :boolean, :banner => "has_issues", :default => true,
            :desc => "true to enable issues for this repository, false to disable them"
      option :projects, :type => :boolean, :banner => "has_projects", :default => true,
            :desc => "true to enable issues for this repository, false to disable them"
      option :wiki, :type => :boolean, :banner => "has_wiki", :default => true,
            :desc => "true to enable the wiki for this repository, false to disable it. Default is true"
      option :team, :type => :numeric, :banner => "team <id>",
            :desc => "The id of the team that will be granted access to this repository. This is only valid when creating a repo in an organization"
      option :auto, :type => :string, :banner => "auto_init", :default => false,
            :desc => "true to create an initial commit with empty README. Default is false."
      option :gitignore, :type => :string, :banner => "gitignore_template",
            :desc => "Desired language or platform .gitignore template to apply."
      option :license, :type => :string, :banner => "Choose an open source license template that best suits your needs, and then use the license keyword as the license_template string. For example, 'mit' or 'mpl-2.'"
      option :squash_merge, :type => :boolean, :desc => "Either true to allow squash-merging pull requests, or false to prevent squash-merging. Default: true"
      option :merge_commit, :type => :boolean, :desc => "Either true to allow merging pull requests with a merge commit, or false to prevent merging pull requests with merge commits. Default: true"
      option :rebase_merge, :type => :boolean, :desc => "Either true to allow rebase-merging pull requests, or false to prevent rebase-merging. Default: true"
      desc "create [<org>/]<name>", "Create a new repository <name> for the authenticated user."
      long_desc <<-DESC
        Create a new repository for the autheticated user.

        Parameters

        name - string - Required. The name of the repository.\n
        description - string - A short description of the repository.\n
        homepage - string - A URL with more information about the repository.\n
        private - boolean - Either true to create a private repository or false to create a public one. Creating private repositories requires a paid GitHub account. Default: false.\n
        has_issues - boolean - Either true to enable issues for this repository or false to disable them. Default: true.\n
        has_projects - boolean - Either true to enable projects for this repository or false to disable them. Default: true. Note: If you're creating a repository in an organization that has disabled repository projects, the default is false, and if you pass true, the API returns an error.\n
        has_wiki - boolean - Either true to enable the wiki for this repository or false to disable it. Default: true.\n
        team_id - integer - The id of the team that will be granted access to this repository. This is only valid when creating a repository in an organization.\n
        auto_init - boolean - Pass true to create an initial commit with empty README. Default: false.\n
        gitignore_template - string - Desired language or platform .gitignore template to apply. Use the name of the template without the extension. For example, "Haskell".\n
        license_template - string - Choose an open source license template that best suits your needs, and then use the license keyword as the license_template string. For example, "mit" or "mpl-2.0". \n
        allow_squash_merge - boolean - Either true to allow squash-merging pull requests, or false to prevent squash-merging. Default: true
        allow_merge_commit - boolean - Either true to allow merging pull requests with a merge commit, or false to prevent merging pull requests with merge commits. Default: true\n
        allow_rebase_merge - boolean - Either true to allow rebase-merging pull requests, or false to prevent rebase-merging. Default: true

      DESC
      def create(args)
        global_options = options.dup
        params = options[:params].dup
        org, params["name"] = Arguments.new(args).parse
        params["org"]                = org if org
        params["org"]                = options["org"] if options.key?("org")
        params["description"]        = options["desc"] if options.key?("desc")
        params["homepage"]           = options["homepage"] if options.key?("homepage")
        params["private"]            = options["private"] if options.key?("private")
        params["has_issues"]         = options["issues"] if options.key?("issues")
        params["has_wiki"]           = options["wiki"] if options.key?("wiki")
        params["has_projects"]       = options["projects"] if options.key?("projects")
        params["team_id"]            = options["team"] if options.key?("team")
        params["auto_init"]          = options["auto"] if options.key?("auto")
        params["gitignore_template"] = options["gitignore"] if options.key?("gitignore")
        params["license_template"]   = options["license"] if options.key?("license")
        params["allow_squash_merge"] = options["squash_merge"] if options.key?("squash_merge")
        params["allow_merge_commit"] = options["merge_commit"] if options.key?("merge_commit")
        params["allow_rebase_merge"] = options["rebase_merge"] if options.key?("rebase_merge")
        Util.hash_without!(global_options,
          params.keys + %w[ params issues wiki projects team auto gitignore desc license squash_merge merge_commit rebase_merge ])
        Repository.create params, global_options
      end

      option :desc, :type => :string, :banner => "description"
      option :homepage, :type => :string, :banner => "homepage"
      option :private, :type => :boolean, :default => false,
            :desc => "true to create a private repository, false to create a public one"
      option :issues, :type => :boolean, :banner => "has_issues", :default => true,
            :desc => "true to enable issues for this repository, false to disable them"
      option :projects, :type => :boolean, :banner => "has_projects", :default => true,
            :desc => "true to enable issues for this repository, false to disable them"
      option :wiki, :type => :boolean, :banner => "has_wiki", :default => true,
            :desc => "true to enable the wiki for this repository, false to disable it. Default is true"
      option :branch, :type => :string, :banner => "default branch",
            :desc => "Update the default branch for this repository."
      option :squash_merge, :type => :boolean, :desc => "Either true to allow squash-merging pull requests, or false to prevent squash-merging. Default: true"
      option :merge_commit, :type => :boolean, :desc => "Either true to allow merging pull requests with a merge commit, or false to prevent merging pull requests with merge commits. Default: true"
      option :rebase_merge, :type => :boolean, :desc => "Either true to allow rebase-merging pull requests, or false to prevent rebase-merging. Default: true"

      desc "edit <user> <repo> <name>", "Edit <repo> with <name> for an <user>."
      long_desc <<-DESC
        Edit a repository for the autheticated user.

        Parameters

        name - string - Required. The name of the repository.\n
        description - string - A short description of the repository.\n
        homepage - string - A URL with more information about the repository.\n
        private - boolean - Either true to make the repository private or false to make it public. Creating private repositories requires a paid GitHub account. Default: false.\n
        has_issues - boolean - Either true to enable issues for this repository or false to disable them. Default: true.\n
        has_projects - boolean - Either true to enable projects for this repository or false to disable them. Default: true. Note: If you're creating a repository in an organization that has disabled repository projects, the default is false, and if you pass true, the API returns an error.\n
        has_wiki - boolean - Either true to enable the wiki for this repository or false to disable it. Default: true.\n
        default_branch - string -  Updates the default branch for this repository.\n
        allow_squash_merge - boolean - Either true to allow squash-merging pull requests, or false to prevent squash-merging. Default: true\n
        allow_merge_commit - boolean - Either true to allow merging pull requests with a merge commit, or false to prevent merging pull requests with merge commits. Default: true\n
        allow_rebase_merge - boolean - Either true to allow rebase-merging pull requests, or false to prevent rebase-merging. Default: true\n
        archived  boolean true to archive this repository. Note: You cannot unarchive repositories through the API. Default: false
      DESC
      def edit(user, repo, name)
        global_options = options.dup
        params = options[:params].dup
        params["name"] = name
        params["description"]        = options["desc"] if options.key?("desc")
        params["homepage"]           = options["homepage"] if options.key?("homepage")
        params["private"]            = options["private"] if options.key?("private")
        params["has_issues"]         = options["issues"] if options.key?("issues")
        params["has_wiki"]           = options["wiki"] if options.key?("wiki")
        params["has_projects"]       = options["projects"] if options.key?("projects")
        params["default_branch"]     = options["branch"]    if options.key?("branch")
        params["allow_squash_merge"] = options["squash_merge"] if options.key?("squash_merge")
        params["allow_merge_commit"] = options["merge_commit"] if options.key?("merge_commit")
        params["allow_rebase_merge"] = options["rebase_merge"] if options.key?("rebase_merge")
        params["archived"] = options["archived"] if options.key?("archived")
        Util.hash_without!(global_options,
          params.keys + %w[ wiki issues projects params desc squash_merge merge_commit rebase_merge branch] )
        Repository.edit user, repo, params, global_options
      end

      desc "delete <user> <repo>", "Delete a repository"
      def delete(user, repo)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        Repository.delete user, repo, params, global_options
      end

      desc "branches <user> <repo>", "List branches"
      def branches(user, repo)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        Repository.branches user, repo, params, global_options
      end

      desc "branch <user> <repo> <name>", "Get branch"
      def branch(user, repo, name)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        Repository.branch user, repo, name, params, global_options
      end

      desc "contribs <user> <repo>", "List contributors"
      def contribs(user, repo)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        Repository.contributors user, repo, params, global_options
      end

      desc "langs <user> <repo>", "Listing all languages"
      def langs(user, repo)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        Repository.languages user, repo, params, global_options
      end

      desc "tags <user> <repo>", "Listing all tags"
      def tags(user, repo)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        Repository.tags user, repo, params, global_options
      end

      desc "teams <user> <repo>", "Listing all teams"
      def teams(user, repo)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        Repository.teams user, repo, params, global_options
      end
    end # Repositories
  end # Commands
end # GithubCLI
