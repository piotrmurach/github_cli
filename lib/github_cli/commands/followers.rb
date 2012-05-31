# encoding: utf-8

module GithubCLI
  class Commands::Followers < Command

    namespace :follower

    desc 'list', "Lists an authenticated user's followers"
    method_option :user, :type => :string, :aliases => ["-u"],
                  :desc => 'List a <user> followers',
                  :banner => '<user>'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additional request parameters e.i per_page:100'
    def list
      Follower.all options[:user], options[:params], options[:format]
    end

    desc 'following', 'List who the authenticated user is following'
    method_option :user, :type => :string, :aliases => ["-u"],
                  :desc => 'List who a <user> is following',
                  :banner => '<user>'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additional request parameters e.i per_page:100'
    def following
      Follower.following options[:user], options[:params], options[:format]
    end

    desc 'follower <user>', 'Check if you are following a user'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additional request parameters e.i per_page:100'
    def follower(user)
      Follower.following? user, options[:params], options[:format]
    end

    desc 'follow <user>', 'Follow a user'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additional request parameters e.i per_page:100'
    def follow(user)
      Follower.follow user, options[:params], options[:format]
    end

    desc 'unfollow <user>', 'Unfollow a user'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additional request parameters e.i per_page:100'
    def unfollow(user)
      Follower.unfollow user, options[:params], options[:format]
    end

  end # Followers
end # GithubCLI
