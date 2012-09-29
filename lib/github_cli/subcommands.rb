# encoding: utf-8

module GithubCLI
  class CLI

    desc "assignee <command>", "Leverage Assignees API"
    subcommand "assignee", GithubCLI::Commands::Assignees

    desc "auth <command>", "Leverage Authorizations API"
    subcommand "auth", GithubCLI::Commands::Authorizations

    desc "blob <command>", "Leverage Blobs API"
    subcommand "blob", GithubCLI::Commands::Blobs

    desc "collab <command>", "Leverage Collaborators API"
    subcommand "collab", GithubCLI::Commands::Collaborators

    desc "commit <command>", "Leverage Commits API"
    subcommand "commit", GithubCLI::Commands::Commits

    desc "content <command>", "Leverage Contents API"
    subcommand "content", GithubCLI::Commands::Contents

    desc "download <command>", "Leverage Downloads API"
    subcommand "download", GithubCLI::Commands::Downloads

    desc "email <command>", "Leverage Emails API"
    subcommand "email", GithubCLI::Commands::Emails

    desc "event <command>", "Leverage Events API"
    subcommand "event", GithubCLI::Commands::Events

    desc "follower <command>", "Leverage Followers API"
    subcommand "follower", GithubCLI::Commands::Followers

    desc "fork <command>", "Leverage Forks API"
    subcommand "fork", GithubCLI::Commands::Forks

    desc "gist <command>", "Leverage Gists API"
    subcommand "gist", GithubCLI::Commands::Gists

    desc "hook <command>", "Leverage Hooks API"
    subcommand "hook", GithubCLI::Commands::Hooks

    desc "issue <command>", "Leverage Issues API"
    subcommand "issue", GithubCLI::Commands::Issues

    desc "key <command>", "Leverage Keys API"
    subcommand "key", GithubCLI::Commands::Keys

    desc "label <command>", "Leverage Labels API"
    subcommand "label", GithubCLI::Commands::Labels

    desc "member <command>", "Leverage Members API"
    subcommand "member", GithubCLI::Commands::Members

    desc "milestone <command>", "Leverage Milestones API"
    subcommand "milestone", GithubCLI::Commands::Milestones

    desc "org <command>", "Leverage Organizations API"
    subcommand "org", GithubCLI::Commands::Organizations

    desc "pull <command>", "Leverage Pull Requests API"
    subcommand "pull", GithubCLI::Commands::PullRequests

    desc "ref <command>", "Leverage References API"
    subcommand "ref", GithubCLI::Commands::References

    desc "repo <command>", "Leverage Repositories API"
    subcommand "repo", GithubCLI::Commands::Repositories

    desc "search <command>", "Leverage Search API"
    subcommand "search", GithubCLI::Commands::Search

    desc "star <command>", "Leverage Starring API"
    subcommand "star", GithubCLI::Commands::Starring

    desc "status <command>", "Leverage Statuses API"
    subcommand "status", GithubCLI::Commands::Statuses

    desc "tag <command>", "Leverage Tags API"
    subcommand "tag", GithubCLI::Commands::Tags

    desc "team <command>", "Leverage Teams API"
    subcommand "team", GithubCLI::Commands::Teams

    desc "tree <command>", "Leverage Trees API"
    subcommand "tree", GithubCLI::Commands::Trees

    desc "user <command>", "Leverage Users API"
    subcommand "user", GithubCLI::Commands::Users

    desc "watch <command>", "Leverage Watching API"
    subcommand "watch", GithubCLI::Commands::Watching

  end # CLI
end # GithubCLI
