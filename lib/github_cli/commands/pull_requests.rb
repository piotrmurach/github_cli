# encoding: utf-8

module GithubCLI
  class Commands::PullRequests < Command

    namespace :pull

    desc 'list <user> <repo>', 'List all Pull Requests'
    def list(user, repo)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      PullRequest.list user, repo, params, global_options
    end

    desc 'get <user> <repo> <number>', 'Get a Pull Request'
    def get(user, repo, number)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      PullRequest.get user, repo, number, params, global_options
    end

    desc 'create <user> <repo>', 'Create a new Pull Request'
    option :title, :type => :string
    option :body, :type => :string
    option :base, :type => :string,
      :desc => "The branch you want your changes pulled into."
    option :head, :type => :string,
      :desc => "The branch where your changes are implemented"
    option :issue, :type => :string,
      :desc => "Issue number in this repository to turn into a Pull Request"
    def create(user, repo)
      global_options = options.dup
      params = options[:params].dup
      params['title'] = options[:title] if options[:title]
      params['body']  = options[:body]  if options[:body]
      params['base']  = options[:base]  if options[:base]
      params['head']  = options[:head]  if options[:head]
      params['issue'] = options[:issue] if options[:issue]
      Util.hash_without!(global_options, params.keys + ['params'])
      PullRequest.create user, repo, params, global_options
    end

    desc 'update <user> <repo> <number>', 'Update a Pull Request'
    option :title, :type => :string
    option :body, :type => :string
    option :state, :type => :string,
      :desc => "State of this Pull Request. Valid values are open and closed"
    def update(user, repo, number)
      global_options = options.dup
      params = options[:params].dup
      params['title'] = options[:title] if options[:title]
      params['body']  = options[:body]  if options[:body]
      params['state'] = options[:state] if options[:state]
      Util.hash_without!(global_options, params.keys + ['params'])
      PullRequest.update user, repo, number, params, global_options
    end

    desc 'commits <user> <repo> <number>', 'List commits on a Pull Request'
    def commits(user, repo, number)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      PullRequest.commits user, repo, number, params, global_options
    end

    desc 'files <user> <repo> <number>', 'List Pull Requests Files'
    def files(user, repo, number)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      PullRequest.files user, repo, number, params, global_options
    end

    desc 'merged <user> <repo> <number>', 'Get if a pull request has been merged'
    def merged(user, repo, number)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      PullRequest.merged user, repo, number, params, global_options
    end

    desc 'merge <user> <repo> <number>', 'Merge a pull request'
    def merge(user, repo, number)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      PullRequest.merge user, repo, number, params, global_options
    end

  end # PullRequests
end # GithubCLI
