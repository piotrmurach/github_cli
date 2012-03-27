# encoding: utf-8

require 'thor'
require 'thor/group'
require 'github_api'
require "github_cli/version"

module GithubCLI
  require "github_cli/api"
  require "github_cli/repository"
  require "github_cli/repositories"
  require "github_cli/issues"
  require "github_cli/command"

  autoload :Config,       'github_cli/config'
  autoload :CLI,          'github_cli/cli'
  autoload :Repositories, 'github_cli/repositories'
  autoload :UI,           'github_cli/ui'

  class << self
    attr_writer :ui

    def ui
      @ui ||= UI.new
    end

    def config
      @config ||= GithubCLI::Config.new
    end
  end
end # GithubCLI
