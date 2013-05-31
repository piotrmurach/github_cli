Feature: gcli download

  @ci-run
  Scenario: Available commands

    When I run `gcli download`
    Then the exit status should be 0
      And the output should contain "download create"
      And the output should contain "download delete"
      And the output should contain "download get"
      And the output should contain "download list"
      And the output should contain "download upload"

  Scenario: List downloads
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/downloads') { status 200 }
    """
    When I run `gcli download ls wycats thor`
    Then the exit status should be 0

  Scenario: Get download
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/downloads/1') { status 200 }
    """
    When I run `gcli download get wycats thor 1`
    Then the exit status should be 0

  Scenario: Create download
    Given the GitHub API server:
    """
    post('/repos/wycats/thor/downloads') { status 200 }
    """
    When I run `gcli download create wycats thor --name=octo.jpg --size=113410`
    Then the exit status should be 0

  Scenario: Delete download
    Given the GitHub API server:
    """
    delete('/repos/wycats/thor/downloads/1') { status 200 }
    """
    When I run `gcli download delete wycats thor 1`
    Then the exit status should be 0

