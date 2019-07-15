# frozen_string_literal: true

require 'forwardable'

module GithubCLI
  # Class responsible for displaying different level information
  class UI
    extend Forwardable

    def_delegators :@prompt, :ask, :mask, :suggest

    def initialize(prompt)
      @prompt = prompt
      @quite = false
      @debug = ENV['DEBUG']
      @shell = Thor::Shell::Basic.new
    end

    def confirm(message)
      @prompt.ok(message)
    end

    def info(message)
      @prompt.say(message)
    end

    def warn(messag)
      @prompt.warn(message)
    end

    def error(message)
      @prompt.error(message)
    end

    def debug(error, newline = nil)
      message = ["#{error.class}: #{error.message}", *error.backtrace]
      @prompt.say(message.join("\n"))
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
  end # UI
end # GithubCLI
