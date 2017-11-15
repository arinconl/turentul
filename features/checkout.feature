Feature: User can check bike out
  
  # Cucumber uses regex to match the text to methods
  # Methods are created in web_steps.rb
  # It is recommended that you create your own web_steps and not use the built in ones
  # because it's very hard to have the build in ones work
  
Scenario: Check bike out when not logged in (Sad Path)
    Given I am on the home page
    When I follow "Bikes"
    Then I should be on the bikes page
    When I click on "A1000"
    Then I should be on the A1000 page
    When I click on "switchAvailability"
    Then I should be on the login page

Scenario: Check bike out when logged in (Happy Path)
    Given I am on the home page
    # Signs in a fake user to test out logged_in features
    Given I am signed in
    Then I should be logged in
    Then I should be on the login page
    When I follow "Bikes"
    Then I should be on the bikes page
    When I click on "A1000"
    Then I should be on the A1000 page
    When I click on "switchAvailability"
    Then I should be on the A1000 page