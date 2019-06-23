# frozen_string_literal: true

module GithubCLI
  # Class responsible for displaying different level information
  class UI
    attr_writer :shell

    def initialize(shell)
      @shell = shell
      @quite = false
      @debug = ENV['DEBUG']
    end

    def confirm(message, newline = nil)
      @shell.say message, :green, newline
    end

    def info(message, newline = nil)
      @shell.say message, nil, newline
    end

    def warn(message, newline = nil)
      @shell.say message, :yellow, newline
    end

    def error(message, newline = nil)
      @shell.say message, :red, newline
    end

    def debug(error, newline = nil)
      message = ["#{error.class}: #{error.message}", *error.backtrace]
      @shell.say message.join("\n"), nil, newline
    end

    def quite!
      @quite = true
    end

    def debug!
      @debug = true
    end

    def print_table(table, options = {})
      @shell.print_table table, options
    end

    def print_wrapped(message, options = {})
      @shell.print_wrapped message, options
    end
  end # UI
end # GithubCLI
