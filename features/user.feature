Feature: ghc user

  Scenario: Available commands

    When I run `ghc user`
    Then the exit status should be 0
      And the output should contain "ghc user get"
      And the output should contain "ghc user update"
