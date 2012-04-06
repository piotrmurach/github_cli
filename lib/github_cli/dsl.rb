# encoding: utf-8

module GithubCLI
  module DSL
    @@program_name = $0.split(/\//)[-1]
    @@error_block  = nil

    # Defines a program name.
    def program_name(name=nil)
      if name
        @@program_name = name
      end
      @@program_name
    end

    # Defines behaviour on error.
    def on_error(&block)
      @@error_block = block
    end
  end
end
