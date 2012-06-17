Feature: ghc gist

  Scenario: Available commands

    When I run `ghc gist`
    Then the exit status should be 0
      And the output should contain "ghc gist create"
      And the output should contain "ghc gist delete"
      And the output should contain "ghc gist edit"
      And the output should contain "ghc gist get"
      And the output should contain "ghc gist fork"
      And the output should contain "ghc gist list"
      And the output should contain "ghc gist star"
      And the output should contain "ghc gist starred"
      And the output should contain "ghc gist unstar"
