# encoding: utf-8

module GithubCLI
  class Commands::Teams < Command

    namespace :team

    desc 'list <org>', "List teams"
    def list(org)
      Team.all org, options[:params], options[:format]
    end

    desc 'get <id>', "Get a team"
    def get(id)
      Team.get id, options[:params], options[:format]
    end

    desc 'create <org>', "Create a team"
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
      Team.create org, options[:params], options[:format]
    end

    desc 'edit <id>', "Edit team <id>"
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
      Team.edit id, options[:params], options[:format]
    end

    desc 'delete <id>', 'Delete team'
    long_desc <<-DESC
      In order to delete a team, the authenticated user must be an owner of the org that the team is associated with.
    DESC
    def delete(id)
      Team.delete id, options[:params], options[:format]
    end

    desc 'list_member <id>', "List team <id> members"
    def list_member(id)
      Team.all_member id, options[:params], options[:format]
    end

    desc 'member <id> <user>', 'Check if <user> is a team member'
    long_desc <<-DESC
      In order to get if a user is a member of a team, the authenticated user must be a member of the team.
    DESC
    def member(id, user)
      Team.member id, user, options[:params], options[:format]
    end

    desc 'add_member <id> <user>', 'Add team member'
    long_desc <<-DESC
      In order to add a user to a team, the authenticated user must have ‘admin’ permissions to the team or be an owner of the org that the team is associated with.
    DESC
    def add_member(id, user)
      Team.add_member id, user, options[:params], options[:format]
    end

    desc 'remove_member <id> <user>', 'Remove team member'
    long_desc <<-DESC
      In order to remove a user from a team, the authenticated user must have
      ‘admin’ permissions to the team or be an owner of the org that the team
      is associated with. NOTE: This does not delete the user, it just remove
      them from the team.
    DESC
    def remove_member(id, user)
      Team.remove_member id, user, options[:params], options[:format]
    end

    desc 'list_repo <id>', "List team <id> repositories"
    def list_repo(id)
      Team.all_repo id, options[:params], options[:format]
    end

    desc 'repo <id> <user> <repo>', 'Check if <repo> is managed by <id> team'
    def repo(id, user, repo)
      Team.repo id, user, repo, options[:params], options[:format]
    end

    desc 'add_repo <id> <user> <repo>', 'Add team <repo>'
    long_desc <<-DESC
      In order to add a repo to a team, the authenticated user must be an owner
      of the org that the team is associated with. Also, the repo must be owned
      by the organization, or a direct for of a repo owned by the organization.
    DESC
    def add_repo(id, user, repo)
      Team.add_repo id, user, repo, options[:params], options[:format]
    end

    desc 'remove_repo <id> <user> <repo>', 'Remove team <repo>'
    long_desc <<-DESC
      In order to remove a repo from a team, the authenticated user must be an
      owner of the org that the team is associated with. NOTE: This does not
      delete the repo, it just removes it from the team.
    DESC
    def remove_repo(id, user, repo)
      Team.remove_repo id, user, repo, options[:params], options[:format]
    end

  end # Teams
end # GithubCLI
