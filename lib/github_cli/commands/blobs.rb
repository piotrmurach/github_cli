# encoding: utf-8

module GithubCLI
  class Commands::Blobs < Command

    namespace :blob

    desc 'get <user> <repo> <sha>', 'Get a Blob'
    def get(user, repo, sha)
      Blob.get user, repo, sha, options[:params], options[:format]
    end

    desc 'create <user> <repo>', 'Create a new Blob'
    long_desc <<-DESC
      Inputs

        content - String of content \n
        encoding - String containing encoding utf-8 or base64
    DESC
    def create(user, repo)
      Blob.create user, repo, options[:params], options[:format]
    end

  end # Blobs
end # GithubCLI
