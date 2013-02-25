# encoding: utf-8

module GithubCLI
  module DSL
    @@program_name = $0.split(/\//)[-1]
    @@error_block  = nil

    # Defines a program name.
    #
    def program_name(name=nil)
      if name
        @@program_name = name
      end
      @@program_name
    end

    # Defines behaviour on error to emit consistent type.
    #
    def on_error
      yield
    rescue Exception => error
      raise GithubCLI::GithubCLIError, "Rescued: #{error}"
    end

    def before(&block)
    end

    def configure(&block)
    end

  end # DSL
end # GithubCLI
