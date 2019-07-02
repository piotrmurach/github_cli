# frozen_string_literal: true

require_relative '../api'

module GithubCLI
  class Gist
    extend API

    def self.all(params, options)
      args = options[:public] ? ['public', params] : [params]
      output options do
        github_api(options).gists.list *args
      end
    end

    def self.starred(params, options)
      output options do
        github_api(options).gists.starred params
      end
    end

    def self.get(id, params, options)
      output options do
        github_api(options).gists.get id, params
      end
    end

    def self.create(params, options)
      output options do
        github_api(options).gists.create params
      end
    end

    def self.edit(id, params, options)
      output options do
        github_api(options).gists.edit id, params
      end
    end

    def self.star(id, params, options)
      output options do
        github_api(options).gists.star id, params
      end
    end

    def self.unstar(id, params, options)
      output options do
        github_api(options).gists.unstar id, params
      end
    end

    def self.starred?(id, params, options)
      output options do
        github_api(options).gists.starred? id, params
      end
    end

    def self.fork(id, params, options)
      output options do
        github_api(options).gists.fork id, params
      end
    end

    def self.delete(id, params, options)
      output options do
        github_api(options).gists.delete id, params
      end
    end
  end # Gist
end # GithubCLI
