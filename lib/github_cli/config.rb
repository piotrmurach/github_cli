# encoding: utf-8

module GithubCLI
  class Config
    COMMAND_KEY = 'commands'

    def initialize(config_filename, options={})
      @filename = config_filename
      @options = options
    end

    def save(config)
      config[COMMAND_KEY] = {}
      Command.all.each do |cmd|
        if !cmd.namespace.empty? && cmd.name != 'help'
          config[COMMAND_KEY]["#{cmd.namespace}-#{cmd.name}"] = { }
        end
      end
      File.open(path, 'w', 0600) do |file|
        YAML.dump(config, file)
      end
    end

    def load
      if File.exists? path
        File.open(path, 'r') do |file|
          YAML.load(file)
        end
      else
        {}
      end
    end

    def path
      require 'pathname'
      if Pathname.new(@filename).absolute?
        @filename
      else
        File.join Thor::Util.user_home, "/#{@filename}"
      end
    end

  end # Config
end # GithubCLI
