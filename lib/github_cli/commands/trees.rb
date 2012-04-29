# encoding: utf-8

module GithubCLI
  class Commands::Trees < Command

    namespace :tree

    desc 'get <user> <repo> <sha>', 'Get a Tree'
    method_option :recursive, :type => :boolean, :aliases => ["-r"],
                  :desc => 'get a tree recursively'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def get(user, repo, sha)
      if options[:recursive]
        options[:params]['recursive'] = true
      end
      Tree.get user, repo, sha, options[:params]
    end

    desc 'create <user> <repo>', 'Create a new Tree'
    long_desc <<-DESC
      The tree creation API will take nested entries as well.
      If both a tree and a nested path modifying that tree are specified,
      it will overwrite the contents of that tree with the new path contents
       and write a new tree out.

      Parameters

      base_tree - optional string of the SHA1 of the tree you want to update with new data \n
      tree - array of hash objects(of :path, :mode, :type and sha) \n
      tree.path - String of the file referenced in the tree \n
      tree.mode - String of the file mode - one of 100644 for file(blob), 100755 for executable (blob), 040000 for subdirectory (tree), 160000 for submodule (commit) or 120000 for a blob that specifies the path of a symlink \n
      tree.type - String of blob, tree, commit \n
      tree.sha - String of SHA1 checksum ID of the object in the tree
      tree.content - String of content you want this file to have - GitHub will write this blob out and use the SHA for this entry. Use either this or tree.sha
    DESC
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def create(user, repo)
      Tree.create user, repo, options[:params]
    end

  end # Blobs
end # GithubCLI
