Feature: gh repository

  Scenario: Available commands
    When I run `ghc repo`
    Then the exit status should be 0
      And the output should contain "ghc repo branches"
      And the output should contain "ghc repo contribs"
      And the output should contain "ghc repo create"
      And the output should contain "ghc repo edit"
      And the output should contain "ghc repo get"
      And the output should contain "ghc repo list"
      And the output should contain "ghc repo languages"
      And the output should contain "ghc repo tags"
      And the output should contain "ghc repo teams"

  Scenario: List repositories
    Given the GitHub API server:
    """
    get('/users/wycats/repos') { status 200 }
    """
    When I run `ghc repo ls -u wycats`
    Then the exit status should be 0

  Scenario: Get repository
    Given the GitHub API server:
    """
    get('/repos/wycats/thor') { status 200 }
    """
    When I run `ghc repo get wycats thor`
    Then the exit status should be 0

  Scenario: List repository contributors
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/contributors') {
      status 200
    }
    """
    When I run `ghc repo contribs wycats thor`
    Then the exit status should be 0

  Scenario: List repository branches
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/branches') {
      status 200
    }
    """
    When I run `ghc repo branches wycats thor`
    Then the exit status should be 0

  Scenario: List repository languages
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/languages') {
      status 200
    }
    """
    When I run `ghc repo languages wycats thor`
    Then the exit status should be 0

  Scenario: List repository teams
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/teams') {
      status 200
    }
    """
    When I run `ghc repo teams wycats thor`
    Then the exit status should be 0

  Scenario: List repository tags
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/tags') {
      status 200
    }
    """
    When I run `ghc repo tags wycats thor`
    Then the exit status should be 0

  Scenario: Create repository
    Given the GitHub API server:
    """
    post('/user/repos') { status 200 }
    """
    When I run `ghc repo create github`
    Then the exit status should be 0

  Scenario: Edit repository
    Given the GitHub API server:
    """
    patch('/repos/wycats/thor') { status 200 }
    """
    When I run `ghc repo edit wycats thor --params=name:thor`
    Then the exit status should be 0

