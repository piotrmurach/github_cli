Feature: ghc email

  Scenario: Available commands

    When I run `ghc email`
    Then the exit status should be 0
      And the output should contain "ghc email delete"
      And the output should contain "ghc email list"
      And the output should contain "ghc email add"
