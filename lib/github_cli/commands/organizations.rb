# frozen_string_literal: true

require_relative "../apis/organization"
require_relative "../util"
require_relative "../command"

module GithubCLI
  module Commands
    class Organizations < Command

      namespace :org

      desc "list [--user=<name>]", "List public and private organizations for the authenticated user"
      method_option :user, :type => :string, :aliases => ["-u"],
                    :desc => "List all public organizations for a user",
                    :banner => "<user>"
      def list
        global_options = options.dup
        params = options[:params].dup
        params["user"] = options[:user] if options[:user]
        Util.hash_without!(global_options, params.keys + ["params"])
        Organization.list(params, global_options)
      end

      desc "get <org>", "Get properties for a single organization"
      def get(org)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        Organization.get(org, params, global_options)
      end

      option :billing_email, :type => :string, desc: "Billing email address."
      option :blog, :type => :string
      option :company, :type => :string, desc: "The company name."
      option :email, :type => :string, desc: "The publicly visible email address."
      option :location, :type => :string, desc: "The location."
      option :name, :type => :string, desc: "The shorthand name of the company."
      option :description, :type => :string, desc: "The description of the company"
      option :has_organization_projects, :type => :boolean,
        desc: "Toggles whether organization projects are enabled for the organization."
      option :has_repository_projects, :type => :boolean,
        desc: "Toggles whether repository projects are enabled for repositories that belong to the organization."
      option :default_repository_permission, :type => :string
      option :members_can_create_repositories, :type => :boolean,
        desc: "Toggles the ability of non-admin organization members to create repositories."
      option :members_allowed_repository_creation_type, :type => :string,
        desc: "Specifies which types of repositories non-admin organization members can create."
      desc "edit <org>", "Edit organization"
      long_desc <<-DESC
        Parameters

        billing_email - string - Billing email address. This address is not publicized.\n
        company - string - The company name.\n
        email - string - The publicly visible email address.\n
        location - string - The location.\n
        name - string - The shorthand name of the company.\n
        description - string - The description of the company.\n
        has_organization_projects - boolean - Toggles whether organization projects are enabled for the organization.\n
        has_repository_projects - boolean - Toggles whether repository projects are enabled for repositories that belong to the organization.\n
        default_repository_permission - string - Default permission level members have for organization repositories:\n
        * read - can pull, but not push to or administer this repository.\n
        * write - can pull and push, but not administer this repository.\n
        * admin - can pull, push, and administer this repository.\n
        * none - no permissions granted by default.\n
        Default: read\n
        members_can_create_repositories - boolean - Toggles the ability of non-admin organization members to create repositories. Can be one of:
        * true - all organization members can create repositories.
        * false - only admin members can create repositories.
        Default: true
        Note: Another parameter can override the this parameter. See this note for details.\n
        members_allowed_repository_creation_type - string - Specifies which types of repositories non-admin organization members can create. Can be one of:\n
        * all - all organization members can create public and private repositories.\n
        * private - members can create private repositories. This option is only available to repositories that are part of an organization on GitHub Business Cloud.\n
        * none - only admin members can create repositories.\n
        Note: Using this parameter will override values set in members_can_create_repositories. See this note for details.\n

        Example

        gcli org edit rails --name=github --company=GitHub --email=support@github.com
      DESC
      def edit(org)
        global_options = options.dup
        params = options[:params].dup
        params["billing_email"] = options[:billing_email] if options.key?("billing_email")
        params["blog"] = options[:blog] if options.key?("blog")
        params["company"]  = options[:company]  if options.key?("company")
        params["email"]    = options[:email]    if options.key?("email")
        params["location"] = options[:location] if options.key?("location")
        params["name"]     = options[:name]     if options.key?("name")
        params["description"] = options[:description] if options.key?("description")
        params["has_organization_projects"] = options[:has_organization_projects] if options.key?("has_organization_projects")
        params["has_repository_projects"] = options[:has_repository_projects] if options.key?("has_repository_projects")
        params["default_repository_permission"] = options[:default_repository_permission] if options.key?("default_repository_permission")
        params["members_can_create_repositories"] = options[:members_can_create_repositories] if options.key?("members_can_create_repositories")
        params["members_allowed_repository_creation_type"] = options[:members_allowed_repository_creation_type] if options.key?("members_allowed_repository_creation_type")
        Util.hash_without!(global_options, params.keys + ["params"])
        Organization.edit(org, params, global_options)
      end
    end # Organizations
  end # Commands
end # GithubCLI
