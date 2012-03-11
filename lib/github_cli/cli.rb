# encoding: utf-8

module GithubCli
  class CLI < Thor
    include Thor::Actions

    def initialize(*args)
      super
      say "Initializing", :green
    end

    desc 'list [USER]', 'List all repositories'
    def list(user)
      github = ::Github.new
      result = github.repos.repos :user => user
      say result
    end
  end
end
