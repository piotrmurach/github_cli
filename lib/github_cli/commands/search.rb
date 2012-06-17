# encoding: utf-8

module GithubCLI
  class Commands::Search < Command

    namespace :search

    desc 'issue <owner> <repo> <keyword>', 'Search issues'
    long_desc <<-DESC
      Search issues

      Parameters

      state - open or closed. \n
      keyword - search term
    DESC
    method_option :state, :type => :string, :aliases => ["-s"],
                  :desc => 'Repository name'
    def issue(owner, repo, keyword)
      Search.issue owner, repo, keyword, options[:params].update(:state => options[:state]), options[:format]
    end

    desc 'repo <keyword>', 'Repository search'
    def repo(keyword)
      Search.repo options[:params].update(:keyword => keyword), options[:format]
    end

    desc 'user <keyword>', 'User search'
    def user(keyword)
      Search.user options[:params].update(:keyword => keyword), options[:format]
    end

    desc 'email <email>', 'Email search'
    def email(email)
      Search.email options[:params].update(:email => email), options[:format]
    end

  end # Search
end # GithubCLI
