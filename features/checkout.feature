Feature: User can check bike out
  
Scenario: Check bike out when not logged in (Sad Path)
    Given I am on the home page
    When I follow "Rent a Bike"
    Then I should be on the bikes page
    When I click on "A1000"
    Then I should be on the A1000 page
    When I click on "switchAvailability"
    Then I should be on the login page

Scenario: Check bike out when logged in (Happy Path)
    Given I am on the home page
    Given I am signed in
    Then I should be logged in
    Then I should be on the login page
    When I follow "Rent a Bike"
    Then I should be on the bikes page
    When I click on "A1000"
    Then I should be on the A1000 page
    When I click on "switchAvailability"
    Then I should be on the A1000 ticket page