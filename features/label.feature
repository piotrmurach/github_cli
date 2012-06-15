Feature: ghc label

  Scenario: Available commands

    When I run `ghc label`
    Then the exit status should be 0
      And the output should contain "ghc label add"
      And the output should contain "ghc label create"
      And the output should contain "ghc label delete"
      And the output should contain "ghc label get"
      And the output should contain "ghc label issue"
      And the output should contain "ghc label list"
      And the output should contain "ghc label milestone"
      And the output should contain "ghc label remove"
      And the output should contain "ghc label replace"
      And the output should contain "ghc label update"
