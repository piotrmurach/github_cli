# encoding: utf-8

module GithubCLI
  # TODO: add helpers here for unifying options setting such as user etc...
  class Command < Thor

    def self.banner(task, namespace=true, subcommand=true)
      "#{basename} #{task.formatted_usage(self, true, subcommand)}"
    end

  end # Command
end # GithubCLI
