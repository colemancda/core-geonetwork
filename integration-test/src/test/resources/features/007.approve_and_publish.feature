Feature: Approve and Publish
        Given the previous draft, check that publishing works
 
 Scenario: When trying to edit the previously approved record, a draft is created and is visible to all editors in that group
        
        Given I navigate to "{endPointToTest}"
        
        # Login as reviewer
	      When I click on element having css "li.signin-dropdown"
        And I enter "reviewertest" into input field having xpath "//*[@id='inputUsername']"
        And I enter "editorpass" into input field having xpath "//*[@id='inputPassword']"
        And I click on element having css "form > button.btn-primary"
        And I wait 1 seconds for element having css "div.search-over" to display
        
        # Publish record       
        Given I navigate to "{endPointToTest}"
        Then I click on element having xpath "//*/div[contains(@class, 'active')]//*[contains(text(), 'Metadata')]"
        And I wait 3 seconds for element having css "div div.md-actions i.fa-cog" to display
        Then I click on element having css "div div.md-actions i.fa-cog"
        Then I click on element having css "div.btn-group.md-actions.open > ul > li > a[data-ng-click] > i.fa-unlock"
        Then I accept alert
        Then I wait 3 seconds for element having css "div.alert-success" to display
                
        # Logout as reviewer  
        And I wait 5 seconds for element having css ".gn-user-info" to display
        When I hover over element having css ".gn-user-info"  
        Then I wait 1 seconds for element having css ".fa-sign-out" to display
        Then I click on element having css ".fa-sign-out"
	      Then I wait 3 seconds for element having css "li.signin-dropdown" to display
        
        #Check draft is visible
        Given I navigate to "{endPointToTest}/srv/eng/catalog.search#/search"
        Then I click on link having text "Draft"
        
        # Login as reviewer
	      When I click on element having css "li.signin-dropdown"
        And I enter "reviewertest" into input field having xpath "//*[@id='inputUsername']"
        And I enter "editorpass" into input field having xpath "//*[@id='inputPassword']"
        And I click on element having css "form > button.btn-primary"
        And I wait 1 seconds for element having css "div.search-over" to display
        
        # Unpublish record       
        Given I navigate to "{endPointToTest}"
        Then I click on element having xpath "//*/div[contains(@class, 'active')]//*[contains(text(), 'Draft')]"
        And I wait 3 seconds for element having css "div div.md-actions i.fa-cog" to display
        Then I click on element having css "div div.md-actions i.fa-cog"
        Then I click on element having css "div.btn-group.md-actions.open > ul > li > a[data-ng-click] > i.fa-lock"
        Then I accept alert
        Then I wait 3 seconds for element having css "div.alert-success" to display
                
        # Logout as reviewer  
        And I wait 5 seconds for element having css ".gn-user-info" to display
        When I hover over element having css ".gn-user-info"  
        Then I wait 1 seconds for element having css ".fa-sign-out" to display
        Then I click on element having css ".fa-sign-out"
	      Then I wait 3 seconds for element having css "li.signin-dropdown" to display
        
