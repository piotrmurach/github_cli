Feature: gcli email

  Scenario: Available commands

    When I run `gcli email`
    Then the exit status should be 0
      And the output should contain "gcli email delete"
      And the output should contain "gcli email list"
      And the output should contain "gcli email add"

  Scenario: List emails
    Given the GitHub API server:
    """
    get('/user/emails') { status 200 }
    """
    When I run `gcli email ls`
    Then the exit status should be 0

  Scenario: Add emails
    Given the GitHub API server:
    """
    post('/user/emails') { status 200 }
    """
    When I run `gcli email add user@github.com`
    Then the exit status should be 0

  Scenario: Delete emails
    Given the GitHub API server:
    """
    delete('/user/emails') { status 200 }
    """
    When I run `gcli email del user@github.com`
    Then the exit status should be 0
