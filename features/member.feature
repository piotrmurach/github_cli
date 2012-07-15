Feature: ghc member

  Scenario: Available commands

    When I run `ghc member`
    Then the exit status should be 0
      And the output should contain "ghc member delete"
      And the output should contain "ghc member list"
      And the output should contain "ghc member member"
      And the output should contain "ghc member publicize"

  Scenario: List members
    Given the GitHub API server:
    """
    get('/orgs/rails/members') { status 200 }
    """
    When I run `ghc member ls rails`
    Then the exit status should be 0

  Scenario: List public members
    Given the GitHub API server:
    """
    get('/orgs/rails/public_members') { status 200 }
    """
    When I run `ghc member ls --public rails`
    Then the exit status should be 0

  Scenario: Check if user is a member of an organization
    Given the GitHub API server:
    """
    get('/orgs/rails/members/wycats') { status 200 }
    """
    When I run `ghc member member rails wycats`
    Then the exit status should be 0

  Scenario: Check if user is a public member of an organization
    Given the GitHub API server:
    """
    get('/orgs/rails/public_members/wycats') { status 200 }
    """
    When I run `ghc member member --public rails wycats`
    Then the exit status should be 0

  Scenario: Remove a member
    Given the GitHub API server:
    """
    delete('/orgs/rails/members/wycats') { status 200 }
    """
    When I run `ghc member del rails wycats`
    Then the exit status should be 0

  Scenario: Publicize user's membership
    Given the GitHub API server:
    """
    put('/orgs/rails/public_members/wycats') { status 200 }
    """
    When I run `ghc member publicize rails wycats`
    Then the exit status should be 0

  Scenario: Conceal user's membership
    Given the GitHub API server:
    """
    delete('/orgs/rails/public_members/wycats') { status 200 }
    """
    When I run `ghc member conceal rails wycats`
    Then the exit status should be 0

