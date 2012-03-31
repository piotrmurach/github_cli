# encoding: utf-8

require "github_cli/command_template"
require "github_cli/repositories"
require "github_cli/issues"

module GithubCLI
  class CLI < ::Thor
    include Thor::Actions

    def initialize(*args)
      super
      say <<-TEXT

Github CLI client

      TEXT
      the_shell = (options["no-color"] ? Thor::Shell::Basic.new : shell)
      GithubCLI.ui = UI.new(the_shell)
      GithubCLi.ui.debug! if options["verbose"]
    end

    map "repo" => :repository,
        "is" => :issue,
        "-v" => :version

    class_option :config, :type => :string,
                 :desc => "Configuration file.",
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

    desc 'ls <pattern>', 'List all available commands limited by pattern'
    def ls(pattern=nil)
      say Thor::Base.subclasses.find { |klass| puts klass }
    end

    desc "repository <command>", "manage repositories"
    subcommand "repository", GithubCLI::Repositories

    desc "issue <command>", "manage issues"
    subcommand "issue", GithubCLI::Issues

    desc 'version', 'Display Github CLI version.'
    def version
      require 'github_cli/version'
      say "Github CLI #{GithubCLI::VERSION}"
    end

  end # CLI
end # GithubCLI
