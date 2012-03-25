# encoding: utf-8

module GithubCLI
  class API

    @@api = nil

    def self.github_api
      if @@api
        @@api
      else
        @@api = Github.new
      end
    end

    def self.configure_api
    end

  end # API
end # GithubCLI
