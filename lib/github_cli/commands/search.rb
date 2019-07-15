# frozen_string_literal: true

require_relative '../apis/search'
require_relative '../util'
require_relative '../command'

module GithubCLI
  module Commands
    class Search < Command

      namespace :search

      desc "issue <query>", "Search issues"
      def issue(query)
        global_options = options.dup
        params = options[:params].dup
        params["q"] = query
        Util.hash_without!(global_options, params.keys + ["params"])
        GithubCLI::Search.issue(params, global_options)
      end

      desc "repo <query>", "Search repositories"
      long_desc <<-DESC
        search repo "tetris+language:assembly"
      DESC
      def repo(query)
        global_options = options.dup
        params = options[:params].dup
        params["q"] = query
        Util.hash_without!(global_options, params.keys + ["params"])
        GithubCLI::Search.repo(params, global_options)
      end

      desc "user <query>", "Search users"
      def user(query)
        global_options = options.dup
        params = options[:params].dup
        params["q"] = query
        Util.hash_without!(global_options, params.keys + ["params"])
        GithubCLI::Search.user(params, global_options)
      end

      desc "code <query>", "Search code"
      def code(query)
        global_options = options.dup
        params = options[:params].dup
        params["q"] = query
        Util.hash_without!(global_options, params.keys + ["params"])
        GithubCLI::Search.code(params, global_options)
      end
    end # Search
  end # Commands
end # GithubCLI
