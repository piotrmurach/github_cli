# frozen_string_literal: true

require_relative "../apis/user"
require_relative "../util"
require_relative "../command"

module GithubCLI
  module Commands
    class Users < Command

      namespace :user

      desc "list", "List all users"
      option :since, :type => :string, :banner => "<user>",
            :desc => "The integer ID of the last User that you’ve seen."
      def list
        global_options = options.dup
        params = options[:params].dup
        params["since"] = options[:since] if options[:since]
        Util.hash_without!(global_options, params.keys + ["params"])
        User.all params, global_options
      end

      desc "get", "Get the authenticated user"
      option :user, :type => :string, :aliases => ["-u"],
            :desc => "Get a single unauthenticated <user>",
            :banner => "<user>"
      def get
        global_options = options.dup
        params = options[:params].dup
        params["user"] = options[:user] if options[:user]
        Util.hash_without!(global_options, params.keys + ["params"])
        User.get(params, global_options)
      end

      desc "update", "Update the authenticated user"
      option :name, :type => :string, desc: "The new name of the user."
      option :email, :type => :string, desc: "The publicly visible email address of the user."
      option :blog, :type => :string, desc: "The new blog URL of the user."
      option :company,  :type => :string, desc: "The new company of the user."
      option :location, :type => :string, desc: "The new location of the user."
      option :hireable, :type => :boolean, desc: "The new hiring availability of the user.
      "
      option :bio, :type => :string, desc: "The new short biography of the user."
      def update
        global_options = options.dup
        params = options[:params].dup
        params["name"]     = options[:name]     if options.key?("name")
        params["email"]    = options[:email]    if options.key?("email")
        params["blog"]     = options[:blog]     if options.key?("blog")
        params["company"]  = options[:company]  if options.key?("company")
        params["location"] = options[:location] if options.key?("location")
        params["hireable"] = options[:hireable] if options.key?("hireable")
        params["bio"]      = options[:bio]      if options.key?("bio")
        Util.hash_without!(global_options, params.keys + ["params"])
        User.update(params, global_options)
      end
    end # Users
  end # Commands
end # GithubCLI
