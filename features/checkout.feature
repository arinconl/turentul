Feature: User can check bike out
  
Scenario: Check bike out
    Given I am on the home page
    When I follow "Bikes"
    Then I should be on the bikes page
    Then I should see "A1000" in the selector "a"
    When I follow "A1000"
    Then I should be on the Bike "A1002" page
    When I follow "Check out"
    Then I should be on the receipt page
    And I should see "Bike successfully checked out!"