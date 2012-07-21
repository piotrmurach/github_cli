Feature: gcli content

  Scenario: Available commands

    When I run `gcli content`
    Then the exit status should be 0
      And the output should contain "gcli content get"
      And the output should contain "gcli content readme"
      And the output should contain "gcli content archive"

  Scenario: Readme
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/readme') { status 200 }
    """
    When I run `gcli content readme wycats thor`
    Then the exit status should be 0

  Scenario: Get content
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/contents/lib') { status 200 }
    """
    When I run `gcli content get wycats thor lib`
    Then the exit status should be 0

  Scenario: Archive
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/zipball/master') { status 200 }
    """
    When I run `gcli content archive wycats thor`
    Then the exit status should be 0

  Scenario: Archive with params
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/tarball/new_feature') { status 200 }
    """
    When I run `gcli content archive wycats thor --params=archive_format:tarball ref:new_feature`
    Then the exit status should be 0
