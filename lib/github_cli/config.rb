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
      File.open(@filename, 'w', 0600) do |file|
        YAML.dump(config, file)
      end
    end

    def load
      File.open(@filename, 'r') do |file|
        YAML.load(file)
      end
    end

    def global_config_file
      "#{ENV['HOME']}/#{@filename}"
    end

  end
end # GithubCLI
