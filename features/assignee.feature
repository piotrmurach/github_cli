Feature: gcli assignee

  @ci-run
  Scenario: Available commands

    When I run `gcli assignee`
    Then the exit status should be 0
      And the output should contain "gcli assignee list"
      And the output should contain "gcli assignee check"

  Scenario: List assignees
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/assignees') {
      body :login => 'octokit', :id => 1,
           :url => 'https://api.github.com/users/peter-murach'
      status 200
    }
    """
    When I successfully run `gcli assignee ls wycats thor`
    Then the stdout should contain "octokit"

  Scenario: Check assignee
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/assignees/octokit') { status 204 }
    """
    When I run `gcli assignee check wycats thor octokit`
    Then the exit status should be 0
      And the stdout should contain "true"

  Scenario: Check assignee
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/assignees/octokit') { status 404 }
    """
    When I run `gcli assignee check wycats thor octokit`
    Then the exit status should be 0
      And the stdout should contain "false"
