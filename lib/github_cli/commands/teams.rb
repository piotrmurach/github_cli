# frozen_string_literal: true

require_relative "../apis/team"
require_relative "../util"
require_relative "../command"

module GithubCLI
  module Commands
    class Teams < Command

      namespace :team

      desc "list <org>", "List teams"
      def list(org)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        Team.all org, params, global_options
      end

      desc "get <id>", "Get a team"
      def get(id)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        Team.get id, params, global_options
      end

      option :name, :type => :string, :required => true,
        desc: "The name of the team."
      option :desc, :type => :string, desc: "The description of the team."
      option :maintainers, :type => :array,
        desc: "The logins of organization members to add as maintainers of the team."
      option :repo_names, :type => :array,
        desc: "The full name (e.g., 'organization-name/repository-name') of repositories to add the team to."
      option :privacy, :type => :string,
        desc: "The level of privacy this team should have."
      option :permission, :type => :string, :banner => "pull|push|admin"
      option :parent_team_id, :type => :numeric,
        desc: "The ID of a team to set as the parent team. "
      desc "create <org>", "Create a team"
      long_desc <<-DESC
        In order to create a team, the authenticated user must be an owner of :org.

        Input

        name - Required string\n
        repo_names - Optional array of strings\n
        permission - Optional string\n
        *  pull - team members can pull, but not push or administor this repositories. Default\n
        * push - team members can pull and push, but not administor this repositores.\n
        * admin - team members can pull, push and administor these repositories.\n
      DESC
      def create(org)
        global_options = options.dup
        params = options[:params].dup
        params["name"]       = options[:name]
        params["description"] = options[:desc] if options.key?("desc")
        params["maintainers"] = options[:maintainers] if options.key?("maintainers")
        params["repo_names"] = options[:repo_names] if options.key?("repo_names")
        params["privacy"]    = options[:privacy] if options.key?("privacy")
        params["permission"] = options[:permission] if options.key?("permission")
        params["parant_team_id"] = options[:parent_team_id] if options.key?("parent_team_id")
        Util.hash_without!(global_options, params.keys + ["params", "desc"])
        Team.create org, params, global_options
      end

      option :name, :type => :string, :required => true
      option :desc, :type => :string, desc: "The description of the team."
      option :privacy, :type => :string,
        desc: "The level of privacy this team should have."
      option :permission, :type => :string, :banner => "pull|push|admin"
      option :parent_team_id, :type => :numeric,
        desc: "The ID of a team to set as the parent team. "
      desc "edit <id>", "Edit team <id>"
      long_desc <<-DESC
        In order to edit a team, the authenticated user must be an owner of the org that the team is associated with.

        Input

        name - Required string\n
        permission - Optional string\n
        *  pull - team members can pull, but not push or administor this repositories. Default\n
        * push - team members can pull and push, but not administor this repositores.\n
        * admin - team members can pull, push and administor these repositories.\n
      DESC
      def edit(id)
        global_options = options.dup
        params = options[:params].dup
        params["name"]       = options[:name]
        params["description"] = options[:desc] if options.key?("desc")
        params["privacy"]    = options[:privacy] if options.key?("privacy")
        params["permission"] = options[:permission] if options.key?("permission")
        params["parant_team_id"] = options[:parent_team_id] if options.key?("parent_team_id")
        Util.hash_without!(global_options, params.keys + ["params", "desc"])
        Team.edit id, params, global_options
      end

      desc "delete <id>", "Delete team <id>"
      long_desc <<-DESC
        In order to delete a team, the authenticated user must be an owner of the org that the team is associated with.
      DESC
      def delete(id)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        Team.delete id, params, global_options
      end

      desc "list_member <id>", "List team <id> members"
      def list_member(id)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        Team.all_member id, params, global_options
      end

      desc "member <id> <user>", "Check if <user> is a team member"
      long_desc <<-DESC
        In order to get if a user is a member of a team, the authenticated user must be a member of the team.
      DESC
      def member(id, user)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        Team.member id, user, params, global_options
      end

      desc "add_member <id> <user>", "Add team member"
      long_desc <<-DESC
        In order to add a user to a team, the authenticated user must have ‘admin’ permissions to the team or be an owner of the org that the team is associated with.
      DESC
      def add_member(id, user)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        Team.add_member id, user, params, global_options
      end

      desc "remove_member <id> <user>", "Remove team member"
      long_desc <<-DESC
        In order to remove a user from a team, the authenticated user must have
        ‘admin’ permissions to the team or be an owner of the org that the team
        is associated with. NOTE: This does not delete the user, it just remove
        them from the team.
      DESC
      def remove_member(id, user)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        Team.remove_member id, user, params, global_options
      end

      desc "list_repo <id>", "List team <id> repositories"
      def list_repo(id)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        Team.all_repo id, params, global_options
      end

      desc "repo <id> <user> <repo>", "Check if <repo> is managed by team <id>"
      def repo(id, user, repo)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        Team.repo id, user, repo, params, global_options
      end

      desc "add_repo <id> <user> <repo>", "Add team <repo>"
      long_desc <<-DESC
        In order to add a repo to a team, the authenticated user must be an owner
        of the org that the team is associated with. Also, the repo must be owned
        by the organization, or a direct for of a repo owned by the organization.
      DESC
      def add_repo(id, user, repo)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        Team.add_repo id, user, repo, params, global_options
      end

      desc "remove_repo <id> <user> <repo>", "Remove team <repo>"
      long_desc <<-DESC
        In order to remove a repo from a team, the authenticated user must be an
        owner of the org that the team is associated with. NOTE: This does not
        delete the repo, it just removes it from the team.
      DESC
      def remove_repo(id, user, repo)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        Team.remove_repo id, user, repo, params, global_options
      end
    end # Teams
  end # Commands
end # GithubCLI
