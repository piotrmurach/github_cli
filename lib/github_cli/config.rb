# encoding: utf-8

module GithubCLI
  class Config

    COMMAND_KEY  = 'commands'
    COMMAND_HELP = 'help'

    attr_reader :root

    def initialize(root, options={})
      @root = root
      @local_config  = local_options_file
      @global_config = global_options_file
    end

    def []=(key, value)
      set_key(key, value)
      @data = nil
    end

    def [](key)
      data[key] || data[COMMAND_KEY][key] rescue nil
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

    def keys
      data.keys
    end

    def save(config)
      config[COMMAND_KEY] = {}
      Command.all.each do |cmd|
        if !cmd.namespace.empty? && cmd.name != COMMAND_HELP
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
      if File.exists?(local_options_file)
        local_options_file
      else
        global_options_file
      end
    end

  private

    def local_options_file
      Pathname.new "#{root}/.githubrc"
    end

    def global_options_file
      begin
        Pathname.new File.join(Thor::Util.user_home, ".githubrc")
      rescue ArgumentError
        GithubCLI.ui.warn "Unable to find ~/.githubrc because the HOME environment variable is not set"
        nil
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

    def inspect
      "#{self.class.inspect} @root=#{root}"
    end

  end # Config
end # GithubCLI
