require 'thor'

class Thor
  include Thor::Base

  class << self

    def help(shell, subcommand = false)
      list = printable_tasks(true, subcommand)
      Thor::Util.thor_classes_in(self).each do |klass|
        list += klass.printable_tasks(false)
      end
      list.sort!{ |a,b| a[0] <=> b[0] }

      shell.say "Commands:"
      shell.print_table(list, :indent => 2, :truncate => true)
      shell.say
      class_options_help(shell)
    end

    def subcommand_help(cmd)
      desc "help <command>", "Describe subcommands or one specific subcommand"
      class_eval <<-RUBY
        def help(task = nil, subcommand = true); super; end
      RUBY
    end
  end

  desc "help <command>", "Describe available commands or one specific command"
  def help(task = nil, subcommand = false)
    task ? self.class.task_help(shell, task) : self.class.help(shell, subcommand)
  end
end # Thor
