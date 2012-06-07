# encoding: utf-8

module GithubCLI
  # This class provides pagining of terminal output.
  class Pager
    class << self

      def pager_command(*cmds)
        @pager_command = (!@pager_command.nil? && cmds.empty?) || begin
          commands = [
            ENV['GIT_PAGER'], `git config --get-all core.pager`.split.first,
            ENV['PAGER'], 'less', 'more', 'cat', 'pager'
          ]
          commands = cmds.empty? ? commands : cmds
          commands.compact.uniq.find { |cmd| System.command? cmd }
        end
      end

    end

    def initialize(options={})
      @pager_command = options[:pager_command] if options[:pager_command]
    end

    # Pages output using configured pager.
    def page
      return if not $stdout.tty? or System.windows?

      read_io, write_io = IO.pipe

      if Kernel.fork
        $stdin.reopen(read_io)
        read_io.close
        write_io.close

        # Don't page if the input is short enough
        ENV['LESS'] = 'FSRX'

        # Wait until we have input before we start the pager
        Kernel.select [$stdin]

        pager = Pager.pager_command

        Kernel.exec pager rescue Kernel.exec "/bin/sh", "-c", pager
      else
        # Child process
        $stdout.reopen(write_io)
        $stderr.reopen(write_io) if $stderr.tty?
        write_io.close
        read_io.close
      end
    end
  end # System
end # GithubCLI
