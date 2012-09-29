# encoding: utf-8

module GithubCLI
  class Commands::Merging < Command

    namespace :merge

    desc 'perform <user> <repo>', 'Perform merge'
    long_desc <<-DESC
      Inputs

      base - Required String - The name of the base branch that the head will be merged into.\n
      head - Required String - The head to merge. This can be a branch name or a commit SHA1. \n
      commit_message - Optional String - Commit message to use for the merge commit. If omitted, a default message will be used.\n
    DESC
    def perform(user, repo)
      Merging.merge user, repo, options[:params], options[:format]
    end

  end # Merging
end # GithubCLI
