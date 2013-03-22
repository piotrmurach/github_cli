# encoding: utf-8

module GithubCLI
  class Commands::References < Command

    namespace :ref

    desc 'list <user> <repo>', 'List all References'
    option :ref, :type => :string, :banner => 'branch reference'
    def list(user, repo)
      params = options[:params].dup
      if options[:ref]
        params['ref'] = options[:ref]
      end
      Reference.list user, repo, params, options[:format]
    end

    desc 'get <user> <repo> <ref>', 'Get a Reference'
    def get(user, repo, ref)
      Reference.get user, repo, ref, options[:params], options[:format]
    end

    desc 'create <user> <repo>', 'Create a new Reference'
    option :ref, :type => :string, :required => true, :banner => "<ref>",
      :desc => "String of the name of the fully qualified reference (ie: refs/heads/master). If it doesn’t start with ‘refs’ and have at least two slashes, it will be rejected."
    option :sha, :type => :string, :required => true,
      :desc => "String of the SHA1 value to set this reference to."
    long_desc <<-DESC
      Inputs

      ref - String of the name of the fully qualified reference (ie: refs/heads/master). If it doesn’t start with ‘refs’ and have at least two slashes, it will be rejected.\n
      sha - String of the SHA1 value to set this reference to.
    DESC
    def create(user, repo)
      params = options[:params].dup
      params['ref'] = options[:ref] if options[:ref]
      params['sha'] = options[:sha] if options[:sha]
      Reference.create user, repo, params, options[:format]
    end

    desc 'update <user> <repo> <ref>', 'Update a Reference'
    option :sha, :type => :string, :required => true,
      :desc => "String of the SHA1 value to set this reference to."
    option :force => false, :default => 'false', :aliases => ["-f"],
      :desc => "Boolean indicating whether to force the update or to make sure the update is a fast-forward update."
    long_desc <<-DESC
      Inputs

      sha - String of the SHA1 value to set this reference to\n
      force - Boolean indicating whether to force the update or to make sure the update is a fast-forward update. The default is <tt>false</tt>, so leaving this out or setting it to false will make sure you’re not overwriting work.
    DESC
    def update(user, repo, ref)
      params = options[:params].dup
      params['sha']   = options[:sha] if options[:sha]
      params['force'] = options[:force] || false
      Reference.update user, repo, ref, params, options[:format]
    end

    desc 'delete <user> <repo> <ref>', 'Delete a Reference'
    def delete(user, repo, ref)
      Reference.delete user, repo, ref, options[:params], options[:format]
    end

  end # References
end # GithubCLI
