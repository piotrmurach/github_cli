Feature: gcli notify

  @ci-run
  Scenario: Available commands

    When I run `gcli notify`
    Then the exit status should be 0
      And the output should contain "notify list"
      And the output should contain "notify get"

  Scenario: List notifications
    Given the GitHub API server:
    """
    get('/notifications') { status 200 }
    """
    When I successfully run `gcli notify ls`
    Then the exit status should be 0

  Scenario: List repo notifications
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/notifications') { status 200 }
    """
    When I successfully run `gcli notify ls -u wycats -r thor`
    Then the exit status should be 0

  Scenario: View thread
    Given the GitHub API server:
    """
    get('/notifications/threads/1') { status 200 }
    """
    When I run `gcli notify get 1`
    Then the exit status should be 0

  Scenario: Mark thread by id
    Given the GitHub API server:
    """
    patch('/notifications/threads/1') { status 200 }
    """
    When I run `gcli notify mark --id=1`
    Then the exit status should be 0

  Scenario: Mark thread in repository
    Given the GitHub API server:
    """
    put('/repos/wycats/thor/notifications') { status 200 }
    """
    When I run `gcli notify mark --user=wycats --repo=thor`
    Then the exit status should be 0

  Scenario: Mark thread for an authenticated user
    Given the GitHub API server:
    """
    put('/notifications') { status 200 }
    """
    When I run `gcli notify mark`
    Then the exit status should be 0

  Scenario: Check thread by id
    Given the GitHub API server:
    """
    get('/notifications/threads/1/subscription') { status 200 }
    """
    When I run `gcli notify check 1`
    Then the exit status should be 0

  Scenario: Create thread
    Given the GitHub API server:
    """
    put('/notifications/threads/1/subscription') { status 200 }
    """
    When I run `gcli notify create 1`
    Then the exit status should be 0

  Scenario: Delete thread
    Given the GitHub API server:
    """
    delete('/notifications/threads/1/subscription') { status 200 }
    """
    When I run `gcli notify delete 1`
    Then the exit status should be 0
