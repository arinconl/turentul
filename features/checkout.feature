Feature: User can check bike out
  
Scenario: Check bike out
    Given I am on the show page for a bike
    When I follow “Check out”
    Then I should be on the receipt page
    And I should see “Bike successfully checked out!”