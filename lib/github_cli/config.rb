# encoding: utf-8

module GithubCLI
  class Config
    COMMAND_KEY = 'commands'

    def initialize(config_filename, options={})
      @filename = config_filename
      @options = options
    end

    # TODO: All commands go in there as well
    def save(config)
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
