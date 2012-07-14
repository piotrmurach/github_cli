Feature: ghc email

  Scenario: Available commands

    When I run `ghc email`
    Then the exit status should be 0
      And the output should contain "ghc email delete"
      And the output should contain "ghc email list"
      And the output should contain "ghc email add"

  Scenario: List emails
    Given the GitHub API server:
    """
    get('/user/emails') { status 200 }
    """
    When I run `ghc email ls`
    Then the exit status should be 0

  Scenario: Add emails
    Given the GitHub API server:
    """
    post('/user/emails') { status 200 }
    """
    When I run `ghc email add user@github.com`
    Then the exit status should be 0

  Scenario: Delete emails
    Given the GitHub API server:
    """
    delete('/user/emails') { status 200 }
    """
    When I run `ghc email del user@github.com`
    Then the exit status should be 0
