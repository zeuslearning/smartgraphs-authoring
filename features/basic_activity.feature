Feature: Basic Activities
  In order to be productive
  An author
  Should create and list basic activities

  Scenario: Create an activity
    Given I am logged in as an admin named 'admin'
    And   I am on the Activities page
    When  I create a new activity:
      """
      --- 
      :name: Simple Activity
      :author_name: Mr. Author
      :pages:
      - :name: Simple Page 1
        :text: In this page...
      - :name: Simple Page 2
        :text: Now, in this other page...
      """
    Then I should get correct json

  Scenario: Listing activities
    Given I am logged in as an admin named 'admin'
    And   I am on the index page
    Then I should see a link to "activities" in the navigation

  Scenario: Listing my activities
    Given I am logged in as an admin named 'admin'
    And I am on the Activities page
    When  I create a new activity:
      """
      --- 
      :name: Simple Activity
      :author_name: Mr. Author
      :pages:
      - :name: Simple Page 1
        :text: In this page...
      - :name: Simple Page 2
        :text: Now, in this other page...
      """
    And I am on the index page
    Then I should see a link to "activities/my_activities" in the navigation
    When I am on My Activities page
    Then I should see "Simple Activity" in the listing