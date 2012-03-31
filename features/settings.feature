@settings
Feature: Global Settings

  As a developer who wants to set global settings for interaction with GitHub API
  When I use interface provided by GHC
  I have ability to create configuration file

  Scenario: Installs Default Configuration File
    When I run `ghc init` interactively
      And I type "token"
    Then the output should contain:
    """
    Writing new configuration file to /tmp/fakehome/.githubrc
    """
    And a file named "/tmp/fakehome/.githubrc" should exist
    And the file "/tmp/fakehome/.githubrc" should contain "oauth_token: token"

  Scenario: Configuration File Exists
    Given an empty file named "/tmp/fakehome/.githubrc"
    When I run `ghc init`
    Then the output should contain:
    """
    Not overwritting existing config file /tmp/fakehome/.githubrc, use --force to override.
    """

  Scenario: Force Config File Override
    Given an empty file named "/tmp/fakehome/.githubrc"
    When I run `ghc init --force` interactively
      And I type "token"
    Then the output should contain:
    """
    Please specify your GitHub Authentication Token (register on github.com to get it):
    """

  Scenario: Installs Custom Configuration File
    When I run `ghc init myname` interactively
      And I type "token"
    Then a file named "/tmp/fakehome/myname" should exist
    And the output should contain:
    """
    Writing new configuration file to /tmp/fakehome/myname
    """


  Scenario: Check for presence of yaml attribute
