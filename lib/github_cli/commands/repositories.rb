# encoding: utf-8

module GithubCLI
  class Commands::Repositories < Command

    namespace :repo

    option :org, :type => :string, :aliases => ["-o"], :banner => '<organization>',
      :desc => 'List repositories for <organization>'
    option :user, :type => :string, :aliases => ["-u"], :banner => '<user>',
      :desc => 'List repositories for <user>'
    option :since, :type => :string, :banner => '<id>',
      :desc => "the integer ID of the last Repository that you've seen"
    option :type, :type => :string,
      :desc => "all, owner, public, private, member. Default: all."
    option :sort, :type => :string,
      :desc => "created, updated, pushed, full_name, default: full_name."
    option :direction, :type => :string,
      :desc => "asc or desc, default: when using full_name: asc, otherwise desc."
    desc 'list', 'Lists all repositories for the authenticated user'
    def list
      params = options[:params].dup
      params['org']   = options[:org] if options[:org]
      params['user']  = options[:user] if options[:user]
      params['since'] = options[:since] if options[:since]
      params['type']  = options[:type] if options[:type]
      params['sort']  = options[:sort] if options[:sort]
      params['direction'] = options[:direction] if options[:direction]
      Repository.all params, options[:format]
    end

    desc 'get <user> <repo>', 'Get a repository'
    def get(user, repo)
      Repository.get user, repo, options[:params], options[:format]
    end

    desc 'create [<org>/]<name>', 'Create a new repository <name> for the authenticated user.'
    long_desc <<-DESC
      Create a new repository for the autheticated user.

      Parameters

        description - Optional string \n
        homepage - Optional string \n
        private - Optional boolean - true to create a private repository, false to create a public one \n
        has_issues - Optional boolean - true to enable issues for this repository, false to disable them \n
        has_wiki - Optional boolean - true to enable the wiki for this repository, false to disable it. Default is true \n
        has_downloads Optional boolean - true to enable downloads for this repository \n
        org Optional string - The organisation in which this repository will be created \n
        team_id - Optional number - The id of the team that will be granted access to this repository. This is only valid when creating a repo in an organization \n
    DESC
    method_option :org, :type => :string, :aliases => ["-o"],
                  :desc => 'Create repository in <organization>',
                  :banner => '<organization>'
    def create(args)
      org, options[:params]['name'] = Arguments.new(args).parse
      options[:params]['org'] = org if org
      options[:params]['org'] = options[:org] if options[:org]

      Repository.create options[:params], options[:format]
    end

    desc 'edit <user> <repo>', 'Edit <repo> for an <user>.'
    long_desc <<-DESC
      Create a new repository for the autheticated user.

      Parameters

        name - Required string \n
        description - Optional string \n
        homepage - Optional string \n
        private - Optional boolean - true to create a private repository, false to create a public one \n
        has_issues - Optional boolean - true to enable issues for this repository, false to disable them \n
        has_wiki - Optional boolean - true to enable the wiki for this repository, false to disable it. Default is true \n
        has_downloads Optional boolean - true to enable downloads for this repository \n
    DESC
    def edit(user, repo)
      Repository.edit user, repo, options[:params], options[:format]
    end

    desc 'branches <user> <repo>', 'List branches'
    def branches(user, repo)
      Repository.branches user, repo, options[:params], options[:format]
    end

    desc 'contribs <user> <repo>', 'List contributors'
    def contribs(user, repo)
      Repository.contributors user, repo, options[:params], options[:format]
    end

    desc 'languages <user> <repo>', 'Listing all languages'
    def languages(user, repo)
      Repository.languages user, repo, options[:params], options[:format]
    end

    desc 'tags <user> <repo>', 'Listing all tags'
    def tags(user, repo)
      Repository.tags user, repo, options[:params], options[:format]
    end

    desc 'teams <user> <repo>', 'Listing all teams'
    def teams(user, repo)
      Repository.teams user, repo, options[:params], options[:format]
    end

  end # Repositories
end # GithubCLI
