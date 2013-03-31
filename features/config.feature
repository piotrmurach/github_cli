@ci-run
Feature: Configuration file

  Scenario: Missing global file
    When I run `gcli config`
    Then the output should contain:
    """
    Configuration file does not exist. Please use `gcli init` to create one.
    """

  Scenario: Missing local file
    When I run `gcli config --local`
    Then the output should contain:
    """
    Configuration file does not exist. Please use `gcli init` to create one.
    """

  Scenario: List global file options
    Given I run `gcli init`
    When I run `gcli config`
    Then the output should contain:
    """
    Configuration options:
    """

  Scenario: Seek local before global configuration
    Given a directory named "piotr"
      And I cd to "piotr"
      And I run `gcli init --local`
   When I run `gcli config`
   Then the output should contain:
    """
    Configuration options:
    """

  Scenario: Read existing option
    Given I run `gcli init`
    When I successfully run `gcli config user.token abc123`
    Then the stdout should contain "abc123"

  Scenario: Read missing option
    Given I run `gcli init`
    When I run `gcli config missing.key`
    Then the exit status should be 0

  Scenario: Write custom option
    Given I run `gcli init`
    When I successfully run `gcli config core.host eee555`
    Then the stdout should contain "eee555"

  Scenario: Listing all configuration options
    Given I run `gcli init`
    When I run `gcli config -l`
    Then the stdout should contain "user.token"

