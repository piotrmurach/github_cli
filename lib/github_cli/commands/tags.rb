# encoding: utf-8

module GithubCLI
  class Commands::Tags < Command

    namespace :tag

    desc 'get <user> <repo> <sha>', 'Get a Tag'
    method_option :recursive, :type => :boolean, :aliases => ["-r"],
                  :desc => 'get a tree recursively'
    def get(user, repo, sha)
      Tag.get user, repo, sha, options[:params], options[:format]
    end

    desc 'create <user> <repo>', 'Create a Tag Object'
    long_desc <<-DESC
      Note that creating a tag object does not create the reference that
      makes a tag in Git. If you want to create an annotated tag in Git,
      you have to do this call to create the tag object, and then create
      the refs/tags/[tag] reference. If you want to create a lightweight tag,
      you simply have to create the reference - this call would be unnecessary.

      Parameters

      tag - String of the tag \n
      message - String of the tag message \n
      object - String of the SHA of the git object this is tagging \n
      type - String of the type of the object we're tagging. Normally this is a commit but it can also be a tree or a blob \n
      tagger.name - String of the name of the author of the tag \n
      tagger.email - String of the email of the author of the tag \n
      tagger.date - Timestamp of when this object was tagged \n
    DESC
    def create(user, repo)
      Tag.create user, repo, options[:params], options[:format]
    end

  end # Tag
end # GithubCLI
