# encoding: utf-8

module GithubCLI
  class CLI

    desc "assignee", "Leverage Assignees API"
    subcommand "assignee", GithubCLI::Commands::Assignees

    desc "auth", "Leverage Authorizations API"
    subcommand "auth", GithubCLI::Commands::Authorizations

    desc "blob", "Leverage Blobs API"
    subcommand "blob", GithubCLI::Commands::Blobs

    desc "collab", "Leverage Collaborators API"
    subcommand "collab", GithubCLI::Commands::Collaborators

    desc "commit", "Leverage Commits API"
    subcommand "commit", GithubCLI::Commands::Commits

    desc "content", "Leverage Contents API"
    subcommand "content", GithubCLI::Commands::Contents

    desc "download", "Leverage Downloads API"
    subcommand "download", GithubCLI::Commands::Downloads

    desc "email", "Leverage Emails API"
    subcommand "email", GithubCLI::Commands::Emails

    desc "event", "Leverage Events API"
    subcommand "event", GithubCLI::Commands::Events

    desc "follower", "Leverage Followers API"
    subcommand "follower", GithubCLI::Commands::Followers

    desc "fork", "Leverage Forks API"
    subcommand "fork", GithubCLI::Commands::Forks

    desc "gist", "Leverage Gists API"
    subcommand "gist", GithubCLI::Commands::Gists

    desc "hook", "Leverage Hooks API"
    subcommand "hook", GithubCLI::Commands::Hooks

    desc "issue", "Leverage Issues API"
    subcommand "issue", GithubCLI::Commands::Issues

    desc "key", "Leverage Keys API"
    subcommand "key", GithubCLI::Commands::Keys

    desc "label", "Leverage Labels API"
    subcommand "label", GithubCLI::Commands::Labels

    desc "member", "Leverage Members API"
    subcommand "member", GithubCLI::Commands::Members

    desc "merge", "Leverage Merging API"
    subcommand "merge", GithubCLI::Commands::Merging

    desc "milestone", "Leverage Milestones API"
    subcommand "milestone", GithubCLI::Commands::Milestones

    desc "org", "Leverage Organizations API"
    subcommand "org", GithubCLI::Commands::Organizations

    desc "pull", "Leverage Pull Requests API"
    subcommand "pull", GithubCLI::Commands::PullRequests

    desc "ref", "Leverage References API"
    subcommand "ref", GithubCLI::Commands::References

    desc "repo", "Leverage Repositories API"
    subcommand "repo", GithubCLI::Commands::Repositories

    desc "search", "Leverage Search API"
    subcommand "search", GithubCLI::Commands::Search

    desc "star", "Leverage Starring API"
    subcommand "star", GithubCLI::Commands::Starring

    desc "status", "Leverage Statuses API"
    subcommand "status", GithubCLI::Commands::Statuses

    desc "tag", "Leverage Tags API"
    subcommand "tag", GithubCLI::Commands::Tags

    desc "team", "Leverage Teams API"
    subcommand "team", GithubCLI::Commands::Teams

    desc "tree", "Leverage Trees API"
    subcommand "tree", GithubCLI::Commands::Trees

    desc "user", "Leverage Users API"
    subcommand "user", GithubCLI::Commands::Users

    desc "watch", "Leverage Watching API"
    subcommand "watch", GithubCLI::Commands::Watching

  end # CLI
end # GithubCLI
