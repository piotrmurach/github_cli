Feature: gcli status

  @ci-run
  Scenario: Available commands

    When I run `gcli status`
    Then the exit status should be 0
      And the output should contain "status list"
      And the output should contain "status create"

  Scenario: List statuses
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/statuses/abc123') {
      body :creator => { :login => 'octokit', :id => 1 },
           :url => 'https://api.github.com/users/peter-murach',
           :state => 'success'
      status 200
    }
    """
    When I successfully run `gcli status ls wycats thor abc123`
    Then the stdout should contain "octokit"

  Scenario: Create status
    Given the GitHub API server:
    """
    post('/repos/wycats/thor/statuses/abc123') {
      body :creator => { :login => 'octokit', :id => 1 },
           :url => 'https://api.github.com/users/peter-murach',
           :state => 'success'
      status 200
    }
    """
    When I run `gcli status create wycats thor abc123 --state=pending`
    Then the exit status should be 0
      And the stdout should contain "success"

