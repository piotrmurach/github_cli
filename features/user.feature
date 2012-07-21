Feature: gcli user

  Scenario: Available commands

    When I run `gcli user`
    Then the exit status should be 0
      And the output should contain "gcli user get"
      And the output should contain "gcli user update"

  Scenario: Get user
    Given the GitHub API server:
    """
    get('/users/wycats') { status 200 }
    """
    When I run `gcli user get -u wycats`
    Then the exit status should be 0

  Scenario: Get the authenticated user
    Given the GitHub API server:
    """
    get('/user') { status 200 }
    """
    When I run `gcli user get`
    Then the exit status should be 0

  Scenario: Update the authenticated user
    Given the GitHub API server:
    """
    patch('/user') { status 200 }
    """
    When I run `gcli user update --params=name:peter-murach`
    Then the exit status should be 0
