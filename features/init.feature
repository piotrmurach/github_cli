@settings
Feature: Init command

  As a developer who wants to set global settings for interaction with GitHub API
  When I use interface provided by GHC
  I have ability to create configuration file

  Scenario: Init requires scope
    When I run `gcli init`
    Then the output should contain:
    """
    Invalid scope given. Please use --local or --global.
    """

  Scenario: Installs global config file
    When I run `gcli init --global` interactively
      And I type "token"
    Then the output should contain:
    """
    Writing new configuration file to /tmp/fakehome/.githubrc
    """
    And a file named "/tmp/fakehome/.githubrc" should exist
    And the file "/tmp/fakehome/.githubrc" should contain "auth.token: token"

  Scenario: Installs local config file
    Given a directory named "piotr"
    When I cd to "piotr"
      And I run `gcli init --local` interactively
      And I type "token"
    Then a file named ".githubrc" should exist
    And the file ".githubrc" should contain "auth.token: token"

  Scenario: Global config file arleady exists
    Given an empty file named "/tmp/fakehome/.githubrc"
    When I run `gcli init --global`
    Then the output should contain:
    """
    Not overwritting existing config file /tmp/fakehome/.githubrc, use --force to override.
    """

  Scenario: Force global config file override
    Given an empty file named "/tmp/fakehome/.githubrc"
    When I run `gcli init --global --force` interactively
      And I type "token"
    Then the output should contain:
    """
    Please specify your GitHub Authentication Token (register on github.com to get it):
    """
