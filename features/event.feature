Feature: gcli event

  @ci-run
  Scenario: Available commands

    When I run `gcli event`
    Then the exit status should be 0
      And the output should contain "event issue"
      And the output should contain "event network"
      And the output should contain "event org"
      And the output should contain "event performed"
      And the output should contain "event public"
      And the output should contain "event received"
      And the output should contain "event repo"
      And the output should contain "event user_org"

  Scenario: Public events
    Given the GitHub API server:
    """
    get('/events') { status 200 }
    """
    When I run `gcli event public`
    Then the exit status should be 0

  Scenario: Repository events
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/events') { status 200 }
    """
    When I run `gcli event repo wycats thor`
    Then the exit status should be 0

  Scenario: Issue events
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/issues/events') { status 200 }
    """
    When I run `gcli event issue wycats thor`
    Then the exit status should be 0

  Scenario: Network events
    Given the GitHub API server:
    """
    get('/networks/wycats/thor/events') { status 200 }
    """
    When I run `gcli event network wycats thor`
    Then the exit status should be 0

  Scenario: Organization events
    Given the GitHub API server:
    """
    get('/orgs/github/events') { status 200 }
    """
    When I run `gcli event org github`
    Then the exit status should be 0

  Scenario: Received events
    Given the GitHub API server:
    """
    get('/users/wycats/received_events') { status 200 }
    """
    When I run `gcli event received wycats`
    Then the exit status should be 0

  Scenario: Received public events
    Given the GitHub API server:
    """
    get('/users/wycats/received_events/public') { status 200 }
    """
    When I run `gcli event received wycats --public`
    Then the exit status should be 0

  Scenario: Performed events
    Given the GitHub API server:
    """
    get('/users/wycats/events') { status 200 }
    """
    When I run `gcli event performed wycats`
    Then the exit status should be 0

  Scenario: Performed public events
    Given the GitHub API server:
    """
    get('/users/wycats/events/public') { status 200 }
    """
    When I run `gcli event performed wycats --public`
    Then the exit status should be 0

  Scenario: User organization events
    Given the GitHub API server:
    """
    get('/users/wycats/events/orgs/rails') { status 200 }
    """
    When I run `gcli event user_org wycats rails`
    Then the exit status should be 0
