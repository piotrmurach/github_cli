# encoding: utf-8

module GithubCLI
  class CLI < Thor
    include Thor::Actions
    require 'github_cli/subcommands'

    def initialize(*args)
      super
      the_shell = (options["no-color"] ? Thor::Shell::Basic.new : shell)
      GithubCLI.ui = UI.new(the_shell)
      GithubCLi.ui.debug! if options["verbose"]
      options["no-pager"] ? Pager.disable : Pager.enable
    end

    ALIASES = {
      'repository' => 'repo',
      'reference'  => 'ref',
      'is'         => :issue,
      '--version'  => 'version',
      '-V'         => 'version',
      'ls'         => 'list'
    }

    map ALIASES

    class_option :filename, :type => :string,
                 :desc => "Configuration file name.", :banner => "<filename>",
                 :default => ".githubrc"
    class_option :token, :type => :string,
                 :desc => 'Authentication token.',
                 :banner => '<oauth token>'
    class_option :login, :type => :string
    class_option :password, :type => :string
    class_option "no-color", :type => :boolean,
                 :desc => "Disable colorization in output."
    class_option "no-pager", :type => :boolean,
                 :desc => "Disable pagination of the output."
    class_option :pager, :type => :string, :aliases => '-p',
                 :desc => "Command to be used for paging.",
                 :banner => "less|more|..."
    class_option :verbose, :type => :boolean,
                 :desc => "Enable verbose output mode."
    class_option :version, :type => :boolean, :aliases => ['-V'],
                 :desc => "Show program version"

    no_tasks do
      def defaults
        {
          'user.token'    => nil,
          'user.login'    => nil,
          'user.password' => nil,
          'user.name'     => nil,
          'user.repo'     => nil,
          'user.org'      => nil,
          'core.adapter'  => :net_http,
          'core.endpoint' => 'https://api.github.com',
          'core.ssl'      => nil,
          'core.mime'     => :json,
          'core.editor'   => 'vi',
          'core.pager'    => 'less',
          'core.no-pager' => false,
          'core.no-color' => false,
          'core.format'   => 'table',
          'core.auto_pagination' => false,
          'core.aliases'  => nil,
        }
      end
    end

    desc 'init [<filename>]', 'Create a configuration file or overwirte existing one'
    long_desc <<-DESC
      Initializes a configuration file where you can set default options for
      interacting with GitHub API.\n

      Both global and per-command options can be specified. These defaults
      override the bult-in defaults and allow you to save typing commonly  used
      command line options.
    DESC
    method_option :force, :type => :boolean, :default => false, :aliases => "-f",
                  :banner => "Overwrite configuration file. "
    method_option :local, :type => :boolean, :default => false,
                  :desc => 'Create local configuration file, otherwise a global configuration file in user home is created.'
    def init(filename=nil)
      config_filename = filename ? filename : options[:filename]
      GithubCLI.config.filename = config_filename
      GithubCLI.config.location = options[:local] ? 'local' : 'global'

      if File.exists?(GithubCLI.config.path) && !options[:force]
        GithubCLI.ui.error "Not overwritting existing config file #{GithubCLI.config.path}, use --force to override."
        exit 1
      end

      GithubCLI.config.save(defaults)
      GithubCLI.ui.confirm "Writing new configuration file to #{GithubCLI.config.path}"
    end

    desc 'config <name> [<value>]', 'Get and set GitHub configuration options'
    long_desc <<-DESC
      You can query/set options with this command. The name is actually a hash key
      string that is a composite one, nested with dots. If only name is provided, a
      value will be retrieved. If two parameters are given then value will be set
      or updated depending whether it already exists or not.\n

      There two types of config files, global and project specific. When modifying
      options ensure that you modifying the correct config.
    DESC
    method_option :local, :type => :boolean, :default => false,
                  :desc => 'use local config file'
    method_option :list, :type => :boolean, :default => false, :aliases => '-l',
                  :desc => 'list all'
    method_option :edit, :type => :boolean, :default => false, :aliases => '-e',
                  :desc => 'opens an editor'
    def config(*args)
      name, value = args.shift, args.shift
      GithubCLI.config.location = options[:local] ? 'local' : 'global'

      if !File.exists?(GithubCLI.config.path)
        GithubCLI.ui.error "Configuration file does not exist. Please use `#{GithubCLI.executable_name} init` to create one."
        exit 1
      end

      if options[:list]
        Terminal.print_config(name) && return
      elsif options[:edit]
        editor = Editor.new GithubCLI.config.path
        editor.open && return
      end

      if !name
        Terminal.print_config && return
      end

      if !value
        Terminal.line GithubCLI.config[name]
      else
        Terminal.line GithubCLI.config[name] = value
      end

      return
    end

    desc 'list <pattern>', 'List all available commands limited by pattern'
    def list(pattern="")
      pattern = /^#{pattern}.*$/i
      Terminal.print_commands pattern
    end

    desc 'version', 'Display Github CLI version.'
    def version
      GithubCLI.ui.info "#{GithubCLI.program_name} v#{GithubCLI::VERSION}"
    end

  end # CLI
end # GithubCLI
