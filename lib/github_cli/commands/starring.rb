# encoding: utf-8

module GithubCLI
  class Commands::Starring < Command

    namespace :star

    desc 'list <user> <repo>', 'Lists stargazers'
    def list(user, repo)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Starring.list user, repo, params, global_options
    end

    desc 'starred', 'Lists repos being starred by a user'
    method_option :user, :type => :string, :aliases => ["-u"],
                  :desc => 'Starred repositories for <user>'
    def starred
      params = options[:params].dup
      global_options = options.dup
      if options[:user]
        params['user'] = options[:user]
      end
      Util.hash_without!(global_options, params.keys + ['params', 'user'])
      Starring.starred params, global_options
    end

    desc 'starring <user> <repo>', 'Check if you are starring a repository'
    def starring(user, repo)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Starring.starring? user, repo, params, global_options
    end

    desc 'star <user> <repo>', 'Star a repository'
    def star(user, repo)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Starring.star user, repo, params, global_options
    end

    desc 'unstar <user> <repo>', 'Unstar a repository'
    def unstar(user, repo)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Starring.unstar user, repo, params, global_options
    end

  end # Starring
end # GithubCLI
