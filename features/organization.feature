Feature: ghc org

  Scenario: Available commands

    When I run `ghc org`
    Then the exit status should be 0
      And the output should contain "ghc org edit"
      And the output should contain "ghc org list"
      And the output should contain "ghc org get"
