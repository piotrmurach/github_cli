Feature: gcli label

  Scenario: Available commands

    When I run `gcli label`
    Then the exit status should be 0
      And the output should contain "gcli label add"
      And the output should contain "gcli label create"
      And the output should contain "gcli label delete"
      And the output should contain "gcli label get"
      And the output should contain "gcli label issue"
      And the output should contain "gcli label list"
      And the output should contain "gcli label milestone"
      And the output should contain "gcli label remove"
      And the output should contain "gcli label replace"
      And the output should contain "gcli label update"

  Scenario: List labels
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/labels') { status 200 }
    """
    When I run `gcli label ls wycats thor`
    Then the exit status should be 0

  Scenario: Get label
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/labels/1') { status 200 }
    """
    When I run `gcli label get wycats thor 1`
    Then the exit status should be 0

  Scenario: Create label
    Given the GitHub API server:
    """
    post('/repos/wycats/thor/labels') { status 200 }
    """
    When I run `gcli label create wycats thor --params=name:bug color:f3f3f3`
    Then the exit status should be 0

  Scenario: Update label
    Given the GitHub API server:
    """
    patch('/repos/wycats/thor/labels/1') { status 200 }
    """
    When I run `gcli label update wycats thor 1 --params=name:bug color:f3f3f3`
    Then the exit status should be 0

  Scenario: Delete label
    Given the GitHub API server:
    """
    delete('/repos/wycats/thor/labels/1') { status 200 }
    """
    When I run `gcli label delete wycats thor 1`
    Then the exit status should be 0

  Scenario: Add labels
    Given the GitHub API server:
    """
    post('/repos/wycats/thor/issues/1/labels') { status 200 }
    """
    When I run `gcli label add wycats thor 1 bug feature`
    Then the exit status should be 0

  Scenario: Remove label from an issue
    Given the GitHub API server:
    """
    delete('/repos/wycats/thor/issues/1/labels/2') { status 200 }
    """
    When I run `gcli label remove wycats thor 2/1`
    Then the exit status should be 0

  Scenario: Remove label from an issue
    Given the GitHub API server:
    """
    delete('/repos/wycats/thor/issues/1/labels/2') { status 200 }
    """
    When I run `gcli label remove wycats thor 2/1`
    Then the exit status should be 0

  Scenario: Remove all labels from an issue
    Given the GitHub API server:
    """
    delete('/repos/wycats/thor/issues/1/labels') { status 200 }
    """
    When I run `gcli label remove wycats thor 1`
    Then the exit status should be 0

  Scenario: Replace labels
    Given the GitHub API server:
    """
    put('/repos/wycats/thor/issues/1/labels') { status 200 }
    """
    When I run `gcli label replace wycats thor 1 bug feature`
    Then the exit status should be 0

  Scenario: Milestone labels
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/milestones/1/labels') { status 200 }
    """
    When I run `gcli label milestone wycats thor 1`
    Then the exit status should be 0

