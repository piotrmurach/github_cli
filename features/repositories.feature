Feature: gh repository

  Scenario: Available commands
    When I run `ghc repo`
    Then the exit status should be 0
      And the output should contain "ghc repo branches"
      And the output should contain "ghc repo contribs"
      And the output should contain "ghc repo create"
      And the output should contain "ghc repo edit"
      And the output should contain "ghc repo get"
      And the output should contain "ghc repo list"
      And the output should contain "ghc repo languages"
      And the output should contain "ghc repo tags"
      And the output should contain "ghc repo teams"

#   Scenario: List repositories
#     When I run `ghc repo ls --user=wycats`
#     Then the exit status should be 0
