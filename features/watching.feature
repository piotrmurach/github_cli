Feature: ghc watching

  Scenario: Available commands

    When I run `ghc watch`
    Then the exit status should be 0
      And the output should contain "ghc watch start"
      And the output should contain "ghc watch stop"
      And the output should contain "ghc watch watched"
      And the output should contain "ghc watch watchers"
      And the output should contain "ghc watch watching"
