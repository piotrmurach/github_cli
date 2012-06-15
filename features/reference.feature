Feature: ghc ref

  Scenario: Available commands

    When I run `ghc ref`
    Then the exit status should be 0
      And the output should contain "ghc ref create"
      And the output should contain "ghc ref delete"
      And the output should contain "ghc ref get"
      And the output should contain "ghc ref list"
      And the output should contain "ghc ref update"
