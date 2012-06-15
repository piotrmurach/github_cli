Feature: ghc tag

  Scenario: Available commands

    When I run `ghc tag`
    Then the exit status should be 0
      And the output should contain "ghc tag create"
      And the output should contain "ghc tag get"
