# frozen_string_literal: true

require_relative '../api'

module GithubCLI
  class Authorization
    extend API

    def self.all(params, options)
      output options do
        github_api(options).oauth.list params
      end
    end

    def self.get(id, params, options)
      output options do
        github_api(options).oauth.get id, params
      end
    end

    def self.create(params, options)
      output options do
        github_api(options).oauth.create params
      end
    end

    def self.update(id, params, options)
      output options do
        github_api(options).oauth.update id, params
      end
    end

    def self.delete(id, params, options)
      output options do
        github_api(options).oauth.delete id, params
      end
    end
  end # Authorization
end # GithubCLI
