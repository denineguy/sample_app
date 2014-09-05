Feature: Signin in 

Scenario: Unsuccessful signin
  Given a user visits the signin page
  When they submit invald signin information
  Then they should see an error message

Scenario: Successful signin
  Given a user visits the signin page
    And they user has an account
    When the user submits valid signin information
    Then they should see their profile page
    And they should see a signout link
      