Feature: gcli hook

  @ci-run
  Scenario: Available commands

    When I run `gcli hook`
    Then the exit status should be 0
      And the output should contain "hook create"
      And the output should contain "hook delete"
      And the output should contain "hook edit"
      And the output should contain "hook get"
      And the output should contain "hook list"
      And the output should contain "hook test"

  Scenario: List hooks
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/hooks') { status 200 }
    """
    When I run `gcli hook ls wycats thor`
    Then the exit status should be 0

  Scenario: Get hook
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/hooks/1') { status 200 }
    """
    When I run `gcli hook get wycats thor 1`
    Then the exit status should be 0

  Scenario: Create hook
    Given the GitHub API server:
    """
    post('/repos/wycats/thor/hooks') { status 200 }
    """
    When I run `gcli hook create wycats thor --name=web --config="url:http://example.com/webhook" --events=status`
    Then the exit status should be 0

  Scenario: Edit hook
    Given the GitHub API server:
    """
    patch('/repos/wycats/thor/hooks/1') { status 200 }
    """
    When I run `gcli hook edit wycats thor 1 --params=name:web config:{}`
    Then the exit status should be 0

  Scenario: Test hook
    Given the GitHub API server:
    """
    post('/repos/wycats/thor/hooks/1/test') { status 200 }
    """
    When I run `gcli hook test wycats thor 1`
    Then the exit status should be 0

  Scenario: Delete hook
    Given the GitHub API server:
    """
    delete('/repos/wycats/thor/hooks/1') { status 200 }
    """
    When I run `gcli hook del wycats thor 1`
    Then the exit status should be 0

