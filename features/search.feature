Feature: ghc search

  Scenario: Available commands

    When I run `ghc search`
    Then the exit status should be 0
      And the output should contain "ghc search email"
      And the output should contain "ghc search issue"
      And the output should contain "ghc search repo"
      And the output should contain "ghc search user"
