Feature: gcli tree

  Scenario: Available commands

    When I run `gcli tree`
    Then the exit status should be 0
      And the output should contain "gcli tree create"
      And the output should contain "gcli tree get"

  Scenario: Get tree
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/git/trees/827efc6d5') { status 200 }
    """
    When I run `gcli tree get wycats thor 827efc6d5`
    Then the exit status should be 0
