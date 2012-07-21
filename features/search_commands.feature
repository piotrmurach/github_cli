@search
Feature: Github API Commands Search

  As a developer who wants to search for commands that leverage GitHub APIs
  When I use interface provided by GHC
  I have ability to list commands by search criteria

  Scenario: Listing
    When I run `gcli list`
    Then the exit status should be 0
    And the output should contain:
    """
    GitHub API v3 CLI client

    Commands:
    """

  Scenario Outline: Pattern Matching
    When I run `gcli list <pattern>`
    Then the output should contain "repo"
    And the output should not contain "issue"

    Examples:
      | pattern |
      | re      |
      | repo    |

  Scenario: No Match
    When I run `gcli list bla`
    Then the output should contain:
    """
    gcli: 'bla' is not a gcli command. See 'gcli --help'.
    """
