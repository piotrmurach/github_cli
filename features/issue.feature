Feature: gcli issue

  Scenario: Available commands
    When I run `gcli issue`
    Then the exit status should be 0
      And the output should contain "gcli issue create"
      And the output should contain "gcli issue edit"
      And the output should contain "gcli issue get"
      And the output should contain "gcli issue list"
      And the output should contain "gcli issue repo"

  Scenario: List issues
    Given the GitHub API server:
    """
    get('/issues') { status 200 }
    """
    When I run `gcli issue ls`
    Then the exit status should be 0

  Scenario: List issues for a repository
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/issues') { status 200 }
    """
    When I run `gcli issue repo wycats thor`
    Then the exit status should be 0

  Scenario: Get issue
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/issues/1') { status 200 }
    """
    When I run `gcli issue get wycats thor 1`
    Then the exit status should be 0

  Scenario: Create issue
    Given the GitHub API server:
    """
    post('/repos/wycats/thor/issues') { status 200 }
    """
    When I run `gcli issue create wycats thor --params=title:'Found a bug'`
    Then the exit status should be 0

  Scenario: Edit issue
    Given the GitHub API server:
    """
    patch('/repos/wycats/thor/issues/1') { status 200 }
    """
    When I run `gcli issue edit wycats thor 1 --params=title:'Found a bug'`
    Then the exit status should be 0

