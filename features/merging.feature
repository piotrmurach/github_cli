Feature: gcli merge

  Scenario: Available commands

    When I run `gcli merge`
    Then the exit status should be 0
      And the output should contain "gcli merge perform"

  Scenario: Merge success
    Given the GitHub API server:
    """
    post('/repos/wycats/thor/merges') {
      body 'author' => { :login => 'octokit', :id => 1,
           :url => 'https://api.github.com/users/peter-murach' }
      status 201
    }
    """
    When I successfully run `gcli merge perform wycats thor --params=base:master head:cool_feature`
    Then the stdout should contain "octokit"
      And the stdout should contain "201"

  Scenario: Nothing to merge
    Given the GitHub API server:
    """
    post('/repos/wycats/thor/merges') {
      status 204
    }
    """
    When I successfully run `gcli merge perform wycats thor --params=base:master head:cool_feature`
    Then the stdout should contain "204"

  Scenario: Merge conflict
    Given the GitHub API server:
    """
    post('/repos/wycats/thor/merges') {
      body :message => "Merge conflict"
      status 409
    }
    """
    When I run `gcli merge perform wycats thor --params=base:master head:cool_feature`
    Then the exit status should be 1
    Then the stdout should contain "Merge conflict"
      And the stdout should contain "409"
