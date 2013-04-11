# encoding: utf-8

module GithubCLI
  class Commands::Blobs < Command

    namespace :blob

    desc 'get <user> <repo> <sha>', 'Get a Blob'
    def get(user, repo, sha)
      Blob.get user, repo, sha, options[:params], options[:format]
    end

    option :content, :type => :string
    option :encoding, :type => :string, :banner => "utf-8|base64",
           :desc => "String containing encoding utf-8 or base64"
    desc 'create <user> <repo>', 'Create a new Blob'
    long_desc <<-DESC
      Inputs

        content - String of content \n
        encoding - String containing encoding utf-8 or base64
    DESC
    def create(user, repo)
      params = options[:params].dup
      params['content'] = options[:content] if options[:content]
      params['encoding'] = options[:encoding] if options[:encoding]

      Blob.create user, repo, params, options[:format]
    end

  end # Blobs
end # GithubCLI
