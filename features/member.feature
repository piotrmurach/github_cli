Feature: ghc member

  Scenario: Available commands

    When I run `ghc member`
    Then the exit status should be 0
      And the output should contain "ghc member delete"
      And the output should contain "ghc member list"
      And the output should contain "ghc member member"
      And the output should contain "ghc member publicize"

#   Scenario: List an organization members
#     When I run `ghc member ls rails`
#     Then the exit status should be 0
# 
#   Scenario: List an organization public members
#     When I run `ghc member ls rails --public`
#     Then the exit status should be 0
