# encoding: utf-8

module GithubCLI
  class Commands::Forks < Command

    namespace :fork

    option :sort, :type => :string, :aliases => ["-s"],
           :banner => '<sort-category>',
           :desc => 'Sort by newest, oldest or watchers'
    desc 'list <user> <repo>', 'Lists forks'
    long_desc <<-DESC
      List repository forks

      Parameters

      sort - newest, oldest, watchers, default: newest
    DESC
    def list(user, repo)
      params = options[:params].dup
      params['sort'] = options[:sort] if options[:sort]

      Fork.all user, repo, params, options[:format]
    end

    option :org, :type => :string,
           :desc => 'Organization login. The repository will be forked into this organization.'
    desc 'create <user> <repo>', 'Create a new fork'
    def create(user, repo)
      params = options[:params].dup
      params['organization'] = options[:org] if options[:org]

      Fork.create user, repo, params, options[:format]
    end

  end # Forks
end # GithubCLI
