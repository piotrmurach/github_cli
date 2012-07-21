Feature: Command Completion

  Scenario: Suggest alternative

    When I run `gcli blah`
    Then the exit status should be 0
    And the output should contain:
    """
    Did you mean this?
            blob
    """

  Scenario: Suggest more than one

    When I run `gcli convent`
    Then the exit status should be 0
    And the output should contain:
    """
    Did you mean this?
            collab
            commit
            content
    """

  Scenario: Suggset nothing

    When I run `gcli xen`
    Then the exit status should be 0
    And the output should not contain:
    """
    Did you mean this?
    """
