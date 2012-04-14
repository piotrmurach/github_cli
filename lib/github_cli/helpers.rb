# encoding: utf-8

module GithubCLI
  module Helpers
    extend self

    def default_configfile
      configfile = find_configfile
      raise ConfigFileNotFound, "Could not locate .githubrc" unless configfile
      Pathname.new(configfile)
    end

    def find_configfile
      current = File.expand_path(Dir.pwd)
    end
  end # Helpers
end # GithubCLI
