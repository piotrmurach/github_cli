Feature: ghc org

  Scenario: Available commands

    When I run `ghc org`
    Then the exit status should be 0
      And the output should contain "ghc org edit"
      And the output should contain "ghc org list"
      And the output should contain "ghc org get"

  Scenario: List public organizations for a user
    Given the GitHub API server:
    """
    get('/users/wycats/orgs') { status 200 }
    """
    When I run `ghc org ls --user=wycats`
    Then the exit status should be 0

  Scenario: List public organizations for the authenticated user
    Given the GitHub API server:
    """
    get('/user/orgs') { status 200 }
    """
    When I run `ghc org ls`
    Then the exit status should be 0

  Scenario: Get an organization
    Given the GitHub API server:
    """
    get('/orgs/rails') { status 200 }
    """
    When I run `ghc org get rails`
    Then the exit status should be 0

  Scenario: Edit an organization
    Given the GitHub API server:
    """
    patch('/orgs/rails') { status 200 }
    """
    When I run `ghc org edit rails --params=name:github company:GitHub email:support@github.com`
    Then the exit status should be 0
