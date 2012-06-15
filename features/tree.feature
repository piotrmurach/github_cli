Feature: ghc tree

  Scenario: Available commands

    When I run `ghc tree`
    Then the exit status should be 0
      And the output should contain "ghc tree create"
      And the output should contain "ghc tree get"
