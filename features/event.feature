Feature: ghc event

  Scenario: Available commands

    When I run `ghc event`
    Then the exit status should be 0
      And the output should contain "ghc event issue"
      And the output should contain "ghc event network"
      And the output should contain "ghc event org"
      And the output should contain "ghc event performed"
      And the output should contain "ghc event public"
      And the output should contain "ghc event received"
      And the output should contain "ghc event repo"
      And the output should contain "ghc event user_org"
