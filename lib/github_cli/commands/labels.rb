# frozen_string_literal: true

require_relative "../apis/label"
require_relative "../util"
require_relative "../command"

module GithubCLI
  module Commands
    class Labels < Command

      namespace :label

      desc "list <user> <repo>", "Listing all labels for this repository."
      option :milestone, :type => :string, :aliases => ["-m"],
            :banner => "<milestone>",
            :desc => "List labels for every issue in a milestone."
      option :issue, :type => :string, :aliases => ["-i"], :banner => "<issue>",
            :desc => "List labels on an issue."
      def list(user, repo)
        global_options = options.dup
        params = options[:params].dup
        params_remove = params.keys + ["params"]
        if (milestone_id = options[:milestone])
          params["milestone_id"] = milestone_id
          params_remove << "milestone"
        elsif (issue_id = options[:issue])
          params["issue_id"] = issue_id
          params_remove << "issue"
        end
        Util.hash_without!(global_options, params_remove)
        Label.all user, repo, params, global_options
      end

      desc "get <user> <repo> <name>", "Get a single label."
      def get(user, repo, name)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        Label.get user, repo, name, params, global_options
      end

      option :name, :type => :string, :required => true,
             :desc => "The name of the label. "
      option :color, :type => :string, :required => true,
             :desc => "The hexadecimal color code for the label, without the leading #."
      option :desc, :type => :string, :desc => "A short description of the label."
      desc "create <user> <repo>", "Create a label."
      long_desc <<-DESC
        Parameters

          name - string - Required. The name of the label. Emoji can be added to label names, using either native emoji or colon-style markup. For example, typing :strawberry: will render the emoji :strawberry:. For a full list of available emoji and codes, see emoji-cheat-sheet.com.\n
          color - string -  Required. The hexadecimal color code for the label, without the leading #.\n
          description - string - A short description of the label.
      DESC
      def create(user, repo)
        global_options = options.dup
        params = options[:params].dup
        params["name"]  = options[:name]
        params["color"] = options[:color]
        params["description"] = options[:desc] if options.key?("desc")
        Util.hash_without!(global_options, params.keys + ["params", "desc"])
        Label.create user, repo, params, global_options
      end

      option :name, :type => :string, :required => true,
             :desc => "The name of the label. "
      option :color, :type => :string, :required => true,
             :desc => "The hexadecimal color code for the label, without the leading #."
      option :desc, :type => :string, :desc => "A short description of the label."
      desc "update <user> <repo> <name>", "Update a label."
      long_desc <<-DESC
        Inputs
          name - string - Required. The name of the label. Emoji can be added to label names, using either native emoji or colon-style markup. For example, typing :strawberry: will render the emoji :strawberry:. For a full list of available emoji and codes, see emoji-cheat-sheet.com.\n
          color - string -  Required. The hexadecimal color code for the label, without the leading #.\n
          description - string - A short description of the label.
      DESC
      def update(user, repo, name)
        global_options = options.dup
        params = options[:params].dup
        params["name"]  = options[:name] if options.key?("name")
        params["color"] = options[:color] if options.key?("color")
        params["description"] = options[:desc] if options.key?("desc")
        Util.hash_without!(global_options, params.keys + ["params", "desc"])
        Label.update(user, repo, name, params, global_options)
      end

      desc "delete <user> <repo> <name>", "Delete a label."
      def delete(user, repo, name)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        Label.delete user, repo, name, params, global_options
      end

      desc "add <user> <repo> <number> <label>[<label>...]", "Add labels to issue <number>."
      def add(user, repo, number, *args)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        Label.add user, repo, number, args, params, global_options
      end

      desc "remove <user> <repo> [<name>/]<number>", "Remove label<name> from an issue<number>"
      def remove(user, repo, number)
        name, number  = Arguments.new(number).parse
        global_options = options.dup
        params = options[:params].dup
        params["label_name"] = name if name
        Util.hash_without!(global_options, params.keys + ["params"])
        Label.remove user, repo, number, params, global_options
      end

      desc "replace <user> <repo> <number> <label>[<label>...]", "Replace all labels for an issue <number>."
      def replace(user, repo, number, *args)
        global_options = options.dup
        params = options[:params].dup
        Util.hash_without!(global_options, params.keys + ["params"])
        Label.replace user, repo, number, args, params, global_options
      end
    end # Labels
  end # Commands
end # GithubCLI
