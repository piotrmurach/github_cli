# encoding: utf-8

module GithubCLI
  class Commands::Assignees < Command

    namespace :assignee

    desc 'list <user> <repo>', 'Lists all the available assignees'
    long_desc <<-DESC
      Lists all the available assignees (owner + collaborators) to which issues may be assigned
    DESC
    def list(user, repo)
      Assignee.all user, repo, options[:params], options[:format]
    end

    desc 'check <user> <repo> <assignee>', 'Check if <assignee> is assigned to <repo>'
    def check(user, repo, assignee)
      Assignee.check user, repo, assignee, options[:params], options[:format]
    end

  end # Assignees
end # GithubCLI
