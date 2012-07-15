# encoding: utf-8

module GithubCLI
  class Commands::Issues < Command

    namespace :issue

    desc 'list', 'List all issues'
    long_desc <<-DESC
      ghc issue list --params filter:'assigned', state:'open'

      Parameters

        filter\n
          * assigned: Issues assigned to you (default) \n
          * created: Issues assigned to you (default) \n
          * mentioned: Issues assigned to you (default)\n
          * subscribed: Issues assigned to you (default)\n
        state - open, closed, default: open \n
        labels - String list of comma separated Label names. Example: bug,ui,@high
        sort - created, updated, comments, default: created \n
        direction - asc, desc, default: desc \n
        since - Optional string of a timestamp in ISO 8601 format: YYYY-MM-DDTHH:MM:SSZ \n
    DESC
    def list
      Issue.all options[:params], options[:format]
    end

    desc 'repo <user> <repo>', 'List all issues for a repository'
    long_desc <<-DESC
      Parameters

        milestone:\n
          * Integer Milestone number\n
          * none for Issues with no Milestone.\n
          *  * for Issues with any Milestone\n
        state - open, closed, default: open \n
        assignee:\n
          * String User login\n
          * none for Issues with no assigned User.\n
          *  * for Issues with any assigned User.\n
        mentioned - String User login\n
        labels - String list of comma separated Label names. Example: bug,ui,@high\n
        sort - created, updated, comments, default: created\n
        direction - asc, desc, default: desc\n
        since - Optional string of a timestamp in ISO 8601 format: YYYY-MM-DDTHH:MM:SSZ\n
    DESC
    def repo(user, repo)
      Issue.all_repo user, repo, options[:params], options[:format]
    end

    desc 'get <user> <repo> <issue-id>', 'Get a single issue'
    def get(user, repo, id)
      Issue.get user, repo, id, options[:params], options[:format]
    end

    desc 'create <user> <repo>', 'Create an issue.'
    long_desc <<-DESC
      Parameters

        title - Required string\n
        body - Optional string\n
        assignee - Optional string - Login for the user that this issue should be assigned to.\n
        milestone - Optional number - Milestone to associate this issue with\n
        labels - Optional array of strings - Labels to associate with this issue

      Example

      ghc issue create wycats thor --params=title:'Found a bug'
    DESC
    def create(user, repo)
      Issue.create user, repo, options[:params], options[:format]
    end

    desc 'edit <user> <repo> <issue-id>', 'Edit an issue.'
    long_desc <<-DESC
      Parameters

        title - Required string\n
        body - Optional string\n
        assignee - Optional string - Login for the user that this issue should be assigned to.\n
        state - Optional string - State of the issue: open or closed.
        milestone - Optional number - Milestone to associate this issue with\n
        labels - Optional array of strings - Labels to associate with this issue

      Example

      ghc issue edit wycats thor 1 --params=title:'Found a bug'
    DESC
    def edit(user, repo, id)
      Issue.edit user, repo, id, options[:params], options[:format]
    end

  end # Issues
end # GithubCLI
