require_relative 'vendor'

module GithubCLI
  # Main class with utility methods for building commands.
  class Command < Thor

    HELP_COMMAND = 'help'

    # Internally used command representation
    class Cmd < Struct.new(:namespace, :name, :desc, :usage); end

    def self.output_formats
      {
        'csv' => nil,
        'json' => nil,
        'pretty' => nil,
        'table' => nil
      }
    end

    ALIASES = {
      "ls"  => :list,
      "all" => :list,
      "del" => :delete,
      "rm"  => :delete,
      "c"   => :create,
      "e"   => :edit
    }
    map ALIASES

    class_option :format, :type => :string, :aliases => '-f',
                 :default => 'table',
                 :banner => output_formats.keys.join('|'),
                 :desc => "Format of the output. Type table:h to display table horizontally."
    class_option :quiet, :type => :boolean, :aliases => "-q",
                 :desc => "Suppress response output"
    class_option :params, :type => :hash, :default => {}, :aliases => '-p',
                 :desc => 'Request parameters e.i per_page:100'

    def self.is_api_command?(namespace)
      !%w[c_l_i command thor].include?(namespace)
    end

    def self.extract_namespace(klass)
      klass.namespace.split(':').last
    end

    # Search for all commands
    #
    def self.all
      commands = []
      Thor::Base.subclasses.each do |klass|
        namespace = extract_namespace(klass)
        next unless is_api_command?(namespace)

        klass.tasks.each do |task|
          last_task = task.last
          name = last_task.name
          next if name.index HELP_COMMAND
          commands << Cmd.new(namespace, name, last_task.description, last_task.usage)
        end
      end
      commands
    end

    # Decide whether to show specific command or display placeholder
    #
    def self.command_to_show(command)
      command_token = Command.all.find do |cmd|
        cmd_index = command.index('<') || -1
        namespace = cmd.namespace
        !namespace.empty? && command[0..cmd_index].include?(namespace)
      end
      command_token ? command_token.namespace : '<command>'
    end
  end # Command
end # GithubCLI
