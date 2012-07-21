Feature: Configuration file

  Scenario: Config requires scope
    When I run `ghc config`
    Then the output should contain:
    """
    Invalid scope given. Please use --local or --global.
    """

  Scenario: Missing global file
    When I run `ghc config --global`
    Then the output should contain:
    """
    global configuration file does not exist. Please use `ghc init --global`
    """

  Scenario: Missing local file
    When I run `ghc config --local`
    Then the output should contain:
    """
    local configuration file does not exist. Please use `ghc init --local`
    """

  Scenario: List global file options
    Given I run `ghc init --global` interactively
      And I type "token"
    When I run `ghc config --global`
    Then the output should contain:
    """
    Configuration options:
    """

  Scenario: Read existing option
    Given I run `ghc init --global` interactively
      And I type "abc123"
    When I run `ghc config --global auth.token`
    Then the output should contain:
    """
    abc123
    """

  Scenario: Read missing option
    Given I run `ghc init --global` interactively
      And I type "abc123"
    When I run `ghc config --global missing.key`
    Then the output should contain:
    """
    Unknown option key
    """

  Scenario: Write existing option
    Given I run `ghc init --global` interactively
      And I type "abc123"
    When I run `ghc config --global auth.token eee555`
    Then the output should contain:
    """
    eee555
    """

  Scenario: Write missing option
    Given I run `ghc init --global` interactively
      And I type "abc123"
    When I run `ghc config --global core.token eee555`
    Then the output should contain:
    """
    eee555
    """
