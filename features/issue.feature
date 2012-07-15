Feature: ghc issue

  Scenario: Available commands
    When I run `ghc issue`
    Then the exit status should be 0
      And the output should contain "ghc issue create"
      And the output should contain "ghc issue edit"
      And the output should contain "ghc issue get"
      And the output should contain "ghc issue list"
      And the output should contain "ghc issue repo"

  Scenario: List issues
    Given the GitHub API server:
    """
    get('/issues') { status 200 }
    """
    When I run `ghc issue ls`
    Then the exit status should be 0

  Scenario: List issues for a repository
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/issues') { status 200 }
    """
    When I run `ghc issue repo wycats thor`
    Then the exit status should be 0

  Scenario: Get issue
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/issues/1') { status 200 }
    """
    When I run `ghc issue get wycats thor 1`
    Then the exit status should be 0

  Scenario: Create issue
    Given the GitHub API server:
    """
    post('/repos/wycats/thor/issues') { status 200 }
    """
    When I run `ghc issue create wycats thor --params=title:'Found a bug'`
    Then the exit status should be 0

  Scenario: Edit issue
    Given the GitHub API server:
    """
    patch('/repos/wycats/thor/issues/1') { status 200 }
    """
    When I run `ghc issue edit wycats thor 1 --params=title:'Found a bug'`
    Then the exit status should be 0

