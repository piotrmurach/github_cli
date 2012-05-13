# encoding: utf-8

module GithubCLI
  class Commands::Watching < Command

    namespace :watch

    desc 'watchers <user> <repo>', 'Lists repo watchers'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additional request parameters e.i per_page:100'
    def watchers(user, repo)
      Watching.watchers user, repo, options[:params], options[:format]
    end

    desc 'watched', 'Lists repos being watched by a user'
    method_option :user, :type => :string, :aliases => ["-u"],
                  :desc => 'Watch repositories for <user>'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additional request parameters e.i per_page:100'
    def watched(user, repo, id)
      if options[:user]
        options[:params]['user'] = options[:user]
      end
      Watching.watched options[:params], options[:format]
    end

    desc 'watching <user> <repo>', 'Check if you are watching a repository'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def watching(user, repo)
      Watching.watching? user, repo, options[:params], options[:format]
    end

    desc 'start <user> <repo>', 'Watch a repository'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def start(user, repo)
      Watching.start_watching user, repo, options[:params], options[:format]
    end

    desc 'stop <user> <repo>', 'Stop watching a repository'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def stop(user, repo)
      Watching.stop_watching user, repo, options[:params], options[:format]
    end

  end # Watching
end # GithubCLI
