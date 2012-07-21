Feature: gcli gist

  Scenario: Available commands

    When I run `gcli gist`
    Then the exit status should be 0
      And the output should contain "gcli gist create"
      And the output should contain "gcli gist delete"
      And the output should contain "gcli gist edit"
      And the output should contain "gcli gist get"
      And the output should contain "gcli gist fork"
      And the output should contain "gcli gist list"
      And the output should contain "gcli gist star"
      And the output should contain "gcli gist starred"
      And the output should contain "gcli gist unstar"

  Scenario: List gists for user
    Given the GitHub API server:
    """
    get('/users/wycats/gists') { status 200 }
    """
    When I run `gcli gist ls -u wycats`
    Then the exit status should be 0

  Scenario: List starred gists for the authenticated user
    Given the GitHub API server:
    """
    get('/gists/starred') { status 200 }
    """
    When I run `gcli gist ls --starred`
    Then the exit status should be 0

  Scenario: List public gists for the authenticated user
    Given the GitHub API server:
    """
    get('/gists/public') { status 200 }
    """
    When I run `gcli gist ls`
    Then the exit status should be 0

  Scenario: Get gist
    Given the GitHub API server:
    """
    get('/gists/1') { status 200 }
    """
    When I run `gcli gist get 1`
    Then the exit status should be 0

  Scenario: Create gist
    Given the GitHub API server:
    """
    post('/gists') { status 200 }
    """
    When I run `gcli gist create --params=description:'desc' public:true files:'file' content:'string'`
    Then the exit status should be 0

  Scenario: Edit gist
    Given the GitHub API server:
    """
    patch('/gists/1') { status 200 }
    """
    When I run `gcli gist edit`
    Then the exit status should be 0

  Scenario: Star gist
    Given the GitHub API server:
    """
    put('/gists/1/star') { status 200 }
    """
    When I run `gcli gist star 1`
    Then the exit status should be 0

  Scenario: Unstar gist
    Given the GitHub API server:
    """
    delete('/gists/1/star') { status 200 }
    """
    When I run `gcli gist unstar 1`
    Then the exit status should be 0

  Scenario: Starred gist
    Given the GitHub API server:
    """
    get('/gists/1/star') { status 200 }
    """
    When I run `gcli gist starred 1`
    Then the exit status should be 0

  Scenario: Fork gist
    Given the GitHub API server:
    """
    post('/gists/1/fork') { status 200 }
    """
    When I run `gcli gist fork 1`
    Then the exit status should be 0

  Scenario: Delete gist
    Given the GitHub API server:
    """
    delete('/gists/1') { status 200 }
    """
    When I run `gcli gist del 1`
    Then the exit status should be 0
