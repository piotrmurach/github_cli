Feature: gcli ref

  Scenario: Available commands

    When I run `gcli ref`
    Then the exit status should be 0
      And the output should contain "gcli ref create"
      And the output should contain "gcli ref delete"
      And the output should contain "gcli ref get"
      And the output should contain "gcli ref list"
      And the output should contain "gcli ref update"

  Scenario: List all references
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/git/refs') { status 200 }
    """
    When I run `gcli ref list wycats thor`
    Then the exit status should be 0

  Scenario: List branch references
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/git/refs/7d1b31e') { status 200 }
    """
    When I run `gcli ref list wycats thor --ref=7d1b31e`
    Then the exit status should be 0

  Scenario: Get reference
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/git/refs/7d1b31e') { status 200 }
    """
    When I run `gcli ref list wycats thor 7d1b31e`
    Then the exit status should be 0

  Scenario: Create reference
    Given the GitHub API server:
    """
    post('/repos/wycats/thor/git/refs') { status 200 }
    """
    When I run `gcli ref create wycats thor --params=ref:refs/heads/master sha:827efc6d5`
    Then the exit status should be 0

  Scenario: Update reference
    Given the GitHub API server:
    """
    patch('/repos/wycats/thor/git/refs/7d1b31e') { status 200 }
    """
    When I run `gcli ref update wycats thor 7d1b31e --params=force:true sha:827efc6d5`
    Then the exit status should be 0

  Scenario: Delete reference
    Given the GitHub API server:
    """
    delete('/repos/wycats/thor/git/refs/7d1b31e') { status 200 }
    """
    When I run `gcli ref delete wycats thor 7d1b31e --params=ref:refs/heads/master`
    Then the exit status should be 0

