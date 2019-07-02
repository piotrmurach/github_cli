# frozen_string_literal: true

require_relative '../api'

module GithubCLI
  class Email
    extend API

    def self.all(params, options)
      output options do
        github_api(options).users.emails.list params
      end
    end

    def self.add(emails, params, options)
      output options do
        github_api(options).users.emails.add emails, params
      end
    end

    def self.delete(emails, params, options)
      output options do
        github_api(options).users.emails.delete emails, params
      end
    end
  end # Email
end # GithubCLI
