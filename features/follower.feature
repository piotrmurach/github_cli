Feature: gcli follower

  Scenario: Available commands

    When I run `gcli follower`
    Then the exit status should be 0
      And the output should contain "gcli follower follow"
      And the output should contain "gcli follower follower"
      And the output should contain "gcli follower following"
      And the output should contain "gcli follower list"
      And the output should contain "gcli follower unfollow"

  Scenario: List for user
    Given the GitHub API server:
    """
    get('/users/wycats/followers') { status 200 }
    """
    When I run `gcli follower ls -u wycats`
    Then the exit status should be 0

  Scenario: List for the authenticated user
    Given the GitHub API server:
    """
    get('/user/followers') { status 200 }
    """
    When I run `gcli follower ls`
    Then the exit status should be 0

  Scenario: Follower
    Given the GitHub API server:
    """
    get('/users/following/wycats') { status 200 }
    """
    When I run `gcli follower follower wycats`
    Then the exit status should be 0

  Scenario: Following
    Given the GitHub API server:
    """
    get('/users/wycats/following') { status 200 }
    """
    When I run `gcli follower following -u wycats`
    Then the exit status should be 0

  Scenario: Follow
    Given the GitHub API server:
    """
    put('/user/following/wycats') { status 200 }
    """
    When I run `gcli follower follow wycats`
    Then the exit status should be 0

  Scenario: Unfollow
    Given the GitHub API server:
    """
    delete('/user/following/wycats') { status 200 }
    """
    When I run `gcli follower unfollow wycats`
    Then the exit status should be 0
