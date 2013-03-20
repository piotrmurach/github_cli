Feature: gcli blob

  @ci-run
  Scenario: Available commands

    When I run `gcli blob`
    Then the exit status should be 0
      And the output should contain "gcli blob get"
      And the output should contain "gcli blob create"

  Scenario: Get blob
    Given the GitHub API server:
    """
    get('/repos/wycats/thor/git/blobs/59b23de9b91d') { status 200 }
    """
    When I run `gcli blob get wycats thor 59b23de9b91d`
    Then the exit status should be 0

  Scenario: Create blob
    Given the GitHub API server:
    """
    post('/repos/wycats/thor/git/blobs') { status 200 }
    """
    When I run `gcli blob create wycats thor --params=content:'Content' encoding:'utf-8'`
    Then the exit status should be 0
