Feature: ghc hook

  Scenario: Available commands

    When I run `ghc hook`
    Then the exit status should be 0
      And the output should contain "ghc hook create"
      And the output should contain "ghc hook delete"
      And the output should contain "ghc hook edit"
      And the output should contain "ghc hook get"
      And the output should contain "ghc hook list"
      And the output should contain "ghc hook test"
