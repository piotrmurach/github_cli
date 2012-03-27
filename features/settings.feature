Feature: Global Settings

  As a developer who wants to set global settings for interaction with GitHub API
  When I use interface provided by GHC
  I have ability to create configuration file

  Scenario: Installs New Configuration File
    When I run `ghc init`

  Scenario: Configuration File Exists
    When I run `ghc init`

