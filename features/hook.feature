Feature: ghc hook

  Scenario: Available commands

    When I run `ghc hook`
    Then the exit status should be 0
      And the output should contain "ghc hook create"
      And the output should contain "ghc hook delete"
      And the output should contain "ghc hook edit"
      And the output should contain "ghc hook get"
      And the output should contain "ghc hook list"
      And the output should contain "ghc hook test"

  Scenario: List hooks
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/hooks') { status 200 }
    """
    When I run `ghc hook ls wycats thor`
    Then the exit status should be 0

  Scenario: Get hook
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/hooks/1') { status 200 }
    """
    When I run `ghc hook get wycats thor 1`
    Then the exit status should be 0

  Scenario: Create hook
    Given the GitHub API server:
    """
    post('/repos/wycats/thor/hooks') { status 200 }
    """
    When I run `ghc hook create wycats thor --params=name:web config:{}`
    Then the exit status should be 0

  Scenario: Edit hook
    Given the GitHub API server:
    """
    patch('/repos/wycats/thor/hooks/1') { status 200 }
    """
    When I run `ghc hook edit wycats thor 1 --params=name:web config:{}`
    Then the exit status should be 0

  Scenario: Test hook
    Given the GitHub API server:
    """
    post('/repos/wycats/thor/hooks/1/test') { status 200 }
    """
    When I run `ghc hook test wycats thor 1`
    Then the exit status should be 0

  Scenario: Delete hook
    Given the GitHub API server:
    """
    delete('/repos/wycats/thor/hooks/1') { status 200 }
    """
    When I run `ghc hook del wycats thor 1`
    Then the exit status should be 0

