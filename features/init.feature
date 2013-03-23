@ci-run
Feature: Init command

  As a developer who wants to set global settings for interaction with GitHub API
  When I use interface provided by GCLI
  I have ability to create configuration file

  Scenario: Installs global config file
    When I run `gcli init`
    Then the output should contain:
      """
      Writing new configuration file to /tmp/fakehome/.githubrc
      """
      And a file named "/tmp/fakehome/.githubrc" should exist
      And the file "/tmp/fakehome/.githubrc" should contain "user.token:"

  Scenario: Installs local config file
    Given a directory named "piotr"
    When I cd to "piotr"
      And I run `gcli init --local`
    Then a file named ".githubrc" should exist
      And the file ".githubrc" should contain "user.token:"

  Scenario: Global config file arleady exists
    Given an empty file named "/tmp/fakehome/.githubrc"
    When I run `gcli init`
    Then the output should contain:
    """
    Not overwritting existing config file /tmp/fakehome/.githubrc, use --force to override.
    """

  Scenario: Force global config file override
    Given an empty file named "/tmp/fakehome/.githubrc"
    When I run `gcli init --force`
    Then the output should contain:
    """
    Writing new configuration file to /tmp/fakehome/.githubrc
    """

  Scenario: Install config file with custom name
    When I run `gcli init .custom-name`
    Then the output should contain:
      """
      Writing new configuration file to /tmp/fakehome/.custom-name
      """
