Feature: Batch Management
As an Administrator
In order to distribute beer
I need to be able to keep track of my batches



Background:
Given there is an account with login "moonshine"
And there is a brewery named "stumpy dog brewery" with 3 beer styles
When I go to the admin index page
Given I am logged in as "moonshine"
Then I should be on the admin index page

@wips
Scenario: Adding a new batch
  Then I should see "Add New Batch"
  When I follow "Add New Batch"
  Then I should be on the new batch page
  And I should see "Add New Batch"
  When I fill in the following:
      | Volume         | 10 gallons |
      | Recipe         | good hops and stuff   |
#  When I select "April 26, 1982" as the "Brewed at" date
#  When I select "April 26, 1983" as the "Ready at" date
  And I select the second style
  And I press "Create"
  Then I should be on the show page for the new batch
  Then I should see "Style 1"

