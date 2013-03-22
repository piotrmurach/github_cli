# encoding: utf-8

module GithubCLI
  class Commands::Commits < Command

    namespace :commit

    desc 'get <user> <repo> <sha>', 'Get a Commit'
    def get(user, repo, sha)
      Commit.get user, repo, sha, options[:params], options[:format]
    end

    desc 'create <user> <repo>', 'Create a Commit'
    option :message, :type => :string, :aliases => ["-m"],
      :desc => "String of the commit message."
    option :tree, :type => :string, :aliases => ["-t"], :banner => "<sha>",
      :desc => "String of the SHA of the tree object this commit points to."
    option :parents, :type => :array, :banner => "<sha1> <sha2> ...",
      :desc => "Array of the SHAs of the commits that were the parents of this commit. "
    option :author, :type => :hash,
      :desc => "If the author section is omitted, it will be filled in with the authenticated user’s information and the current date."
    option :committer, :type => :hash,
      :desc => "The committer section is optional and will be filled with the author data if omitted."
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
        committer.date - Timestamp of when this commit was committed
    DESC
    def create(user, repo)
      params = options[:params].dup
      params['message']   = options[:message] if options[:message]
      params['tree']      = options[:tree] if options[:tree]
      params['parents']   = options[:parents] if options[:parents]
      params['author']    = options[:author] if options[:author]
      params['committer'] = options[:committer] if options[:committer]
      Commit.create user, repo, params, options[:format]
    end

  end # Commit
end # GithubCLI
