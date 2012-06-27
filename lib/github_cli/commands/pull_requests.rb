# encoding: utf-8

module GithubCLI
  class Commands::PullRequests < Command

    namespace :pull

    desc 'get <user> <repo> <number>', 'Get a Pull Request'
    def get(user, repo, number)
      PullRequest.get user, repo, number, options[:params], options[:format]
    end

    desc 'list <user> <repo>', 'List all Pull Requests'
    def list(user, repo)
      PullRequest.list user, repo, options[:params], options[:format]
    end

    desc 'create <user> <repo>', 'Create a new Pull Request'
    def create(user, repo)
      PullRequest.create user, repo, options[:params], options[:format]
    end

    desc 'update <user> <repo> <number>', 'Update a Pull Request'
    def update(user, repo, number)
      PullRequest.update user, repo, number, options[:params], options[:format]
    end

    desc 'commits <user> <repo> <number>', 'List commits on a Pull Request'
    def commits(user, repo, number)
      PullRequest.commits user, repo, number, options[:params], options[:format]
    end

    desc 'files <user> <repo> <number>', 'List Pull Requests Files'
    def files(user, repo, number)
      PullRequest.files user, repo, number, options[:params], options[:format]
    end

    desc 'merged <user> <repo> <number>', 'Get if a pull request has been merged'
    def merged(user, repo, number)
      PullRequest.merged user, repo, number, options[:params], options[:format]
    end

    desc 'merge <user> <repo> <number>', 'Merge a pull request'
    def merge(user, repo, number)
      PullRequest.merge user, repo, number, options[:params], options[:format]
    end

  end # PullRequests
end # GithubCLI
