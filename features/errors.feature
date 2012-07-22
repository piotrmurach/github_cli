Feature: gcli errors notification

  Scenario: Unknown formatting option
    Given the GitHub API server:
    """
    get('/users/wycats/repos') { status 200 }
    """
    When I run `gcli repo ls -u wycats --format=unknown`
    Then the exit status should be 1
    And the output should contain:
    """
    Fatal error has occurred. Unrecognized formatting options: unknown
    """
