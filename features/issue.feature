Feature: gcli issue

  @ci-run
  Scenario: Available commands
    When I run `gcli issue`
    Then the exit status should be 0
      And the output should contain "issue create"
      And the output should contain "issue edit"
      And the output should contain "issue get"
      And the output should contain "issue list"

  Scenario: List all issues
    Given the GitHub API server:
    """
    get('/issues') { status 200 }
    """
    When I run `gcli issue ls --all`
    Then the exit status should be 0

  Scenario: List issues for authenticated user
    Given the GitHub API server:
    """
    get('/user/issues') { status 200 }
    """
    When I run `gcli issue ls`
    Then the exit status should be 0

  Scenario: List issues for a repository
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/issues') { status 200 }
    """
    When I run `gcli issue ls --user wycats --repo thor`
    Then the exit status should be 0

  Scenario: List issues for an organization
    Given the GitHub API server:
    """
    get('/orgs/rails/issues') { status 200 }
    """
    When I run `gcli issue ls --org rails`
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
    When I run `gcli issue create wycats thor --title 'Found a bug'`
    Then the exit status should be 0

  Scenario: Edit issue
    Given the GitHub API server:
    """
    patch('/repos/wycats/thor/issues/1') { status 200 }
    """
    When I run `gcli issue edit wycats thor 1 --title 'Found a bug'`
    Then the exit status should be 0

