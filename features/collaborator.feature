Feature: ghc collab

  Scenario: Available commands

    When I run `ghc collab`
    Then the exit status should be 0
      And the output should contain "ghc collab list"
      And the output should contain "ghc collab add"
      And the output should contain "ghc collab collab"
      And the output should contain "ghc collab remove"
