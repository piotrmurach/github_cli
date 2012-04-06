# encoding: utf-8

module GithubCLI
  module Commands
    autoload :Blobs,        'github_cli/commands/blobs'
    autoload :Issues,       'github_cli/commands/issues'
    autoload :Labels,       'github_cli/commands/labels'
    autoload :Repositories, 'github_cli/commands/repositories'
    autoload :Tags,         'github_cli/commands/tags'
    autoload :Trees,        'github_cli/commands/trees'
  end # Commands
end # GithubCLI
