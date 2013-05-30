# encoding: utf-8

module GithubCLI
  class Commands::Downloads < Command

    namespace :download

    desc 'list <user> <repo>', 'Lists downloads'
    def list(user, repo)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Download.all user, repo, params, global_options
    end

    desc 'get <user> <repo> <id>', 'Get a download'
    def get(user, repo, id)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Download.get user, repo, id, params, global_options
    end


    option :name, :type => :string, :required => true,
           :desc => 'name of the file that is being created.'
    option :size, :type => :numeric, :required => true,
           :desc => 'size of file in bytes'
    option :desc, :type => :string
    option :type, :type => :string
    desc 'create <user> <repo>', 'Create a new download resource'
    long_desc <<-DESC
      Creating a new download is a two step process.

      You must first create a new download resource using this method.
      Response from this method is to be used in #upload method.

      Inputs

        name - Required string - name of the file that is being created. \n
        size - Required number - size of file in bytes. \n
        description - Optional string \n
        content_type - Optional string \n
    DESC
    def create(user, repo)
      global_options = options.dup
      params = options[:params].dup
      params['name'] = options[:name]
      params['size'] = options[:size]
      params['descritpion']  = options[:desc] if options[:desc]
      params['content_type'] = options[:type] if options[:type]
      Util.hash_without!(global_options, params.keys + ['params'])
      Download.create user, repo, params, global_options
    end

    desc 'upload <resource> <filename>', 'Upload resource to s3'
    long_desc <<-DESC
      Upload a file to Amazon, using the reponse instance from
      Github::Repos::Downloads#create

      This can be done by passing the response object
      as an argument to upload method.

      Parameters

        resource - Required resource of the create_download call. \n
        filename - Required filename, a path to a file location. \n
    DESC
    def upload(resource, filename)
      global_options = options.dup
      Util.hash_without!(global_options, ['params'])
      Download.upload resource, filename, global_options
    end

    desc 'delete <user> <repo> <id>', 'Delete a download'
    def delete(user, repo, id)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Download.delete user, repo, id, params, global_options
    end

  end # Downloads
end # GithubCLI
