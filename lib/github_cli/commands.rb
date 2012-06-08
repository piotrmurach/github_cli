# encoding: utf-8

module GithubCLI
  module Commands
    autoload :Authorizations, 'github_cli/commands/authorizations'
    autoload :Blobs,          'github_cli/commands/blobs'
    autoload :Collaborators,  'github_cli/commands/collaborators'
    autoload :Commits,        'github_cli/commands/commits'
    autoload :Downloads,      'github_cli/commands/downloads'
    autoload :Emails,         'github_cli/commands/emails'
    autoload :Events,         'github_cli/commands/events'
    autoload :Followers,      'github_cli/commands/followers'
    autoload :Forks,          'github_cli/commands/forks'
    autoload :Gists,          'github_cli/commands/gists'
    autoload :Hooks,          'github_cli/commands/hooks'
    autoload :Issues,         'github_cli/commands/issues'
    autoload :Keys,           'github_cli/commands/keys'
    autoload :Labels,         'github_cli/commands/labels'
    autoload :Members,        'github_cli/commands/members'
    autoload :Milestones,     'github_cli/commands/milestones'
    autoload :Organizations,  'github_cli/commands/organizations'
    autoload :PullRequests,   'github_cli/commands/pull_requests'
    autoload :References,     'github_cli/commands/references'
    autoload :Repositories,   'github_cli/commands/repositories'
    autoload :Tags,           'github_cli/commands/tags'
    autoload :Trees,          'github_cli/commands/trees'
    autoload :Users,          'github_cli/commands/users'
    autoload :Watching,       'github_cli/commands/watching'
  end # Commands
end # GithubCLI
