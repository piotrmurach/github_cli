Feature: gcli repository

  @ci-run
  Scenario: Available commands
    When I run `gcli repo`
    Then the exit status should be 0
      And the output should contain "repo branch"
      And the output should contain "repo branches"
      And the output should contain "repo contribs"
      And the output should contain "repo create"
      And the output should contain "repo edit"
      And the output should contain "repo delete"
      And the output should contain "repo get"
      And the output should contain "repo list"
      And the output should contain "repo langs"
      And the output should contain "repo tags"
      And the output should contain "repo teams"

  Scenario: List all repositories
    Given the GitHub API server:
    """
    get('/repositories') { status 200 }
    """
    When I run `gcli repo ls --every`
    Then the exit status should be 0

  Scenario: List all repositories for the authenticated user
    Given the GitHub API server:
    """
    get('/user/repos') { status 200 }
    """
    When I run `gcli repo ls --login=piotr --password=secret`
    Then the exit status should be 0

  Scenario: List repositories for user
    Given the GitHub API server:
    """
    get('/users/wycats/repos') { status 200 }
    """
    When I run `gcli repo ls -u wycats`
    Then the exit status should be 0

  Scenario: List repositories for organization
    Given the GitHub API server:
    """
    get('/orgs/github/repos') { status 200 }
    """
    When I run `gcli repo ls -o github`
    Then the exit status should be 0

  Scenario: List repositories for organization
    Given the GitHub API server:
    """
    get('/orgs/github/repos') { status 200 }
    """
    When I run `gcli repo ls -o github`
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

  Scenario: Create repository in organization
    Given the GitHub API server:
    """
    post('/orgs/github/repos') { status 200 }
    """
    When I run `gcli repo create github/thor`
    Then the exit status should be 0

  Scenario: Edit repository
    Given the GitHub API server:
    """
    patch('/repos/wycats/thor') { status 200 }
    """
    When I run `gcli repo edit wycats thor new`
    Then the exit status should be 0

  Scenario: Delete repository
    Given the GitHub API server:
    """
    delete('/repos/wycats/thor') { status 200 }
    """
    When I run `gcli repo del wycats thor`
    Then the exit status should be 0

  Scenario: Get repository branch
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/branches/master') {
      status 200
    }
    """
    When I run `gcli repo branch wycats thor master`
    Then the exit status should be 0

