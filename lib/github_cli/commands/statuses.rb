# encoding: utf-8

module GithubCLI
  class Commands::Statuses < Command

    namespace :status

    desc 'list <user> <repo> <sha>', 'Lists statuses for a <sha>'
    def list(user, repo, sha)
      Status.list user, repo, sha, options[:params], options[:format]
    end

    desc 'create <user> <repo> <sha>', 'Create a status'
    long_desc <<-DESC
      Inputs

      state - Required string - State of the status - can be one of pending, success, error, or failure.\n
      target_url - Optional string - Target url to associate with this status. This URL will be linked from the GitHub UI to allow users to easily see the ‘source’ of the Status. \n
      description - Optional string - Short description of the status\n
    DESC
    def create(user, repo, sha)
      Status.create user, repo, sha, options[:params], options[:format]
    end

  end # Statuses
end # GithubCLI
