Feature: ghc commit

  Scenario: Available commands

    When I run `ghc commit`
    Then the exit status should be 0
      And the output should contain "ghc commit get"
      And the output should contain "ghc commit create"
