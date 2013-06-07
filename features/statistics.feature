Feature: gcli stat

  @ci-run
  Scenario: Available commands

    When I run `gcli stat`
    Then the exit status should be 0
      And the output should contain "stat contribs"
      And the output should contain "stat activity"
      And the output should contain "stat frequency"
      And the output should contain "stat participation"
      And the output should contain "stat card"

  Scenario: List contributions
    Given the GitHub API server:
    """
    get('/repos/peter-murach/tty/stats/contributors') { status 200 }
    """
    When I run `gcli stat contribs peter-murach tty`
    Then the exit status should be 0

  Scenario: List commit activity
    Given the GitHub API server:
    """
    get('/repos/peter-murach/tty/stats/commit_activity') { status 200 }
    """
    When I run `gcli stat activity peter-murach tty`
    Then the exit status should be 0

  Scenario: List code frequency
    Given the GitHub API server:
    """
    get('/repos/peter-murach/tty/stats/code_frequency') { status 200 }
    """
    When I run `gcli stat frequency peter-murach tty`
    Then the exit status should be 0

  Scenario: List participation
    Given the GitHub API server:
    """
    get('/repos/peter-murach/tty/stats/participation') { status 200 }
    """
    When I run `gcli stat participation peter-murach tty`
    Then the exit status should be 0

  Scenario: List punch card
    Given the GitHub API server:
    """
    get('/repos/peter-murach/tty/stats/punch_card') { status 200 }
    """
    When I run `gcli stat card peter-murach tty`
    Then the exit status should be 0

