@executable
Feature: The GHC Executable

  As a developer who wants to interact with GitHub API v3
  When I use interface provided by GHC
  I have access to command line interface

  Scenario Outline: Getting Help for Commands
    When I run `ghc <command>`
    Then the exit status should be 0
    And the output should contain:
    """
    Github CLI client

    Tasks:
      ghc help [TASK]
    """
    Examples:
      | command |
      |         |
      | help    |

  Scenario Outline: Getting Subcommands
    When I run `ghc <command>`
    Then the exit status should be 0
    And the output should contain "ghc <command>"

    Examples:
      | command |
      | repo    |
      | issue   |
