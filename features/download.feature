Feature: ghc download

  Scenario: Available commands

    When I run `ghc download`
    Then the exit status should be 0
      And the output should contain "ghc download create"
      And the output should contain "ghc download delete"
      And the output should contain "ghc download get"
      And the output should contain "ghc download list"
      And the output should contain "ghc download upload"

  Scenario: List downloads
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/downloads') { status 200 }
    """
    When I run `ghc download ls wycats thor`
    Then the exit status should be 0

  Scenario: Get download
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/downloads/1') { status 200 }
    """
    When I run `ghc download get wycats thor 1`
    Then the exit status should be 0

  Scenario: Delete download
    Given the GitHub API server:
    """
    delete('/repos/wycats/thor/downloads/1') { status 200 }
    """
    When I run `ghc download delete wycats thor 1`
    Then the exit status should be 0

  Scenario: Create download
    Given the GitHub API server:
    """
    post('/repos/wycats/thor/downloads') { status 200 }
    """
    When I run `ghc download create wycats thor --params=name:octo.jpg size:113410`
    Then the exit status should be 0
