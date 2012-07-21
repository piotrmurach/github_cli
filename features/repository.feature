Feature: gcli repository

  Scenario: Available commands
    When I run `gcli repo`
    Then the exit status should be 0
      And the output should contain "gcli repo branches"
      And the output should contain "gcli repo contribs"
      And the output should contain "gcli repo create"
      And the output should contain "gcli repo edit"
      And the output should contain "gcli repo get"
      And the output should contain "gcli repo list"
      And the output should contain "gcli repo languages"
      And the output should contain "gcli repo tags"
      And the output should contain "gcli repo teams"

  Scenario: List repositories
    Given the GitHub API server:
    """
    get('/users/wycats/repos') { status 200 }
    """
    When I run `gcli repo ls -u wycats`
    Then the exit status should be 0

  Scenario: Get repository
    Given the GitHub API server:
    """
    get('/repos/wycats/thor') { status 200 }
    """
    When I run `gcli repo get wycats thor`
    Then the exit status should be 0

  Scenario: List repository contributors
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/contributors') {
      status 200
    }
    """
    When I run `gcli repo contribs wycats thor`
    Then the exit status should be 0

  Scenario: List repository branches
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/branches') {
      status 200
    }
    """
    When I run `gcli repo branches wycats thor`
    Then the exit status should be 0

  Scenario: List repository languages
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/languages') {
      status 200
    }
    """
    When I run `gcli repo languages wycats thor`
    Then the exit status should be 0

  Scenario: List repository teams
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/teams') {
      status 200
    }
    """
    When I run `gcli repo teams wycats thor`
    Then the exit status should be 0

  Scenario: List repository tags
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/tags') {
      status 200
    }
    """
    When I run `gcli repo tags wycats thor`
    Then the exit status should be 0

  Scenario: Create repository
    Given the GitHub API server:
    """
    post('/user/repos') { status 200 }
    """
    When I run `gcli repo create github`
    Then the exit status should be 0

  Scenario: Edit repository
    Given the GitHub API server:
    """
    patch('/repos/wycats/thor') { status 200 }
    """
    When I run `gcli repo edit wycats thor --params=name:thor`
    Then the exit status should be 0

