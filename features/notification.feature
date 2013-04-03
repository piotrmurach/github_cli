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
