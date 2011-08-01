Feature: Add New Code
  In order to add new code
  As anyone
  I want to be able to input code snippets and see the output

  Scenario: Add a new code snippet
    When I go to the new code page 
    Then I should see "Write new code here:"
    And I fill in the textarea with "1 + 1"
    And I press "Submit"
    Then I should see "queued"

