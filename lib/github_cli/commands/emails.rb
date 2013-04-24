# encoding: utf-8

module GithubCLI
  class Commands::Emails < Command

    namespace :email

    desc 'list', 'Lists email addresses for the authenticated user'
    def list
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Email.all params, global_options
    end

    desc 'add <email>[<email>...]', 'Add email address(es) for the authenticated user'
    long_desc <<-DESC
      You can include a single email address or an array of addresses
    DESC
    def add(*emails)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Email.add emails, params, global_options
    end

    desc 'delete <email>[<email>...]', 'Delete email address(es) for the authenticated user'
    long_desc <<-DESC
      You can include a single email address or an array of addresses
    DESC
    def delete(*emails)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Email.delete emails, params, global_options
    end

  end # Emails
end # GithubCLI
