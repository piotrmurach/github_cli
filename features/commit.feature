Feature: gcli commit

  Scenario: Available commands

    When I run `gcli commit`
    Then the exit status should be 0
      And the output should contain "gcli commit get"
      And the output should contain "gcli commit create"

  Scenario: Get commit
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/git/commits/59b23de9b91d') { status 200 }
    """
    When I run `gcli commit get wycats thor 59b23de9b91d`
    Then the exit status should be 0

  Scenario: Create commit
    Given the GitHub API server:
    """
    post('/repos/wycats/thor/git/commits') { status 200 }
    """
    When I run `gcli commit create wycats thor --params=message:'my commit' tree:827efc parents:['7d1b31e']`
    Then the exit status should be 0
