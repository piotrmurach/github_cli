Feature: gcli tree

  @ci-run
  Scenario: Available commands

    When I run `gcli tree`
    Then the exit status should be 0
      And the output should contain "tree create"
      And the output should contain "tree get"

  Scenario: Get tree
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/git/trees/827efc6d5') { status 200 }
    """
    When I run `gcli tree get wycats thor 827efc6d5`
    Then the exit status should be 0

  Scenario: Get tree recursively
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/git/trees/827efc6d5') { status 200 }
    """
    When I run `gcli tree get wycats thor 827efc6d5 --recursive`
    Then the exit status should be 0

  Scenario: Create tree
    Given the Github API server:
    """
    post('/repos/wycats/thor/git/trees') { status 200 }
    """
    When I run `gcli tree create wycats thor --tree='path:file1 mode:00111'`
    Then the exit status should be 0
