Feature: gcli auth

  @ci-run
  Scenario: Available commands

    When I run `gcli auth`
    Then the exit status should be 0
      And the output should contain "auth list"
      And the output should contain "auth get"
      And the output should contain "auth create"
      And the output should contain "auth update"
      And the output should contain "auth delete"

  Scenario: List authorizations
    Given the Github API server:
    """
    get('/authorizations') { status 200 }
    """
    When I run `gcli auth ls --login=piotr --password=secret`
    Then the exit status should be 0

  Scenario: Get authorization
    Given the Github API server:
    """
    get('/authorizations/1') { status 200 }
    """
    When I run `gcli auth get 1 --login=piotr --password=secret`
    Then the exit status should be 0

  Scenario: Create authorization
    Given the Github API server:
    """
    post('/authorizations') { status 200 }
    """
    When I run `gcli auth create --scopes=repo --login=piotr --password=secret`
    Then the exit status should be 0

  Scenario: Update authorization
    Given the Github API server:
    """
    patch('/authorizations/1') { status 200 }
    """
    When I run `gcli auth update 1 --scopes=repo --login=piotr --password=secret`
    Then the exit status should be 0

  Scenario: Delete authorization
    Given the Github API server:
    """
    delete('/authorizations/1') { status 200 }
    """
    When I run `gcli auth delete 1 --login=piotr --password=secret`
    Then the exit status should be 0

