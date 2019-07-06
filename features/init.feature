@ci-run
Feature: Init command

  As a developer who wants to set global settings for interaction with GitHub API
  When I use interface provided by GCLI
  I have ability to create configuration file

  Scenario: Installs global config file
    When I run `gcli init --local`
    Then the output should match:
      """
      Writing new configuration file to (.*)tmp/fakehome/.gcliconfig
      """
      And a file named ".gcliconfig" should exist
      And the file ".gcliconfig" should contain "token:"

  Scenario: Installs local config file
    Given a directory named "piotr"
    When I cd to "piotr"
      And I run `gcli init --local`
    Then a file named ".gcliconfig" should exist
      And the file ".gcliconfig" should contain "token:"

  Scenario: Global config file arleady exists
    Given an empty file named ".gcliconfig"
    When I run `gcli init --local`
    Then the output should match:
    """
    Not overwritting existing config file (.*)tmp/fakehome/.gcliconfig, use --force to override.
    """

  Scenario: Force global config file override
    Given an empty file named ".gcliconfig"
    When I run `gcli init --force --local`
    Then the output should match:
    """
    Writing new configuration file to (.*)tmp/fakehome/.gcliconfig
    """

  Scenario: Install config file with custom name
    When I run `gcli init .custom-name --local`
    Then the output should match:
      """
      Writing new configuration file to (.*)tmp/fakehome/.custom-name
      """
