Feature: Batch Management
As an Administrator
In order to distribute beer
I need to be able to keep track of my batches



Background:
Given there is an account with login "moonshine"
And there is a brewery named "Stumpy Dog Brewery" with 3 beer styles
When I go to the admin index page
Given I am logged in as "moonshine"
Then I should be on the admin index page


Scenario: Adding a new batch from the admin index page
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

@wips
Scenario:  Admin wants to view batch information
  Given "Stumpy Dog Brewery: Style 1" has 3 batches
  When I go to the Stumpy Dog Brewery: Style 1 show page
  Then I should see the brewed_at date for all batches of Stumpy Dog Brewery: Style 1
  When I follow "02/03/2010"
  Then I should see "Brewed at"
  And I should see "02/03/2010"
  And I should see "Volume"
  And I should see "Recipe"
  And I should see "Ready at"
  When I follow "Back"
  Then I should be on the Stumpy Dog Brewery: Style 1 show page


