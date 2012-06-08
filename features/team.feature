Feature: ghc team

  Scenario Outline: Available commands
    When I run `ghc team`
    Then the output should contain "ghc team <command>"

    Examples:
      | command       |
      | add_member    |
      | add_repo      |
      | create        |
      | delete        |
      | edit          |
      | get           |
      | list          |
      | list_member   |
      | list_repo     |
      | member        |
      | remove_member |
      | remove_repo   |
      | repo          |
