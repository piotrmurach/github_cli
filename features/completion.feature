@ci-run
Feature: Command Completion

  Scenario: Suggest alternative
    When I run `gcli blah`
    Then the exit status should be 1
    And the output should contain:
    """
    Did you mean this?
            blob
    """

  Scenario: Suggest more than one
    When I run `gcli convent`
    Then the exit status should be 1
    And the output should contain:
    """
    Did you mean this?
            content
    """

  Scenario: Suggset for strange word
    When I run `gcli xen`
    Then the exit status should be 1
    And the output should contain:
    """
    Could not find command "xen".
    Did you mean one of these?
            key
            ref
    """

  Scenario: Suggest subcommand
    When I run `gcli search kode`
    Then the exit status should be 1
    And the output should contain:
    """
    Could not find command "kode".
    Did you mean this?
            code
    """
