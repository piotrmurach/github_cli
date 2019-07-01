# frozen_string_literal: true

require_relative '../apis/gist'
require_relative '../util'
require_relative '../command'

module GithubCLI
  class Commands::Gists < Command

    namespace :gist

    desc 'list', 'List all gists'
    option :user, :type => :string, :aliases => ["-u"], :banner => '<user>',
           :desc => 'List a <user> gists'
    option :starred, :type => :boolean, :aliases => ["-s"], :default => false,
           :desc => 'List the authenticated users starred gists'
    option :public, :type => :boolean,
           :desc => "List all public gists"
    option :since, :type => :string, :banner => "timestamp",
           :desc => "a timestamp in ISO 8601 format: YYYY-MM-DDTHH:MM:SSZ "
    def list
      global_options = options.dup
      params = options[:params].dup
      if options[:starred]
        Util.hash_without!(global_options, params.keys + ['params', 'starred'])
        Gist.starred params, global_options
      else
        params['user'] = options[:user] if options[:user]
        Util.hash_without!(global_options, params.keys + ['params', 'user'])
        Gist.all params, global_options
      end
    end

    desc 'get <id>', 'Get a single gist'
    def get(id)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params'])
      Gist.get id, params, global_options
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
      global_options = options.dup
      params = options[:params].dup
      params['description'] = options[:desc] if options[:desc]
      params['public'] = options[:public] || false
      params['files']  = options[:files] if options[:files]
      Util.hash_without!(global_options, params.keys + ['params', 'desc'])
      Gist.create params, global_options
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
      global_options = options.dup
      params = options[:params].dup
      params['description'] = options[:desc] if options[:desc]
      params['files'] = options[:files] if options[:files]
      Util.hash_without!(global_options, params.keys + ['params', 'desc'])
      Gist.edit id, params, global_options
    end

    desc 'star <id>', 'Star a gist'
    def star(id)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params', 'desc'])
      Gist.star id, params, global_options
    end

    desc 'unstar <id>', 'Unstar a gist'
    def unstar(id)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params', 'desc'])
      Gist.unstar id, params, global_options
    end

    desc 'starred <id>', 'Check if a gist is starred'
    def starred(id)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params', 'desc'])
      Gist.starred? id, params, global_options
    end

    desc 'fork <id>', 'Fork a gist'
    def fork(id)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params', 'desc'])
      Gist.fork id, params, global_options
    end

    desc 'delete <id>', 'Delete a gist'
    def delete(id)
      global_options = options.dup
      params = options[:params].dup
      Util.hash_without!(global_options, params.keys + ['params', 'desc'])
      Gist.delete id, params, global_options
    end
  end # Gists
end # GithubCLI
