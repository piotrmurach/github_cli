@repositories
Feature: Repository Commands

  As a developer who wants to interact with GitHub Repository API
  I have access to commands

  Scenario: List repositories
    When I run `ghc repo ls --user=wycats`
    Then the exit status should be 0
