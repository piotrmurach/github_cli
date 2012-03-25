# encoding: utf-8

module GithubCLI
  class Config

    def initialize(options={})
      @options = options
    end

    def self.config
      ::GithubCLI.const_set(:CONFIG, self.new)
    end
  end
end # GithubCLI
