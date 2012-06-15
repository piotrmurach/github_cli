Feature: ghc fork

  Scenario: Available commands
    When I run `ghc fork`
    Then the output should contain "ghc fork create"
      And the output should contain "ghc fork list"

#   Scenario: List forks
#     When I run `ghc fork ls wycats thor` interactively
#       And I type "q"
#     Then the exit status should be 0
