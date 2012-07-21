Feature: gcli collab

  Scenario: Available commands

    When I run `gcli collab`
    Then the exit status should be 0
      And the output should contain "gcli collab list"
      And the output should contain "gcli collab add"
      And the output should contain "gcli collab collab"
      And the output should contain "gcli collab remove"

  Scenario: List collaborators
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/collaborators') { status 200 }
    """
    When I run `gcli collab ls wycats thor`
    Then the exit status should be 0

  Scenario: Add collaborator
    Given the GitHub API server:
    """
    put('/repos/wycats/thor/collaborators/octocat') { status 200 }
    """
    When I run `gcli collab add wycats thor octocat`
    Then the exit status should be 0

  Scenario: Remove collaborator
    Given the GitHub API server:
    """
    delete('/repos/wycats/thor/collaborators/octocat') { status 200 }
    """
    When I run `gcli collab remove wycats thor octocat`
    Then the exit status should be 0

  Scenario: Check if collaborator
    Given the GitHub API server:
    """
    delete('/repos/wycats/thor/collaborators/octocat') { status 200 }
    """
    When I run `gcli collab collab wycats thor octocat`
    Then the exit status should be 0

