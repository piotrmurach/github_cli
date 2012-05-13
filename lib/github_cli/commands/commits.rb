# encoding: utf-8

module GithubCLI
  class Commands::Commits < Command

    namespace :commit

    desc 'get <user> <repo> <sha>', 'Get a Commit'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def get(user, repo, sha)
      Commit.get user, repo, sha, options[:params], options[:format]
    end

    desc 'create <user> <repo>', 'Create a Commit'
    long_desc <<-DESC
      Parameters

      message - String of the commit message \n
      tree - String of the SHA of the tree object this commit points to \n
      parents - Array of the SHAs of the commits that were the parents of this commit. If omitted or empty, the commit will be written as a root commit. For a single parent, an array of one SHA should be provided, for a merge commit, an array of more than one should be provided. \n

        Optional Parameters

        The committer section is optional and will be filled with the author data if omitted. If the author section is omitted, it will be filled in with the authenticated users information and the current date.

        author.name - String of the name of the author of the commit \n
        author.email - String of the email of the author of the commit \n
        author.date - Timestamp of when this commit was authored \n
        committer.name - String of the name of the committer of the commit \n
        committer.email - String of the email of the committer of the commit \n
        committer.date:: Timestamp of when this commit was committed
    DESC
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def create(user, repo)
      Commit.create user, repo, options[:params], options[:format]
    end

  end # Commit
end # GithubCLI
