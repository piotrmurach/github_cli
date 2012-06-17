Feature: ghc blob

  Scenario: Available commands

    When I run `ghc blob`
    Then the exit status should be 0
      And the output should contain "ghc blob get"
      And the output should contain "ghc blob create"
