# frozen_string_literal: true

require_relative '../api'

module GithubCLI
  class Search
    extend API

    def issue(params, options)
      output options do
        github_api(options).search.issues params
      end
    end

    def repo(params, options)
      output options do
        github_api(options).search.repos params
      end
    end

    def user(params, options)
      output options do
        github_api(options).search.users params
      end
    end

    def email(params, options)
      output options do
        github_api(options).search.email params
      end
    end
  end # Search
end # GithubCLI
