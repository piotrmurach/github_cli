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

    def print_table(table, options={})
      @shell.print_table table, options
    end

    def print_wrapped(message, options={})
      @shell.print_wrapped message, options
    end

    def terminal_width
      @shell.terminal_width
    end
  end # UI
end # GithubCLI
