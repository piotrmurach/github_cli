Feature: ghc event

  Scenario: Available commands

    When I run `ghc event`
    Then the exit status should be 0
      And the output should contain "ghc event issue"
      And the output should contain "ghc event network"
      And the output should contain "ghc event org"
      And the output should contain "ghc event performed"
      And the output should contain "ghc event public"
      And the output should contain "ghc event received"
      And the output should contain "ghc event repo"
      And the output should contain "ghc event user_org"

  Scenario: Public events
    Given the GitHub API server:
    """
    get('/events') { status 200 }
    """
    When I run `ghc event public`
    Then the exit status should be 0

  Scenario: Repository events
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/events') { status 200 }
    """
    When I run `ghc event repo wycats thor`
    Then the exit status should be 0

  Scenario: Issue events
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/issues/events') { status 200 }
    """
    When I run `ghc event issue wycats thor`
    Then the exit status should be 0

  Scenario: Network events
    Given the GitHub API server:
    """
    get('/networks/wycats/thor/events') { status 200 }
    """
    When I run `ghc event network wycats thor`
    Then the exit status should be 0

  Scenario: Organization events
    Given the GitHub API server:
    """
    get('/orgs/github/events') { status 200 }
    """
    When I run `ghc event org github`
    Then the exit status should be 0

  Scenario: Received events
    Given the GitHub API server:
    """
    get('/users/wycats/received_events') { status 200 }
    """
    When I run `ghc event received wycats`
    Then the exit status should be 0

  Scenario: Received public events
    Given the GitHub API server:
    """
    get('/users/wycats/received_events/public') { status 200 }
    """
    When I run `ghc event received wycats --public`
    Then the exit status should be 0

  Scenario: Performed events
    Given the GitHub API server:
    """
    get('/users/wycats/events') { status 200 }
    """
    When I run `ghc event performed wycats`
    Then the exit status should be 0

  Scenario: Performed public events
    Given the GitHub API server:
    """
    get('/users/wycats/events/public') { status 200 }
    """
    When I run `ghc event performed wycats --public`
    Then the exit status should be 0

  Scenario: User organization events
    Given the GitHub API server:
    """
    get('/users/wycats/events/orgs/rails') { status 200 }
    """
    When I run `ghc event user_org wycats rails`
    Then the exit status should be 0
