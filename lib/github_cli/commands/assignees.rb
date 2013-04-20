# encoding: utf-8

module GithubCLI
  class Commands::Assignees < Command

    namespace :assignee

    desc 'list <user> <repo>', 'Lists all the available assignees'
    long_desc <<-DESC
      Lists all the available assignees (owner + collaborators) to which issues may be assigned
    DESC
    def list(user, repo)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Assignee.all user, repo, params, global_options
    end

    desc 'check <user> <repo> <assignee>', 'Check if <assignee> is assigned to <repo>'
    def check(user, repo, assignee)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Assignee.check user, repo, assignee, params, global_options
    end

  end # Assignees
end # GithubCLI
