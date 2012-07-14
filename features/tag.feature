Feature: ghc tag

  Scenario: Available commands

    When I run `ghc tag`
    Then the exit status should be 0
      And the output should contain "ghc tag create"
      And the output should contain "ghc tag get"

  Scenario: Get tag
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/git/tags/827efc6d5') { status 200 }
    """
    When I run `ghc tag get wycats thor 827efc6d5`
    Then the exit status should be 0

  Scenario: Create tag
    Given the GitHub API server:
    """
    post('/repos/wycats/thor/git/tags') { status 200 }
    """
    When I run `ghc tag create wycats thor`
    Then the exit status should be 0
