# encoding: utf-8

module GithubCLI
  class Commands::Users < Command

    namespace :user

    desc 'get', 'Get the authenticated user'
    method_option :user, :type => :string, :aliases => ["-u"],
                  :desc => 'Get a single unauthenticated <user>',
                  :banner => '<user>'
    def get
      User.get options[:user], options[:params], options[:format]
    end

    desc 'update', 'Update the authenticated user'
    def update
      User.update options[:params], options[:format]
    end

  end # Users
end # GithubCLI
