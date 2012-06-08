Feature: ghc fork

  Scenario Outline: Available commands
    When I run `ghc fork`
    Then the output should contain "ghc fork <command>"

    Examples:
      | command |
      | create  |
      | list    |

  Scenario: List forks
    When I run `ghc fork ls wycats thor`
    Then the exit status should be 0
