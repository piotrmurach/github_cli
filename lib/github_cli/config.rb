# encoding: utf-8

module GithubCLI
  class Config

    COMMAND_KEY  = 'commands'.freeze

    COMMAND_HELP = 'help'.freeze

    DEFAULT_NAME = '.githubrc'.freeze

    # Contains information of where the command is run from.
    attr_reader :root

    # Location scope of currently used configuration file.
    attr_reader :location

    # Name for the confiugration file
    attr_accessor :filename

    # Initialize a Config
    #
    # @api public
    def initialize(root, options={})
      @root          = root
      @filename      = options.fetch(:filename) { DEFAULT_NAME }
      @local_config  = local_options_file
      @global_config = global_options_file
    end

    def []=(key, value)
      set_key(key, value)
      @data = nil
    end

    def [](key)
      data[key] || data["#{COMMAND_KEY}.#{key}"] rescue nil
    end

    def fetch(key, default=nil)
      self[key] || default || raise(IndexError.new("key #{key} not found"))
    end

    def delete(key)
      data.delete(key)
    end

    def data
      @data ||= self.load
    end

    def keys
      data.keys
    end

    def all
      data
    end

    def pretty(pattern="")
      all.keys.zip(all.values).map do |el|
        el.last.nil? ? [el.first, 'UNDEFINED'] : el
      end.select { |el| el.first =~ /^#{pattern}.*$/i }
    end

    def location=(loc)
      @location = loc
      @data = nil
    end

    def save(config)
      Command.all.each do |cmd|
        composite_key = "#{COMMAND_KEY}.#{cmd.namespace}.#{cmd.name}"
        if !cmd.namespace.empty? && cmd.name != COMMAND_HELP &&
           !config.has_key?(composite_key)
          config[composite_key]= nil
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
      if location == 'local' || File.exists?(local_options_file)
        local_options_file
      else
        global_options_file
      end
    end

  private

    def local_options_file
      Pathname.new "#{root}/#{filename}"
    end

    def global_options_file
      begin
        Pathname.new File.join(Thor::Util.user_home, filename)
      rescue ArgumentError
        GithubCLI.ui.warn "Unable to find ~/.githubrc because the HOME environment variable is not set"
        exit 1
      end
    end

    def set_key(key, value)
      unless data[key] == value
        data[key] = value
        data.delete(key) if value.nil?
        save data
      end
      value
    end

    def inspect
      "#{self.class.inspect} @root=#{root}"
    end

  end # Config
end # GithubCLI
