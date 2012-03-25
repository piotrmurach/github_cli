# encoding: utf-8

require "github_cli/command_template"
require "github_cli/repositories"
require "github_cli/issues"

module GithubCLI
  class CLI < ::Thor

    map "repo" => :repository,
        "is" => :issue,
        "-v" => :version

    class_option :config, :type => :string,
                 :desc => "Configuration file.",
                 :default => "~/.githubrc"
    class_option :oauth, :type => :string, :aliases => '-a',
                 :desc => 'Authentication token.'
    class_option :verbose, :type => :boolean

    def initialize(*args)
      super
      say <<-TEXT

Github CLI client

      TEXT
    end

    desc 'init <config-name>', 'Initialize configuration file'
    def init(config_name=nil)
      say "#{options[:config]}"
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
