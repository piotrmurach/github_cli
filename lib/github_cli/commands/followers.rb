# frozen_string_literal: true

require_relative '../apis/follower'
require_relative '../util'
require_relative '../command'

module GithubCLI
  class Commands::Followers < Command

    namespace :follower

    desc 'list', "Lists an authenticated user's followers"
    method_option :user, :type => :string, :aliases => ["-u"],
                  :desc => 'List a <user> followers',
                  :banner => '<user>'
    def list
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params', 'user'])
      Follower.all options[:user], params, global_options
    end

    desc 'following', 'List who a user/the authenticated user is following'
    method_option :user, :type => :string, :aliases => ["-u"],
                  :desc => 'List who a <user> is following',
                  :banner => '<user>'
    def following
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params', 'user'])
      Follower.following options[:user], params, global_options
    end

    desc 'follower <user>', 'Check if you are following a user'
    def follower(user)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Follower.follower user, params, global_options
    end

    desc 'follow <user>', 'Follow a user'
    def follow(user)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Follower.follow user, params, global_options
    end

    desc 'unfollow <user>', 'Unfollow a user'
    def unfollow(user)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Follower.unfollow user, params, global_options
    end

  end # Followers
end # GithubCLI
