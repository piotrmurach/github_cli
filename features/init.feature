@ci-run
Feature: Init command

  As a developer who wants to set global settings for interaction with GitHub API
  When I use interface provided by GCLI
  I have ability to create configuration file

  Scenario: Installs global config file
    When I run `gcli init`
    Then the output should contain:
      """
      Writing new configuration file to /tmp/fakehome/.gcliconfig
      """
      And a file named "/tmp/fakehome/.gcliconfig" should exist
      And the file "/tmp/fakehome/.gcliconfig" should contain "token:"

  Scenario: Installs local config file
    Given a directory named "piotr"
    When I cd to "piotr"
      And I run `gcli init --local`
    Then a file named ".gcliconfig" should exist
      And the file ".gcliconfig" should contain "token:"

  Scenario: Global config file arleady exists
    Given an empty file named "/tmp/fakehome/.gcliconfig"
    When I run `gcli init`
    Then the output should contain:
    """
    Not overwritting existing config file /tmp/fakehome/.gcliconfig, use --force to override.
    """

  Scenario: Force global config file override
    Given an empty file named "/tmp/fakehome/.gcliconfig"
    When I run `gcli init --force`
    Then the output should contain:
    """
    Writing new configuration file to /tmp/fakehome/.gcliconfig
    """

  Scenario: Install config file with custom name
    When I run `gcli init .custom-name`
    Then the output should contain:
      """
      Writing new configuration file to /tmp/fakehome/.custom-name
      """
