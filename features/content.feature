Feature: ghc content

  Scenario: Available commands

    When I run `ghc content`
    Then the exit status should be 0
      And the output should contain "ghc content get"
      And the output should contain "ghc content readme"
      And the output should contain "ghc content archive"
