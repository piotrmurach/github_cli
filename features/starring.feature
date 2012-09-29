Feature: gcli star

  Scenario: Available commands

    When I run `gcli star`
    Then the exit status should be 0
      And the output should contain "gcli star list"
      And the output should contain "gcli star star"
      And the output should contain "gcli star unstar"
      And the output should contain "gcli star starred"
      And the output should contain "gcli star starring"

  Scenario: List stargazers
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/stargazers') {
      body :login => 'octokit', :id => 1,
           :url => 'https://api.github.com/users/peter-murach'
      status 200
    }
    """
    When I successfully run `gcli star ls wycats thor`
    Then the stdout should contain "octokit"

  Scenario: Star
    Given the GitHub API server:
    """
    put('/user/starred/wycats/thor') { status 204 }
    """
    When I run `gcli star star wycats thor`
    Then the exit status should be 0

  Scenario: Unstar
    Given the GitHub API server:
    """
    delete('/user/starred/wycats/thor') { status 204 }
    """
    When I run `gcli star unstar wycats thor`
    Then the exit status should be 0
      And the stdout should contain "204"

  Scenario: Starring
    Given the GitHub API server:
    """
    get('/user/starred/wycats/thor') { status 204 }
    """
    When I run `gcli star starring wycats thor`
    Then the exit status should be 0
      And the stdout should contain "true"

  Scenario: Not Starring
    Given the GitHub API server:
    """
    get('/user/starred/wycats/thor') { status 404 }
    """
    When I run `gcli star starring wycats thor`
    Then the exit status should be 0
      And the stdout should contain "false"

  Scenario: Starred by a user
    Given the GitHub API server:
    """
    get('/users/wycats/starred') { status 200 }
    """
    When I run `gcli star starred -u wycats`
    Then the exit status should be 0
      And the stdout should contain "200"

  Scenario: Starred by the authenticated user
    Given the GitHub API server:
    """
    get('/user/starred') { status 200 }
    """
    When I run `gcli star starred`
    Then the exit status should be 0
      And the stdout should contain "200"

