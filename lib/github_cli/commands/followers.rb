# encoding: utf-8

module GithubCLI
  class Commands::Followers < Command

    namespace :follower

    desc 'list', "Lists an authenticated user's followers"
    method_option :user, :type => :string, :aliases => ["-u"],
                  :desc => 'List a <user> followers',
                  :banner => '<user>'
    def list
      Follower.all options[:user], options[:params], options[:format]
    end

    desc 'following', 'List who a user/the authenticated user is following'
    method_option :user, :type => :string, :aliases => ["-u"],
                  :desc => 'List who a <user> is following',
                  :banner => '<user>'
    def following
      Follower.following options[:user], options[:params], options[:format]
    end

    desc 'follower <user>', 'Check if you are following a user'
    def follower(user)
      Follower.follower user, options[:params], options[:format]
    end

    desc 'follow <user>', 'Follow a user'
    def follow(user)
      Follower.follow user, options[:params], options[:format]
    end

    desc 'unfollow <user>', 'Unfollow a user'
    def unfollow(user)
      Follower.unfollow user, options[:params], options[:format]
    end

  end # Followers
end # GithubCLI
