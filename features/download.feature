Feature: ghc download

  Scenario: Available commands

    When I run `ghc download`
    Then the exit status should be 0
      And the output should contain "ghc download create"
      And the output should contain "ghc download delete"
      And the output should contain "ghc download get"
      And the output should contain "ghc download list"
      And the output should contain "ghc download upload"
