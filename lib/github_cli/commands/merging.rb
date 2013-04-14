# encoding: utf-8

module GithubCLI
  class Commands::Merging < Command

    namespace :merge

    option :base, :type => :string, :required => true,
           :desc => "The name of the base branch that the head will be merged into"
    option :head, :type => :string, :required => true,
           :desc => "The head to merge. This can be a branch name or a commit SHA1"
    option :message, :type => :string,
           :desc => "Commit message to use for the merge commit"
    desc 'perform <user> <repo>', 'Perform merge'
    long_desc <<-DESC
      Inputs

      base - Required String - The name of the base branch that the head will be merged into.\n
      head - Required String - The head to merge. This can be a branch name or a commit SHA1. \n
      commit_message - Optional String - Commit message to use for the merge commit. If omitted, a default message will be used.\n
    DESC
    def perform(user, repo)
      params = options[:params]
      params['base'] = options[:base] if options[:base]
      params['head'] = options[:head] if options[:head]
      params['commit_message'] = options[:message] if options[:message]

      Merging.merge user, repo, params, options[:format]
    end

  end # Merging
end # GithubCLI
