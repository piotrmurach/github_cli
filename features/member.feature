Feature: ghc member

  Scenario Outline: Available commands
    When I run `ghc member`
    Then the output should contain "ghc member <command>"

    Examples:
      | command   |
      | conceal   |
      | delete    |
      | list      |
      | member    |
      | publicize |

  Scenario: List an organization members
    When I run `ghc member ls rails`
    Then the exit status should be 0

  Scenario: List an organization public members
    When I run `ghc member ls rails --public`
    Then the exit status should be 0

