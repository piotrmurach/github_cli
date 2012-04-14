# encoding: utf-8

module GithubCLI
  class CLI < ::Thor
    include Thor::Actions

    def initialize(*args)
      super
      the_shell = (options["no-color"] ? Thor::Shell::Basic.new : shell)
      GithubCLI.ui = UI.new(the_shell)
      GithubCLi.ui.debug! if options["verbose"]
      Terminal.print_program_name
    end

    map "repository" => :repo,
        "reference"  => :ref,
        "is" => :issue,
        "-v" => :version,
        "ls" => :list

    class_option :config, :type => :string,
                 :desc => "Configuration file.", :banner => "Config file name",
                 :default => ".githubrc"
    class_option :oauth, :type => :string, :aliases => '-a',
                 :desc => 'Authentication token.',
                 :banner => 'Set authentication token'
    class_option "no-color", :type => :boolean,
                 :banner => "Disable colorization in output."
    class_option :verbose, :type => :boolean,
                 :banner => "Enable verbose output mode."


    desc 'init <config-name>', 'Generates a configuration file in your home directory'
    long_desc <<-DESC
      Initializes a configuration file where you can set default options for
      interacting with GitHub API. Both global and per-command options can be
      specified. These defaults override the bult-in defaults and allow you to
      omit commonly used command line options.
    DESC
    method_option :force, :type => :boolean, :default => false, :aliases => "-f",
                  :banner => "Overwrite configuration file. "
    def init(filename=nil)
      if filename.nil? || filename =~ /^\//
        @config_filename = options[:config]
      else
        @config_filename = filename
      end

      config = Config.new(@config_filename)
      if File.exists?(config.path) && !options[:force]
        GithubCLI.ui.error "Not overwritting existing config file #{config.path}, use --force to override."
        exit 1
      end

      oauth_token = ask "Please specify your GitHub Authentication Token (register on github.com to get it):"
      config.save({'oauth_token' => oauth_token})
      GithubCLI.ui.confirm "Writing new configuration file to #{config.path}"
    end

    desc 'list <pattern>', 'List all available commands limited by pattern'
    def list(pattern="")
      pattern = /^#{pattern}.*$/i
      Terminal.print_commands pattern
    end

    desc "blob <command>", "Leverage Blobs API"
    subcommand "blob", GithubCLI::Commands::Blobs

    desc "issue <command>", "Leverage Issues API"
    subcommand "issue", GithubCLI::Commands::Issues

    desc "label <command>", "Leverage Labels API"
    subcommand "label", GithubCLI::Commands::Labels

    desc "pull <command>", "Leverage Pull Requests API"
    subcommand "pull", GithubCLI::Commands::PullRequests

    desc "ref <command>", "Leverage References API"
    subcommand "ref", GithubCLI::Commands::References

    desc "repo <command>", "Leverage Repositories API"
    subcommand "repo", GithubCLI::Commands::Repositories

    desc "tag <command>", "Leverage Tags API"
    subcommand "tag", GithubCLI::Commands::Tags

    desc "tree <command>", "Leverage Trees API"
    subcommand "tree", GithubCLI::Commands::Trees

    desc 'version', 'Display Github CLI version.'
    def version
      puts "#{GithubCLI.config['oauth_token']}"
      say "Github CLI #{GithubCLI::VERSION}"
    end

  end # CLI
end # GithubCLI
