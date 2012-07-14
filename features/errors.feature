Feature: ghc errors notification

  @wip
  Scenario: Unknown formatting option

    When I run `ghc repo list -u wycats --format=unknown`
    Then the exit status should be 1
    And the output should contain:
    """
    Fatal error has occurred. Unrecognized formatting options: unknown
    """
