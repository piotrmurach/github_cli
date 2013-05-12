# encoding: utf-8

module GithubCLI
  class Merging < API

    class << self

      def merge(user, repo, params, options)
        output options[:format], options[:quiet] do
          github_api(options).repos.merging.merge user, repo, params
        end
      end

    end

  end # Merging
end # GithubCLI
