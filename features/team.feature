Feature: gcli team

  @ci-run
  Scenario: Available commands
    When I run `gcli team`
    Then the exit status should be 0
      And the output should contain "team add_member"
      And the output should contain "team add_repo"
      And the output should contain "team create"
      And the output should contain "team delete"
      And the output should contain "team edit"
      And the output should contain "team get"
      And the output should contain "team list"
      And the output should contain "team list_member"
      And the output should contain "team list_repo"
      And the output should contain "team member"
      And the output should contain "team remove_member"
      And the output should contain "team remove_repo"
      And the output should contain "team repo"

  Scenario: List all teams
    Given the GitHub API server:
    """
    get('/orgs/rails/teams') { status 200 }
    """
    When I run `gcli team ls rails`
    Then the exit status should be 0

  Scenario: Get team
    Given the GitHub API server:
    """
    get('/teams/rails') { status 200 }
    """
    When I run `gcli team get rails`
    Then the exit status should be 0

  Scenario: Create team
    Given the GitHub API server:
    """
    post('/orgs/rails/teams') { status 200 }
    """
    When I run `gcli team create rails --params=name:'new team'`
    Then the exit status should be 0

  Scenario: Edit team
    Given the GitHub API server:
    """
    patch('/teams/rails') { status 200 }
    """
    When I run `gcli team edit rails --params=name:'new team'`
    Then the exit status should be 0

  Scenario: Delete team
    Given the GitHub API server:
    """
    delete('/teams/rails') { status 200 }
    """
    When I run `gcli team del rails`
    Then the exit status should be 0

  Scenario: List team members
    Given the GitHub API server:
    """
    get('/teams/rails/members') { status 200 }
    """
    When I run `gcli team list_members rails`
    Then the exit status should be 0

  Scenario: Check is user is a team member
    Given the GitHub API server:
    """
    get('/teams/rails/members/wycats') { status 200 }
    """
    When I run `gcli team member rails wycats`
    Then the exit status should be 0

  Scenario: Add a team member
    Given the GitHub API server:
    """
    put('/teams/rails/members/wycats') { status 200 }
    """
    When I run `gcli team add_member rails wycats`
    Then the exit status should be 0

  Scenario: Remove a team member
    Given the GitHub API server:
    """
    delete('/teams/rails/members/wycats') { status 200 }
    """
    When I run `gcli team remove_member rails wycats`
    Then the exit status should be 0

  Scenario: List team repositories
    Given the GitHub API server:
    """
    get('/teams/rails/repos') { status 200 }
    """
    When I run `gcli team list_repo rails`
    Then the exit status should be 0

  Scenario: Check if repository belongs to a team
    Given the GitHub API server:
    """
    get('/teams/rails/repos/wycats/thor') { status 200 }
    """
    When I run `gcli team repo rails wycats thor`
    Then the exit status should be 0

  Scenario: Add a team repository
    Given the GitHub API server:
    """
    put('/teams/rails/repos/wycats/thor') { status 200 }
    """
    When I run `gcli team add_repo rails wycats thor`
    Then the exit status should be 0

  Scenario: Remove a team repository
    Given the GitHub API server:
    """
    delete('/teams/rails/repos/wycats/thor') { status 200 }
    """
    When I run `gcli team remove_repo rails wycats thor`
    Then the exit status should be 0

