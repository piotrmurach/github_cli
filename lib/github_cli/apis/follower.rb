# encoding: utf-8

module GithubCLI
  class Follower < API

    class << self

      def all(user, params, options)
        args = user ? [user, params] : [params]
        output options[:format], options[:quiet] do
          github_api(options).users.followers.list *args
        end
      end

      def following(user, params, options)
        output options[:format], options[:quiet] do
          github_api(options).users.followers.following user, params
        end
      end

      def follower(user, params, options)
        output options[:format], options[:quiet] do
          github_api(options).users.followers.following? user, params
        end
      end

      def follow(user, params, options)
        output options[:format], options[:quiet] do
          github_api(options).users.followers.follow user, params
        end
      end

      def unfollow(user, params, options)
        output options[:format], options[:quiet] do
          github_api(options).users.followers.unfollow user, params
        end
      end
    end

  end # Follower
end # GithubCLI
