# encoding: utf-8

module GithubCLI
  class Commands::Starring < Command

    namespace :star

    desc 'list <user> <repo>', 'Lists stargazers'
    def list(user, repo)
      Starring.list user, repo, options[:params], options[:format]
    end

    desc 'starred', 'Lists repos being starred by a user'
    method_option :user, :type => :string, :aliases => ["-u"],
                  :desc => 'Starred repositories for <user>'
    def starred(user, repo, id)
      if options[:user]
        options[:params]['user'] = options[:user]
      end
      Starring.starred options[:params], options[:format]
    end

    desc 'starring <user> <repo>', 'Check if you are starring a repository'
    def starring(user, repo)
      Starring.starring? user, repo, options[:params], options[:format]
    end

    desc 'star <user> <repo>', 'Star a repository'
    def star(user, repo)
      Starring.star user, repo, options[:params], options[:format]
    end

    desc 'unstar <user> <repo>', 'Unstar a repository'
    def unstar(user, repo)
      Starring.unstar user, repo, options[:params], options[:format]
    end

  end # Starring
end # GithubCLI
