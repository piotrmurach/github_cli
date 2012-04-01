# encoding: utf-8

module GithubCLI
  class Config
    COMMAND_KEY = 'commands'

    def initialize(config_filename=nil)
      @filename = config_filename || '.githubrc'
    end

    def []=(key, value)
      set_key(key, value)
      @data = nil
    end

    def [](key)
      data[key] || data[COMMAND_KEY][key]
    end

    def fetch(key, default=nil)
      data[key] || default || raise(IndexError.new("key #{key} not found"))
    end

    def delete(key)
      @data.delete(key)
    end

    def data
      @data ||= self.load
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
      yaml = {}
      if File.exists? path
        yaml = File.open(path, 'r') do |file|
          YAML.load(file)
        end
      end
      yaml
    end

    def path
      require 'pathname'
      if Pathname.new(@filename).absolute?
        @filename
      else
        File.join Thor::Util.user_home, "/#{@filename}"
      end
    end

    def set_key(key, value)
      unless data[key] == value
        data[key] = value
        data.delete(key) if value.nil?
        save data.to_yaml
      end
      value
    end

  end # Config
end # GithubCLI
