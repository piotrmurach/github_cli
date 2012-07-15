Feature: ghc milestone

  Scenario: Available commands

    When I run `ghc milestone`
    Then the exit status should be 0
      And the output should contain "ghc milestone create"
      And the output should contain "ghc milestone delete"
      And the output should contain "ghc milestone get"
      And the output should contain "ghc milestone list"
      And the output should contain "ghc milestone update"

  Scenario: List milestones
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/milestones') { status 200 }
    """
    When I run `ghc milestone ls wycats thor`
    Then the exit status should be 0

  Scenario: Get milestone
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/milestones/1') { status 200 }
    """
    When I run `ghc milestone get wycats thor 1`
    Then the exit status should be 0

  Scenario: Create milestone
    Given the GitHub API server:
    """
    post('/repos/wycats/thor/milestones') { status 200 }
    """
    When I run `ghc milestone create wycats thor --params=title:new`
    Then the exit status should be 0

  Scenario: Update milestone
    Given the GitHub API server:
    """
    patch('/repos/wycats/thor/milestones/1') { status 200 }
    """
    When I run `ghc milestone update wycats thor 1 --params=title:new`
    Then the exit status should be 0

  Scenario: Delete milestone
    Given the GitHub API server:
    """
    delete('/repos/wycats/thor/milestones/1') { status 200 }
    """
    When I run `ghc milestone del wycats thor 1`
    Then the exit status should be 0

