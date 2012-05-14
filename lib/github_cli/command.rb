# encoding: utf-8

module GithubCLI
  class Command < Thor
    include Thor::Actions

    API_CLASSES = %w(
      c_l_i
      repo download key fork hook watch collab
      issue label milestone
      tag tree blob reference commit
      pull
    )

    HELP_COMMAND = 'help'

    class Comm < Struct.new(:namespace, :name, :desc, :usage); end


    def self.output_formats
      {
        'csv' => nil,
        'json' => nil,
        'pretty' => nil,
        'table' => nil
      }
    end

    map "ls" => :list,
        "del" => :delete

    class_option :format, :type => :string, :aliases => '-f',
                 :default => 'table',
                 :banner => output_formats.keys.join('|'),
                 :desc => "Format of the output"

    def self.banner(task, namespace=true, subcommand=true)
      "#{basename} #{task.formatted_usage(self, true, subcommand)}"
    end

    def self.all
      commands = []
      Base.subclasses.each do |klass|
        namespace = extract_namespace(klass)
        next unless is_api_command?(namespace)
        namespace = "" if namespace.index API_CLASSES.first

        klass.tasks.each do |task|
          next if task.last.name.index HELP_COMMAND
          commands << Comm.new(namespace,
                               task.last.name,
                               task.last.description,
                               task.last.usage)
        end
      end
      commands
    end

    def self.is_api_command?(klass)
      return false unless API_CLASSES.include?(klass.to_s)
      return true
    end

    def self.extract_namespace(klass)
      klass.namespace.split(':').last
    end

  end # Command
end # GithubCLI
