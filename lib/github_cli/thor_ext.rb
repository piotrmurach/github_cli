# encoding: utf-8

class Thor
  include Thor::Base

  class << self

    def help(shell, subcommand = false)
      list = printable_commands(true, subcommand)
      Thor::Util.thor_classes_in(self).each do |klass|
        list += klass.printable_commands(false)
      end
      list.sort!{ |a,b| a[0] <=> b[0] }

      GithubCLI::Terminal.print_usage global_flags, list[0][0]

      shell.say "Commands:"
      shell.print_table(list, :indent => 3, :truncate => true)
      shell.say
      class_options_help(shell)
    end

    # Returns commands ready to be printed.
    def printable_commands(all = true, subcommand = false)
      (all ? all_commands : commands).map do |_, command|
        next if command.hidden?
        item = []
        item << banner(command, false, subcommand).gsub(/#{basename} /, '')
        item << (command.description ? "# #{command.description.gsub(/\s+/m,' ')}" : "")
        item
      end.compact
    end
    alias printable_tasks printable_commands


    # String representation of all available global flags
    def global_flags
      return if class_options.empty?

      all_options = ''
      class_options.each do |key, val|
        all_options << '[' + val.switch_name
        all_options <<  (!val.aliases.empty? ? ('|' + val.aliases.join('|')) : '')
        all_options <<  '] '
      end
      all_options
    end

    def subcommand_help(cmd)
      desc "help <command>", "Describe subcommands or one specific subcommand"
      class_eval <<-RUBY
        def help(task = nil, subcommand = true); super; end
      RUBY
    end

    def handle_no_task_error(cmd, has_namespace = $thor_runner) #:nodoc:
      possibilities = "#{GithubCLI::Command::Completion.new(cmd).format_command_possibilities}"
      if has_namespace
        raise UndefinedTaskError, "Could not find task #{cmd.inspect} in #{namespace.inspect} namespace. " + possibilities
      else
        raise UndefinedTaskError, "Could not find command #{cmd.inspect}. " + possibilities
      end
    end
  end

  MANPAGES = %w[
    gcli-config.1
  ]

  desc "help <command>", "Describe available commands or one specific command"
  def help(task = nil, subcommand = false)
    command = "gcli-#{task}.1"

    GithubCLI::Manpage.has?(command) do |manpage|
      manpage.show(command) && return
    end

    task ? self.class.task_help(shell, task) : self.class.help(shell, subcommand)
  end
end # Thor
