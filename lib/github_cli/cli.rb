# encoding: utf-8

module GithubCLI

  # Main command line interface
  class CLI < Thor
    include Thor::Actions
    require 'github_cli/subcommands'

    def initialize(*args)
      super
      the_shell = (options["no-color"] ? Thor::Shell::Basic.new : shell)
      GithubCLI.ui = UI.new(the_shell)
      GithubCLI.ui.debug! if options["verbose"]
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
    class_option :quiet, :type => :boolean, :aliases => "-q",
                 :desc => "Suppress response output"
    class_option :verbose, :type => :boolean,
                 :desc => "Enable verbose output mode."
    class_option :version, :type => :boolean, :aliases => ['-V'],
                 :desc => "Show program version"

    no_commands do
      def defaults
        {
          'user.token'    => nil,
          'user.login'    => nil,
          'user.password' => nil,
          'user.name'     => nil,
          'user.repo'     => nil,
          'user.org'      => nil,
          'core.adapter'  => :net_http,
          'core.site'     => 'https://github.com',
          'core.endpoint' => 'https://api.github.com',
          'core.ssl'      => nil,
          'core.mime'     => :json,
          'core.editor'   => 'vi',
          'core.pager'    => 'less',
          'core.no-pager' => false,
          'core.no-color' => false,
          'core.quiet'    => false,
          'core.format'   => 'table',
          'core.auto_pagination' => false,
          'core.aliases'  => nil,
        }
      end
    end

    option :local, :type => :boolean, :default => false, :aliases => "-l",
           :desc => 'Modify local configuration file, otherwise a global configuration file is changed.'
    option :scopes, :type => :array, :banner => "user public_repo repo...",
      :desc => "A list of scopes that this authorization is in."
    option :note, :type => :string,
      :desc => "A note to remind you what the OAuth token is for."
    option :note_url, :type => :string,
      :desc => "A URL to remind you what the OAuth token is for."
    desc 'authorize', 'Add user authentication token'
    long_desc <<-DESC
      Create authorization token for a user named <username> Save user credentials to the .githubrc file.\n

      The username, password, and email are read in from prompts.

      You may use this command to change your details.
    DESC
    def authorize
      global_options = options.dup
      params = {}
      params['scopes']   = options[:scopes] || %w(public_repo repo)
      params['note']     = options[:note] || 'github_cli'
      params['note_url'] = options[:note_url] || 'https://github.com/peter-murach/github_cli'
      global_options[:params] = params
      # Need to configure client with login and password
      login    = TTY.shell.ask("login: ").read_string.strip!
      password = TTY.shell.ask("password: ").read_password.strip!

      global_options['login']    = login
      global_options['password'] = password
      global_options['quiet']    = options[:quiet]

      res   = self.invoke("auth:create", [], global_options)
      token = res.body['token']

      config = GithubCLI.config
      config.location = options[:local] ? 'local' : 'global'
      config['user.login']    = login
      config['user.password'] = password
      config['user.token']    = token

      GithubCLI.ui.warn <<-EOF
        \nYour #{GithubCLI.config.location} configuration file has been overwritten!
      EOF
    end

    desc 'whoami', 'Print the username config to standard out'
    def whoami
      config = GithubCLI.config
      me = config['user.login'] || "Not authed. Run 'gcli authorize'"
      GithubCLI.ui.info me
    end

    option :force, :type => :boolean, :default => false, :aliases => "-f",
           :banner => "Overwrite configuration file. "
    option :local, :type => :boolean, :default => false, :aliases => "-l",
           :desc => 'Create local configuration file, otherwise a global configuration file in user home is created.'
    desc 'init', 'Create a configuration file or overwirte existing one'
    long_desc <<-DESC
      Initializes a configuration file where you can set default options for
      interacting with GitHub API.\n

      Both global and per-command options can be specified. These defaults
      override the bult-in defaults and allow you to save typing commonly  used
      command line options.
    DESC
    def init(filename=nil)
      config_filename = filename ? filename : options[:filename]
      config = GithubCLI.config
      config.filename = config_filename
      config.location = options[:local] ? 'local' : 'global'

      if File.exists?(GithubCLI.config.path) && !options[:force]
        GithubCLI.ui.error "Not overwritting existing config file #{GithubCLI.config.path}, use --force to override."
        exit 1
      end

      config.save(defaults)
      GithubCLI.ui.confirm "Writing new configuration file to #{GithubCLI.config.path}"
    end

    option :local, :type => :boolean, :default => false,
           :desc => 'use local config file'
    option :list, :type => :boolean, :default => false, :aliases => '-l',
           :desc => 'list all'
    option :edit, :type => :boolean, :default => false, :aliases => '-e',
           :desc => 'opens an editor'
    desc 'config', 'Get and set GitHub configuration options'
    long_desc <<-DESC
      You can query/set options with this command. The name is actually a hash key
      string that is a composite one, nested with dots. If only name is provided, a
      value will be retrieved. If two parameters are given then value will be set
      or updated depending whether it already exists or not.\n

      There two types of config files, global and project specific. When modifying
      options ensure that you modifying the correct config.
    DESC
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

    desc 'list', 'List all available commands limited by pattern'
    def list(pattern="")
      pattern = /^#{pattern}.*$/i
      Terminal.print_commands pattern
    end

    desc 'version', 'Display Github CLI version.'
    def version
      GithubCLI.ui.info "#{GithubCLI.program_name} #{GithubCLI::VERSION}"
    end

  end # CLI
end # GithubCLI
