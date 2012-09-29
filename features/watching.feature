Feature: gcli watching

  Scenario: Available commands

    When I run `gcli watch`
    Then the exit status should be 0
      And the output should contain "gcli watch list"
      And the output should contain "gcli watch start"
      And the output should contain "gcli watch stop"
      And the output should contain "gcli watch watched"
      And the output should contain "gcli watch watching"

  Scenario: List watchers
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/subscribers') {
      body :login => 'octokit', :id => 1,
           :url => 'https://api.github.com/users/peter-murach'
      status 200
    }
    """
    When I successfully run `gcli watch ls wycats thor`
    Then the stdout should contain "octokit"

  Scenario: Start watching
    Given the GitHub API server:
    """
    put('/user/subscriptions/wycats/thor') { status 204 }
    """
    When I run `gcli watch start wycats thor`
    Then the exit status should be 0
      And the stdout should contain "204"

  Scenario: Stop watching
    Given the GitHub API server:
    """
    delete('/user/subscriptions/wycats/thor') { status 204 }
    """
    When I run `gcli watch stop wycats thor`
    Then the exit status should be 0
      And the stdout should contain "204"

  Scenario: Watching
    Given the GitHub API server:
    """
    get('/user/subscriptions/wycats/thor') { status 204 }
    """
    When I run `gcli watch watching wycats thor`
    Then the exit status should be 0
      And the stdout should contain "true"

  Scenario: Not Watching
    Given the GitHub API server:
    """
    get('/user/subscriptions/wycats/thor') { status 404 }
    """
    When I run `gcli watch watching wycats thor`
    Then the exit status should be 0
      And the stdout should contain "false"

  Scenario: Watched by a user
    Given the GitHub API server:
    """
    get('/users/wycats/subscriptions') { status 200 }
    """
    When I run `gcli watch watched -u wycats`
    Then the exit status should be 0
      And the stdout should contain "200"

  Scenario: Watched by the authenticated user
    Given the GitHub API server:
    """
    get('/user/subscriptions') { status 200 }
    """
    When I run `gcli watch watched`
    Then the exit status should be 0
      And the stdout should contain "200"

