# frozen_string_literal: true

require_relative '../apis/organization'
require_relative '../util'
require_relative '../command'

module GithubCLI
  class Commands::Organizations < Command

    namespace :org

    desc 'list [--user=<name>]', 'List public and private organizations for the authenticated user'
    method_option :user, :type => :string, :aliases => ["-u"],
                  :desc => 'List all public organizations for a user',
                  :banner => '<user>'
    def list
      global_options = options.dup
      params = options[:params].dup
      params['user'] = options[:user] if options[:user]
      Util.hash_without!(global_options, params.keys + ['params'])
      Organization.list params, global_options
    end

    desc 'get <org>', 'Get properties for a single organization'
    def get(org)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Organization.get org, params, global_options
    end

    option :billing_email, :type => :string
    option :company, :type => :string
    option :email, :type => :string
    option :location, :type => :string
    option :name, :type => :string
    desc 'edit <org>', 'Edit organization'
    long_desc <<-DESC
      Parameters

      billing_email - Optional string - Billing email address. This address is not publicized.\n
      company - Optional string\n
      email - Optional string\n
      location - Optional string\n
      name - Optional string\n

      Example

      gcli org edit rails --name=github --company=GitHub --email=support@github.com
    DESC
    def edit(org)
      global_options = options.dup
      params = options[:params].dup
      params['billing_email'] = options[:billing_email] if options[:billing_email]
      params['company']  = options[:company]  if options[:company]
      params['email']    = options[:email]    if options[:email]
      params['location'] = options[:location] if options[:location]
      params['name']     = options[:name]     if options[:name]
      Util.hash_without!(global_options, params.keys + ['params'])
      Organization.edit org, params, global_options
    end
  end # Organizations
end # GithubCLI
