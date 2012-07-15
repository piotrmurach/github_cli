Feature: ghc search

  Scenario: Available commands

    When I run `ghc search`
    Then the exit status should be 0
      And the output should contain "ghc search email"
      And the output should contain "ghc search issue"
      And the output should contain "ghc search repo"
      And the output should contain "ghc search user"

  Scenario: Search issues
    Given the GitHub API server:
    """
    get('/legacy/issues/search/wycats/thor/open/shell') { status 200 }
    """
    When I run `ghc search issue wycats thor shell --state=open`
    Then the exit status should be 0

  Scenario: Search repositories
    Given the GitHub API server:
    """
    get('/legacy/repos/search/shell') { status 200 }
    """
    When I run `ghc search repo shell`
    Then the exit status should be 0

  Scenario: Search users
    Given the GitHub API server:
    """
    get('/legacy/user/search/wycats') { status 200 }
    """
    When I run `ghc search user wycats`
    Then the exit status should be 0

  Scenario: Search email
    Given the GitHub API server:
    """
    get('/legacy/user/search/wycats') { status 200 }
    """
    When I run `ghc search user wycats`
    Then the exit status should be 0
