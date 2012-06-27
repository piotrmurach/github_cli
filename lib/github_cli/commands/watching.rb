# encoding: utf-8

module GithubCLI
  class Commands::Watching < Command

    namespace :watch

    desc 'watchers <user> <repo>', 'Lists repo watchers'
    def watchers(user, repo)
      Watching.watchers user, repo, options[:params], options[:format]
    end

    desc 'watched', 'Lists repos being watched by a user'
    method_option :user, :type => :string, :aliases => ["-u"],
                  :desc => 'Watch repositories for <user>'
    def watched(user, repo, id)
      if options[:user]
        options[:params]['user'] = options[:user]
      end
      Watching.watched options[:params], options[:format]
    end

    desc 'watching <user> <repo>', 'Check if you are watching a repository'
    def watching(user, repo)
      Watching.watching? user, repo, options[:params], options[:format]
    end

    desc 'start <user> <repo>', 'Watch a repository'
    def start(user, repo)
      Watching.start_watching user, repo, options[:params], options[:format]
    end

    desc 'stop <user> <repo>', 'Stop watching a repository'
    def stop(user, repo)
      Watching.stop_watching user, repo, options[:params], options[:format]
    end

  end # Watching
end # GithubCLI
