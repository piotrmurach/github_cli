Feature: gcli key

  @ci-run
  Scenario: Available commands
    When I run `gcli key`
    Then the exit status should be 0
      And the output should contain "key create"
      And the output should contain "key delete"
      And the output should contain "key edit"
      And the output should contain "key get"
      And the output should contain "key list"

  Scenario: List keys
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/keys') { status 200 }
    """
    When I run `gcli key ls wycats thor`
    Then the exit status should be 0

  Scenario: Get key
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/keys/1') { status 200 }
    """
    When I run `gcli key get wycats thor 1`
    Then the exit status should be 0

  Scenario: Create key
    Given the GitHub API server:
    """
    post('/repos/wycats/thor/keys') { status 200 }
    """
    When I run `gcli key create wycats thor --params=title:octo key:fh34d55`
    Then the exit status should be 0

  Scenario: Edit key
    Given the GitHub API server:
    """
    patch('/repos/wycats/thor/keys/1') { status 200 }
    """
    When I run `gcli key edit wycats thor 1 --params=title:octo key:fh34d55`
    Then the exit status should be 0

  Scenario: Delete key
    Given the GitHub API server:
    """
    delete('/repos/wycats/thor/keys/1') { status 200 }
    """
    When I run `gcli key del wycats thor 1`
    Then the exit status should be 0

