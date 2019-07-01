# frozen_string_literal: true

require_relative '../apis/user'
require_relative '../util'
require_relative '../command'

module GithubCLI
  module Commands
    class Users < Command

      namespace :user

      desc 'list', 'List all users'
      option :since, :type => :string, :banner => "<user>",
            :desc => "The integer ID of the last User that you’ve seen."
      def list
        global_options = options.dup
        params = options[:params].dup
        params['since'] = options[:since] if options[:since]
        Util.hash_without!(global_options, params.keys + ['params'])
        User.all params, global_options
      end

      desc 'get', 'Get the authenticated user'
      option :user, :type => :string, :aliases => ["-u"],
            :desc => 'Get a single unauthenticated <user>',
            :banner => '<user>'
      def get
        global_options = options.dup
        params = options[:params].dup
        params['user'] = options[:user] if options[:user]
        Util.hash_without!(global_options, params.keys + ['params'])
        User.get params, global_options
      end

      desc 'update', 'Update the authenticated user'
      option :name, :type => :string
      option :email, :type => :string
      option :blog, :type => :string
      option :company,  :type => :string
      option :location, :type => :string
      option :hireable, :type => :string
      option :bio, :type => :string
      def update
        global_options = options.dup
        params = options[:params].dup
        params['name']     = options[:name]     if options[:name]
        params['email']    = options[:email]    if options[:email]
        params['blog']     = options[:blog]     if options[:blog]
        params['company']  = options[:company]  if options[:company]
        params['location'] = options[:location] if options[:location]
        params['hireable'] = options[:hireable] if options[:hireable]
        params['bio']      = options[:bio]      if options[:bio]
        Util.hash_without!(global_options, params.keys + ['params'])
        User.update params, global_options
      end
    end # Users
  end # Commands
end # GithubCLI
