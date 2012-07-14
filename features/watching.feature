Feature: ghc watching

  Scenario: Available commands

    When I run `ghc watch`
    Then the exit status should be 0
      And the output should contain "ghc watch start"
      And the output should contain "ghc watch stop"
      And the output should contain "ghc watch watched"
      And the output should contain "ghc watch watchers"
      And the output should contain "ghc watch watching"

  Scenario: Watchers
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/watchers') { status 200 }
    """
    When I run `ghc watch watchers wycats thor`
    Then the exit status should be 0

  Scenario: Start watching
    Given the GitHub API server:
    """
    put('/user/watched/wycats/thor') { status 200 }
    """
    When I run `ghc watch start wycats thor`
    Then the exit status should be 0

  Scenario: Stop watching
    Given the GitHub API server:
    """
    delete('/user/watched/wycats/thor') { status 200 }
    """
    When I run `ghc watch stop wycats thor`
    Then the exit status should be 0

  Scenario: Watching
    Given the GitHub API server:
    """
    get('/user/watched/wycats/thor') { status 200 }
    """
    When I run `ghc watch watching wycats thor`
    Then the exit status should be 0

  Scenario: Watched by a user
    Given the GitHub API server:
    """
    get('/users/wycats/watched') { status 200 }
    """
    When I run `ghc watch watched -u wycats`
    Then the exit status should be 0

  Scenario: Watched by the authenticated user
    Given the GitHub API server:
    """
    get('/user/watched') { status 200 }
    """
    When I run `ghc watch watched`
    Then the exit status should be 0

