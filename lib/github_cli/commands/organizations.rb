# encoding: utf-8

module GithubCLI
  class Commands::Organizations < Command

    namespace :org

    desc 'list', 'List public and private organizations for the authenticated user'
    method_option :user, :type => :string, :aliases => ["-u"],
                  :desc => 'List all public organizations for a user',
                  :banner => '<user>'
    def list
      Organization.list options[:user], options[:params], options[:format]
    end

    desc 'get <org>', 'Get properties for a single organization'
    def get(org)
      Organization.get org, options[:params], options[:format]
    end

    desc 'edit <org>', 'Edit organization'
    long_desc <<-DESC
      Parameters

      billing_email - Optional string - Billing email address. This address is not publicized.\n
      company - Optional string\n
      email - Optional string\n
      location - Optional string\n
      name - Optional string\n
    DESC
    def edit(org)
      Oraanization.edit org, options[:params], options[:format]
    end

  end # Organizations
end # GithubCLI
