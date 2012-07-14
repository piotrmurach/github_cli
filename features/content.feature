Feature: ghc content

  Scenario: Available commands

    When I run `ghc content`
    Then the exit status should be 0
      And the output should contain "ghc content get"
      And the output should contain "ghc content readme"
      And the output should contain "ghc content archive"

  Scenario: Readme
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/readme') { status 200 }
    """
    When I run `ghc content readme wycats thor`
    Then the exit status should be 0

  Scenario: Get content
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/contents/lib') { status 200 }
    """
    When I run `ghc content get wycats thor lib`
    Then the exit status should be 0

  Scenario: Archive
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/zipball/master') { status 200 }
    """
    When I run `ghc content archive wycats thor`
    Then the exit status should be 0

  Scenario: Archive with params
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/tarball/new_feature') { status 200 }
    """
    When I run `ghc content archive wycats thor --params=archive_format:tarball ref:new_feature`
    Then the exit status should be 0
