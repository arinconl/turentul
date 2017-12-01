Feature: User can get a ticket and return it after checking out a bike
  
Scenario: Try to get ticket when not logged in (Sad Path)
  Given I am on the home page
  When I follow "Bikes"
  Then I should be on the bikes page
  When I follow "A1000"
  Then I should be on the A1000 page
  When I click on "switchAvailability"
  Then I should be on the login page

Scenario: Getting a tickets when logged in, and then returning ticket (Happy Path)
  Given I am on the home page
  Given I am signed in
  Then I should be logged in
  Then I should be on the login page
  When I follow "Bikes"
  Then I should be on the bikes page
  When I follow "A1000"
  Then I should be on the A1000 page
  When I click on "switchAvailability"
  Then I should be on the A1000 ticket page
  When I follow "Bikes"
  Then I should be on the bikes page
  When I click on "Check In"
  Then I should be on the A1000 ticket page
  
  