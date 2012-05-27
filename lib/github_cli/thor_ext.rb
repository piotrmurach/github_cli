require 'thor'

class Thor
  include Thor::Base

  class << self
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
