# encoding: utf-8

module GithubCLI
  class Commands::Gists < Command

    namespace :gist

    desc 'list', 'List all gists'
    option :user, :type => :string, :aliases => ["-u"], :banner => '<user>',
           :desc => 'List a <user> gists'
    option :starred, :type => :boolean, :aliases => ["-s"], :default => false,
           :desc => 'List the authenticated users starred gists'
    option :since, :type => :string, :banner => "timestamp",
           :desc => "a timestamp in ISO 8601 format: YYYY-MM-DDTHH:MM:SSZ "
    def list
      if options[:starred]
        Gist.starred options[:params], options[:format]
      else
        params = options[:params].dup
        params['user'] = options[:user] if options[:user]
        Gist.all params, options[:format]
      end
    end

    desc 'get <id>', 'Get a single gist'
    def get(id)
      Gist.get id, options[:params], options[:format]
    end

    option :public, :type => :boolean, :default => false
    option :desc, :type => :string
    option :files, :type => :hash, :banner => "file1.txt:",
           :desc => "Files that make up this gist. The key of which should be a required string filename and the value another required hash with parameters"
    desc 'create', 'Create a gist'
    long_desc <<-DESC
      Create a gist

      Parameters

        description - Optional string\n
        public  - Required boolean\n
        files - Required hash - Files that make up this gist. The key of which should be a required string filename and the value another required hash with parameters: \n
          content - Required string - File contents.
    DESC
    def create
      params = options[:params].dup
      params['description'] = options[:desc] if options[:desc]
      params['public'] = options[:public] || false
      params['files'] = options[:files] if options[:files]
      Gist.create params, options[:format]
    end

    option :desc, :type => :string
    option :files, :type => :hash, :banner => "file1.txt:",
           :desc => "Files that make up this gist. The key of which should be a required string filename and the value another required hash with parameters"
    desc 'edit <id>', 'Edit a gist'
    long_desc <<-DESC
      Edit a gist

      Parameters

        description - Optional string\n
        files - Optional hash - Files that make up this gist. The key of which should be a optional string filename and the value another optional hash with parameters: \n
          content - Updated string - Update file contents.\n
          filename - Optional string - New name for this file.\n
    DESC
    def edit(id)
      params = options[:params].dup
      params['description'] = options[:desc] if options[:desc]
      params['files'] = options[:files] if options[:files]
      Gist.edit id, params, options[:format]
    end

    desc 'star <id>', 'Star a gist'
    def star(id)
      Gist.star id, options[:params], options[:format]
    end

    desc 'unstar <id>', 'Unstar a gist'
    def unstar(id)
      Gist.unstar id, options[:params], options[:format]
    end

    desc 'starred <id>', 'Check if a gist is starred'
    def starred(id)
      Gist.starred? id, options[:params], options[:format]
    end

    desc 'fork <id>', 'Fork a gist'
    def fork(id)
      Gist.fork id, options[:params], options[:format]
    end

    desc 'delete <id>', 'Delete a gist'
    def delete(id)
      Gist.delete id, options[:params], options[:format]
    end

  end # Gists
end # GithubCLI
