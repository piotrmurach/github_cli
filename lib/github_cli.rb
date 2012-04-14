# encoding: utf-8

require 'yaml'
require 'pathname'
require 'thor'
require 'thor/group'
require 'github_api'
require 'github_cli/version'
require 'github_cli/errors'

module GithubCLI
  autoload :DSL,       'github_cli/dsl'
  autoload :Config,    'github_cli/config'
  autoload :CLI,       'github_cli/cli'
  autoload :Command,   'github_cli/command'
  autoload :API,       'github_cli/api'
  autoload :Terminal,  'github_cli/terminal'
  autoload :Commands,  'github_cli/commands'
  autoload :Helpers,   'github_cli/helpers'
  autoload :UI,        'github_cli/ui'

  require 'github_cli/apis'

  extend DSL

  program_name 'Github CLI client'

  class << self
    attr_writer :ui, :config

    def ui
      @ui ||= UI.new
    end

    def default_configfile
      Helpers.default_configfile
    end

    def root
      default_configfile.expand_path
    end

    def config
      @config ||= GithubCLI::Config.new root
    end

    def commands
      @commands ||= GithubCLI::Command.all
    end
  end
end # GithubCLI
