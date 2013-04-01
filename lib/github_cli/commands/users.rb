# encoding: utf-8

module GithubCLI
  class Commands::Users < Command

    namespace :user

    desc 'list', 'List all users'
    option :since, :type => :string, :banner => "<user>",
           :desc => "The integer ID of the last User that you’ve seen."
    def list
      params = options[:params].dup
      params['since'] = options[:since] if options[:since]
      User.all params, options[:format]
    end

    desc 'get', 'Get the authenticated user'
    option :user, :type => :string, :aliases => ["-u"],
           :desc => 'Get a single unauthenticated <user>',
           :banner => '<user>'
    def get
      params = options[:params].dup
      params['user'] = options[:user] if options[:user]
      User.get params, options[:format]
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
      params = options[:params].dup
      params['name']     = options[:name]     if options[:name]
      params['email']    = options[:email]    if options[:email]
      params['blog']     = options[:blog]     if options[:blog]
      params['company']  = options[:company]  if options[:company]
      params['location'] = options[:location] if options[:location]
      params['hireable'] = options[:hireable] if options[:hireable]
      params['bio']      = options[:bio]      if options[:bio]
      User.update params, options[:format]
    end

  end # Users
end # GithubCLI
