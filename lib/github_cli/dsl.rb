# encoding: utf-8

module GithubCLI

  # Defines helpers
  module DSL

    @program_name = $PROGRAM_NAME.split(/\//)[-1]

    # Defines a program name.
    #
    def program_name(name = nil)
      @program_name = name || @program_name
    end

    # Defines behaviour on error to emit consistent type.
    #
    def on_error
      yield
    rescue Github::Error::NotFound => e
      terminal.newline
      ui.error 'Resource Not Found'
      terminal.newline
      exit 15
    rescue GithubCLI::GithubCLIError => e
      GithubCLI.ui.error e.message
      GithubCLI.ui.debug e
      exit e.status_code
    rescue Interrupt => e
      GithubCLI.ui.error "\nQuitting..."
      GithubCLI.ui.debug e
      exit 1
    rescue SystemExit => e
      exit e.status
    rescue Exception => e
      GithubCLI.ui.error "\nFatal error has occurred. " + e.message.to_s
      GithubCLI.ui.debug e
      exit 1
    end

    def before(&block)
    end

    def configure(&block)
    end

  end # DSL
end # GithubCLI
