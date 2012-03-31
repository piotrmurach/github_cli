# encoding: utf-8

require 'yaml'
require 'thor'
require 'thor/group'
require 'github_api'
require 'github_cli/version'

module GithubCLI
  autoload :Config,       'github_cli/config'
  autoload :CLI,          'github_cli/cli'
  autoload :Terminal,     'github_cli/terminal'
  autoload :Repositories, 'github_cli/repositories'
  autoload :UI,           'github_cli/ui'

  require "github_cli/api"
  require "github_cli/repository"
  require "github_cli/repositories"
  require "github_cli/issues"
  require "github_cli/labels"
  require "github_cli/command"

  class << self
    attr_writer :ui, :config

    def ui
      @ui ||= UI.new
    end

    def config
      @config ||= GithubCLI::Config.new
    end

    def commands
      @commands ||= GithubCLI::Command.all
    end
  end
end # GithubCLI
