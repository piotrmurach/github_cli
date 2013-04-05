Feature: gcli fork

  @ci-run
  Scenario: Available commands

    When I run `gcli fork`
    Then the exit status should be 0
      And the output should contain "fork create"
      And the output should contain "fork list"

  Scenario: List forks
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/forks') { status 200 }
    """
    When I run `gcli fork ls wycats thor`
    Then the exit status should be 0

  Scenario: Create fork
    Given the GitHub API server:
    """
    post('/repos/wycats/thor/forks') { status 200 }
    """
    When I run `gcli fork create wycats thor`
    Then the exit status should be 0
