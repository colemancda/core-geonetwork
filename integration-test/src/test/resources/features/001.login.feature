Feature: GeoNetwork Login
        As a user I should able to login into GeoNetwork.
 
 Scenario: I login with valid credential
        Given I navigate to "{endPointToTest}"
        Then I wait 6 seconds for element having css "li.signin-dropdown" to display
        And I click on element having css "li.signin-dropdown"
        And I enter "{adminUser}" into input field having xpath "//*[@id='inputUsername']"
        And I enter "{adminPassword}" into input field having xpath "//*[@id='inputPassword']"
        And I click on element having css "form > button.btn-primary"
        Then I wait 1 seconds for element having css ".gn-user-info" to display
        And I hover over element having css ".gn-user-info"  
        When I click on element having css ".fa-sign-out"
