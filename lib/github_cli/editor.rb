# encoding: utf-8

module GithubCLI
  # This class determines editor to use to open the output.
  class Editor

    def initialize(options={})
    end

    def editor
      editors = [ ENV['GHC_EDITOR'], ENV['VISUAL'], ENV['EDITOR'], 'vi' ]
      editor = GithubCLI.config['editor']
      editor ||= editors.find { |e| !e.nil? && !e.empty? }
    end

    def open(name)
      if editor
        command = "#{editor} #{name}"
        success = system(command)
        GithubCLI.ui.info "Could not run '#{command}'" unless success
      else
        GithubCLI.info("To open output, set $EDITOR or $VISUL")
      end
    end

  end # Editor
end # GithubCLI
