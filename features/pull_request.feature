Feature: ghc pull request

  Scenario: Available commands

    When I run `ghc pull`
    Then the exit status should be 0
      And the output should contain "ghc pull commits"
      And the output should contain "ghc pull create"
      And the output should contain "ghc pull files"
      And the output should contain "ghc pull get"
      And the output should contain "ghc pull list"
      And the output should contain "ghc pull merge"
      And the output should contain "ghc pull merged"
      And the output should contain "ghc pull update"
