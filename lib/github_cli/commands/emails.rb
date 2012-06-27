# encoding: utf-8

module GithubCLI
  class Commands::Emails < Command

    namespace :email

    desc 'list', 'Lists email addresses for the authenticated user'
    def list()
      Email.all options[:params], options[:format]
    end

    desc 'add <email(s)>', 'Add email address(es) for the authenticated user'
    long_desc <<-DESC
      You can include a single email address or an array of addresses
    DESC
    def add(*emails)
      Email.add emails, options[:params], options[:format]
    end

    desc 'delete <email(s)>', 'Delete email address(es) for the authenticated user'
    long_desc <<-DESC
      You can include a single email address or an array of addresses
    DESC
    def delete(*emails)
      Email.delete emails, options[:params], options[:format]
    end

  end # Emails
end # GithubCLI
