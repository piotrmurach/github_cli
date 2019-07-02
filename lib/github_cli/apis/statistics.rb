# frozen_string_literal: true

require_relative '../api'

module GithubCLI
  class Statistics
    extend API

    def self.contributors(user, repo, params, options)
      output options do
        github_api(options).repos.stats.contributors user, repo, params
      end
    end

    def self.activity(user, repo, params, options)
      output options do
        github_api(options).repos.stats.commit_activity user, repo, params
      end
    end

    def self.frequency(user, repo, params, options)
      output options do
        github_api(options).repos.stats.code_frequency user, repo, params
      end
    end

    def self.participation(user, repo, params, options)
      output options do
        github_api(options).repos.stats.participation user, repo, params
      end
    end

    def self.card(user, repo, params, options)
      output options do
        github_api(options).repos.stats.punch_card user, repo, params
      end
    end
  end # Statistics
end # GithubCLI
