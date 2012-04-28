# encoding: utf-8

module GithubCLI
  module Commands
    autoload :Blobs,        'github_cli/commands/blobs'
    autoload :Commits,      'github_cli/commands/commits'
    autoload :Forks,        'github_cli/commands/forks'
    autoload :Issues,       'github_cli/commands/issues'
    autoload :Keys,         'github_cli/commands/keys'
    autoload :Labels,       'github_cli/commands/labels'
    autoload :PullRequests, 'github_cli/commands/pull_requests'
    autoload :References,   'github_cli/commands/references'
    autoload :Repositories, 'github_cli/commands/repositories'
    autoload :Tags,         'github_cli/commands/tags'
    autoload :Trees,        'github_cli/commands/trees'
  end # Commands
end # GithubCLI
