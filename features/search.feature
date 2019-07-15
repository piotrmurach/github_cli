Feature: gcli search

  @ci-run
  Scenario: Available commands
    When I run `gcli search`
    Then the exit status should be 0
      And the output should contain "search issue"
      And the output should contain "search code"
      And the output should contain "search repo"
      And the output should contain "search user"

  Scenario: Search issues
    Given the GitHub API server:
    """
    get('/search/issues') { status 200 }
    """
    When I run `gcli search issue tty`
    Then the exit status should be 0

  Scenario: Search repositories
    Given the GitHub API server:
    """
    get('/search/repositories') { status 200 }
    """
    When I run `gcli search repo tty`
    Then the exit status should be 0

  Scenario: Search users
    Given the GitHub API server:
    """
    get('/search/users') { status 200 }
    """
    When I run `gcli search user piotrmurach`
    Then the exit status should be 0

  Scenario: Search code
    Given the GitHub API server:
    """
    get('/search/code') { status 200 }
    """
    When I run `gcli search code tty`
    Then the exit status should be 0
