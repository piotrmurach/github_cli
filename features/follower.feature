Feature: gcli follower

  Scenario: Available commands

    When I run `gcli follower`
    Then the exit status should be 0
      And the output should contain "gcli follower follow"
      And the output should contain "gcli follower follower"
      And the output should contain "gcli follower following"
      And the output should contain "gcli follower list"
      And the output should contain "gcli follower unfollow"

  Scenario: List for user
    Given the GitHub API server:
    """
    get('/users/wycats/followers') {
      body [ { :login => "octokit", :id => 1,
               :url => 'https://api.github.com/users/peter-murach'}]
      status 200
    }
    """
    When I successfully run `gcli follower ls -u wycats`
    Then the stdout should contain "octokit"

  Scenario: List for the authenticated user
    Given the GitHub API server:
    """
    get('/user/followers') { status 200 }
    """
    When I run `gcli follower ls`
    Then the exit status should be 0
      And the stdout should contain "200"

  Scenario: Follower
    Given the GitHub API server:
    """
    get('/users/wycats/following') { 
      body [ { :login => "octokit", :id => 1,
               :url => 'https://api.github.com/users/peter-murach'}]
      status 200
    }
    """
    When I successfully run `gcli follower following -u wycats`
    Then the stdout should contain "octokit"

  Scenario: Following
    Given the GitHub API server:
    """
    get('/user/following/wycats') { status 204 }
    """
    When I run `gcli follower follower wycats`
    Then the exit status should be 0
      And the stdout should contain "true"

  Scenario: Not Following
    Given the GitHub API server:
    """
    get('/user/following/wycats') { status 404 }
    """
    When I run `gcli follower follower wycats`
    Then the exit status should be 0
      And the stdout should contain "false"

  Scenario: Follow
    Given the GitHub API server:
    """
    put('/user/following/wycats') { status 204 }
    """
    When I successfully run `gcli follower follow wycats`
    Then the stdout should contain "204"

  Scenario: Unfollow
    Given the GitHub API server:
    """
    delete('/user/following/wycats') { status 204 }
    """
    When I successfully run `gcli follower unfollow wycats`
    Then the stdout should contain "204"
