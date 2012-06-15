Feature: ghc team

  Scenario: Available commands
    When I run `ghc team`
    Then the exit status should be 0
      And the output should contain "ghc team add_member"
      And the output should contain "ghc team add_repo"
      And the output should contain "ghc team create"
      And the output should contain "ghc team delete"
      And the output should contain "ghc team edit"
      And the output should contain "ghc team get"
      And the output should contain "ghc team list"
      And the output should contain "ghc team list_member"
      And the output should contain "ghc team list_repo"
      And the output should contain "ghc team member"
      And the output should contain "ghc team remove_member"
      And the output should contain "ghc team remove_repo"
      And the output should contain "ghc team repo"
