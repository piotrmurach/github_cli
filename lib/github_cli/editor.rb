# encoding: utf-8

module GithubCLI
  # This class determines editor to use to open the output.
  class Editor

    attr_accessor :filename

    def initialize(filename, options={})
      @filename = filename
    end

    def editor
      editors = [ ENV['GCLI_EDITOR'], ENV['VISUAL'], ENV['EDITOR'], 'vi' ]
      editors.unshift(GithubCLI.config['core.editor'])
      editors.compact.uniq.find { |editor| System.command? editor }
    end

    def open(name=nil)
      if editor
        command = "#{editor} #{filename}"
        success = system(command)
        GithubCLI.ui.info "Could not run '#{command}'" unless success
        exit success
      else
        GithubCLI.info("To open output, set $EDITOR or $VISUL")
        exit 1
      end
    end

  end # Editor
end # GithubCLI
