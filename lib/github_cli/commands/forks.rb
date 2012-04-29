# encoding: utf-8

module GithubCLI
  class Commands::Forks < Command

    namespace :fork

    desc 'list <user> <repo>', 'Lists forks'
    long_desc <<-DESC
      List repository forks

      Parameters

      sort - newest, oldest, watchers, default: newest
    DESC
    method_option :sort, :type => :string, :aliases => ["-s"],
                  :desc => 'Sort by newest, oldest or watchers',
                  :banner => '<sort-category>'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additional request parameters e.i per_page:100'
    def list(user, repo)
      if options[:sort]
        options[:params]['sort'] = options[:sort]
      end
      Fork.all user, repo, options[:params]
    end

    desc 'create <user> <repo>', 'Create a new fork'
    method_option :org, :type => :string,
                  :desc => ' Organization login. The repository will be forked into this organization.'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def create(user, repo)
      if options[:org]
        options[:params]['org'] = options[:org]
      end
      Fork.create user, repo, options[:params]
    end

  end # Forks
end # GithubCLI
