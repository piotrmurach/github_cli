# encoding: utf-8

module GithubCLI
  class Commands::Downloads < Command

    namespace :download

    desc 'list <user> <repo>', 'Lists downloads'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additional request parameters e.i per_page:100'
    def list(user, repo)
      Download.all user, repo, options[:params]
    end

    desc 'get <user> <repo> <id>', 'Get a download'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additional request parameters e.i per_page:100'
    def get(user, repo, id)
      Download.get user, repo, id, options[:params]
    end

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
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def create(user, repo)
      Download.create user, repo, options[:params]
    end

    desc 'upload <resource> <filename>', 'Upload resource to s3'
    long_desc <<-DESC
      Upload a file to Amazon, using the reponse instance from
      Github::Repos::Downloads#create_download. 

      This can be done by passing the response object
      as an argument to upload method.

      Parameters

        resource - Required resource of the create_download call. \n
        filename - Required filename, a path to a file location. \n
    DESC
    def upload(resource, filename)
      Download.upload resource, filename
    end

    desc 'delete <user> <repo> <id>', 'Delete a download'
    method_option :params, :type => :hash, :default => {},
                  :desc => 'Additonal request parameters e.i per_page:100'
    def delete(user, repo, id)
      Download.delete user, repo, id, options[:params]
    end

  end # Downloads
end # GithubCLI
