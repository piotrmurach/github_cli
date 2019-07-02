# frozen_string_literal: true

require_relative '../api'

module GithubCLI
  class Follower
    extend API

    def self.all(user, params, options)
      args = user ? [user, params] : [params]
      output options do
        github_api(options).users.followers.list *args
      end
    end

    def self.following(user, params, options)
      output options do
        github_api(options).users.followers.following user, params
      end
    end

    def self.follower(user, params, options)
      output options do
        github_api(options).users.followers.following? user, params
      end
    end

    def self.follow(user, params, options)
      output options do
        github_api(options).users.followers.follow user, params
      end
    end

    def self.unfollow(user, params, options)
      output options do
        github_api(options).users.followers.unfollow user, params
      end
    end
  end # Follower
end # GithubCLI
