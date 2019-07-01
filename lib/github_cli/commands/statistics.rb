# frozen_string_literal: true

require_relative '../apis/statistics'
require_relative '../util'
require_relative '../command'

module GithubCLI
  class Commands::Statistics < Command

    namespace :stat

    desc 'contribs <user> <repo>', 'Get contributors list with additions, deletions, and commit counts'
    def contribs(user, repo)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Statistics.contributors(user, repo, params, global_options)
    end

    desc 'activity <user> <repo>', 'Get the last year of commit activity data'
    def activity(user, repo)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Statistics.activity(user, repo, params, global_options)
    end

    desc 'frequency <user> <repo>', 'Get the number of additions and deletions per week'
    def frequency(user, repo)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Statistics.frequency(user, repo, params, global_options)
    end

    desc 'participation <user> <repo>', 'Get the weekly commit count for the repo owner and everyone else'
    def participation(user, repo)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Statistics.participation(user, repo, params, global_options)
    end

    desc 'card <user> <repo>', 'Get the number of commits per hour in each day'
    def card(user, repo)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Statistics.card(user, repo, params, global_options)
    end
  end # Commands::Statistics
end # GithubCLI
