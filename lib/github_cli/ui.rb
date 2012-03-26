# encoding: utf-8

module GithubCLI
  class UI
    attr_writer :shell

    def initialize(shell)
      @shell = shell
    end

    def confirm(message)
      @shell.say message, :green
    end

    def info(message)
      @shell.say message, nil
    end

    def warn(message)
      @shell.say message, :yellow
    end

    def error(message)
      @shell.say message, :red
    end

    def debug(message)
      @shell.say message
    end

    def debug!
      @debug = true
    end
  end # UI
end # GithubCLI
