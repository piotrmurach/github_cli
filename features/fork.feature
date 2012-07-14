Feature: ghc fork

  Scenario: Available commands

    When I run `ghc fork`
    Then the exit status should be 0
      And the output should contain "ghc fork create"
      And the output should contain "ghc fork list"

  Scenario: List forks
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/forks') { status 200 }
    """
    When I run `ghc fork ls wycats thor`
    Then the exit status should be 0

  Scenario: Create fork
    Given the GitHub API server:
    """
    post('/repos/wycats/thor/forks') { status 200 }
    """
    When I run `ghc fork create wycats thor`
    Then the exit status should be 0
