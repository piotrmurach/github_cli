Feature: ghc collab

  Scenario: Available commands

    When I run `ghc collab`
    Then the exit status should be 0
      And the output should contain "ghc collab list"
      And the output should contain "ghc collab add"
      And the output should contain "ghc collab collab"
      And the output should contain "ghc collab remove"

  Scenario: List collaborators
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/collaborators') { status 200 }
    """
    When I run `ghc collab ls wycats thor`
    Then the exit status should be 0

  Scenario: Add collaborator
    Given the GitHub API server:
    """
    put('/repos/wycats/thor/collaborators/octocat') { status 200 }
    """
    When I run `ghc collab add wycats thor octocat`
    Then the exit status should be 0

  Scenario: Remove collaborator
    Given the GitHub API server:
    """
    delete('/repos/wycats/thor/collaborators/octocat') { status 200 }
    """
    When I run `ghc collab remove wycats thor octocat`
    Then the exit status should be 0

  Scenario: Check if collaborator
    Given the GitHub API server:
    """
    delete('/repos/wycats/thor/collaborators/octocat') { status 200 }
    """
    When I run `ghc collab collab wycats thor octocat`
    Then the exit status should be 0

