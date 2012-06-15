Feature: ghc milestone

  Scenario: Available commands

    When I run `ghc milestone`
    Then the exit status should be 0
      And the output should contain "ghc milestone create"
      And the output should contain "ghc milestone delete"
      And the output should contain "ghc milestone get"
      And the output should contain "ghc milestone list"
      And the output should contain "ghc milestone update"
