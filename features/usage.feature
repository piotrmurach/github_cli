Feature: Command Usage

  Scenario: Getting Usage for Commands

    When I run `gcli`
    Then the exit status should be 0
    And the output should contain "Usage: gcli"
      And the output should contain "[--config]"
      And the output should contain "[--no-color]"
      And the output should contain "[--no-pager]"
      And the output should contain "[--version]"
      And the output should contain "[--verbose]"

  Scenario: Specific usage for command

    When I run `gcli repo`
    Then the exit status should be 0
    And the output should contain "repo <subcommand>"
