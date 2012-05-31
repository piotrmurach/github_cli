# encoding: utf-8

module GithubCLI
  class Follower < API

    class << self

      def all(user, params, format)
        output format do
          github_api.users.followers.list user, params
        end
      end

      def following(user, params, format)
        output format do
          github_api.users.followers.following user, params
        end
      end

      def follower(user, params, format)
        output format do
          github_api.users.followers.following? user, params
        end
      end

      def follow(user, params, format)
        output format do
          github_api.users.followers.follow user, params
        end
      end

      def unfollow(user, params, format)
        output format do
          github_api.users.followers.unfollow user, params
        end
      end
    end

  end # Follower
end # GithubCLI
