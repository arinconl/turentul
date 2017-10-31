Feature: User can check bike out
  
Scenario: Check bike out
    Given I am on the bikes page
    When I follow "A1002"
    Then I should be on the Bike A1002 page
    When I follow “Check out”
    Then I should be on the receipt page
    And I should see “Bike successfully checked out!”