Feature: gcli milestone

  @ci-run
  Scenario: Available commands

    When I run `gcli milestone`
    Then the exit status should be 0
      And the output should contain "gcli milestone create"
      And the output should contain "gcli milestone delete"
      And the output should contain "gcli milestone get"
      And the output should contain "gcli milestone list"
      And the output should contain "gcli milestone update"

  Scenario: List milestones
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/milestones') { status 200 }
    """
    When I run `gcli milestone ls wycats thor`
    Then the exit status should be 0

  Scenario: Get milestone
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/milestones/1') { status 200 }
    """
    When I run `gcli milestone get wycats thor 1`
    Then the exit status should be 0

  Scenario: Create milestone
    Given the GitHub API server:
    """
    post('/repos/wycats/thor/milestones') { status 200 }
    """
    When I run `gcli milestone create wycats thor --title=new`
    Then the exit status should be 0

  Scenario: Update milestone
    Given the GitHub API server:
    """
    patch('/repos/wycats/thor/milestones/1') { status 200 }
    """
    When I run `gcli milestone update wycats thor 1 --title=new`
    Then the exit status should be 0

  Scenario: Delete milestone
    Given the GitHub API server:
    """
    delete('/repos/wycats/thor/milestones/1') { status 200 }
    """
    When I run `gcli milestone del wycats thor 1`
    Then the exit status should be 0

