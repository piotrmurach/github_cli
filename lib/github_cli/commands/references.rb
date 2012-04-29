# encoding: utf-8

module GithubCLI
  class Commands::References < Command

    namespace :ref

    desc 'list <user> <repo> <ref>', 'List all References'
    method_option :ref, :type => :string, :banner => 'branch reference'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def list(user, repo)
      ref =  options[:ref] ? options[:ref] : nil
      Reference.list user, repo, ref, options[:params]
    end

    desc 'get <user> <repo> <ref>', 'Get a Reference'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def get(user, repo, ref)
      Reference.get user, repo, ref, options[:params]
    end

    desc 'create <user> <repo>', 'Create a new Reference'
    long_desc <<-DESC
      Inputs

      ref - String of the name of the fully qualified reference (ie: refs/heads/master). If it doesn’t start with ‘refs’ and have at least two slashes, it will be rejected.\n
      sha - String of the SHA1 value to set this reference to
    DESC
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def create(user, repo)
      Reference.create user, repo, options[:params]
    end

    desc 'update <user> <repo> <ref>', 'Update a Reference'
    long_desc <<-DESC
      Inputs

      sha - String of the SHA1 value to set this reference to\n
      force - Boolean indicating whether to force the update or to make sure the update is a fast-forward update. The default is <tt>false</tt>, so leaving this out or setting it to false will make sure you’re not overwriting work.
    DESC
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def update(user, repo, ref)
      Reference.update user, repo, ref, options[:params]
    end

    desc 'delete <user> <repo> <ref>', 'Delete a Reference'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def delete(user, repo, ref)
      Reference.delete user, repo, ref, options[:params]
    end

  end # References
end # GithubCLI
