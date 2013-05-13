Feature: gcli member

  @ci-run
  Scenario: Available commands

    When I run `gcli member`
    Then the exit status should be 0
      And the output should contain "member delete"
      And the output should contain "member list"
      And the output should contain "member member"
      And the output should contain "member publicize"

  Scenario: List members
    Given the GitHub API server:
    """
    get('/orgs/rails/members') { status 200 }
    """
    When I run `gcli member ls rails`
    Then the exit status should be 0

  Scenario: List public members
    Given the GitHub API server:
    """
    get('/orgs/rails/public_members') { status 200 }
    """
    When I run `gcli member ls --public rails`
    Then the exit status should be 0

  Scenario: Check if user is a member of an organization
    Given the GitHub API server:
    """
    get('/orgs/rails/members/wycats') { status 200 }
    """
    When I run `gcli member member rails wycats`
    Then the exit status should be 0

  Scenario: Check if user is a public member of an organization
    Given the GitHub API server:
    """
    get('/orgs/rails/public_members/wycats') { status 200 }
    """
    When I run `gcli member member --public rails wycats`
    Then the exit status should be 0

  Scenario: Remove a member
    Given the GitHub API server:
    """
    delete('/orgs/rails/members/wycats') { status 200 }
    """
    When I run `gcli member del rails wycats`
    Then the exit status should be 0

  Scenario: Publicize user's membership
    Given the GitHub API server:
    """
    put('/orgs/rails/public_members/wycats') { status 200 }
    """
    When I run `gcli member publicize rails wycats`
    Then the exit status should be 0

  Scenario: Conceal user's membership
    Given the GitHub API server:
    """
    delete('/orgs/rails/public_members/wycats') { status 200 }
    """
    When I run `gcli member conceal rails wycats`
    Then the exit status should be 0

