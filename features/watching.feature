Feature: gcli watching

  Scenario: Available commands

    When I run `gcli watch`
    Then the exit status should be 0
      And the output should contain "gcli watch start"
      And the output should contain "gcli watch stop"
      And the output should contain "gcli watch watched"
      And the output should contain "gcli watch watchers"
      And the output should contain "gcli watch watching"

  Scenario: Watchers
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/watchers') { status 200 }
    """
    When I run `gcli watch watchers wycats thor`
    Then the exit status should be 0

  Scenario: Start watching
    Given the GitHub API server:
    """
    put('/user/watched/wycats/thor') { status 200 }
    """
    When I run `gcli watch start wycats thor`
    Then the exit status should be 0

  Scenario: Stop watching
    Given the GitHub API server:
    """
    delete('/user/watched/wycats/thor') { status 200 }
    """
    When I run `gcli watch stop wycats thor`
    Then the exit status should be 0

  Scenario: Watching
    Given the GitHub API server:
    """
    get('/user/watched/wycats/thor') { status 200 }
    """
    When I run `gcli watch watching wycats thor`
    Then the exit status should be 0

  Scenario: Watched by a user
    Given the GitHub API server:
    """
    get('/users/wycats/watched') { status 200 }
    """
    When I run `gcli watch watched -u wycats`
    Then the exit status should be 0

  Scenario: Watched by the authenticated user
    Given the GitHub API server:
    """
    get('/user/watched') { status 200 }
    """
    When I run `gcli watch watched`
    Then the exit status should be 0

