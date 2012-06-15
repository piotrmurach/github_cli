Feature: ghc follower

  Scenario: Available commands

    When I run `ghc follower`
    Then the exit status should be 0
      And the output should contain "ghc follower follow"
      And the output should contain "ghc follower follower"
      And the output should contain "ghc follower following"
      And the output should contain "ghc follower list"
      And the output should contain "ghc follower unfollow"
