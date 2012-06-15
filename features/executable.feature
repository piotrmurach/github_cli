@executable
Feature: The GHC Executable

  As a developer who wants to interact with GitHub API v3
  When I use interface provided by GHC
  I have access to command line interface

  Scenario Outline: Getting Help for Commands

    When I run `ghc <cmd>`
    Then the exit status should be 0
    And the output should contain:
    """
      ghc help <command>
    """
    Examples:
      | cmd  |
      |      |
      | help |

  Scenario: Getting Usage for Commands

    When I run `ghc`
    Then the exit status should be 0
    And the output should contain "Usage: ghc"
      And the output should contain "[--config]"
      And the output should contain "[--no-color]"
      And the output should contain "[--no-pager]"
      And the output should contain "[--version]"
      And the output should contain "[--verbose]"

  Scenario Outline: Getting Subcommands

    When I run `ghc <command>`
    Then the exit status should be 0
    And the output should contain "ghc <command>"

    Examples:
      | command   |
      | auth      |
      | blob      |
      | commit    |
      | download  |
      | email     |
      | event     |
      | follower  |
      | fork      |
      | gist      |
      | hook      |
      | issue     |
      | key       |
      | label     |
      | member    |
      | milestone |
      | org       |
      | pull      |
      | ref       |
      | repo      |
      | tag       |
      | team      |
      | tree      |
      | user      |
      | watch     |

