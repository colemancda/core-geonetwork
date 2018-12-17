Feature: Workflow
 
 Scenario: Try to move through the workflow reviewing records, publishing and unpublishing.
        
        Given I navigate to "{endPointToTest}"
        
        # Login as reviewer
	      When I click on element having css "li.signin-dropdown"
        And I enter "reviewertest" into input field having xpath "//*[@id='inputUsername']"
        And I enter "editorpass" into input field having xpath "//*[@id='inputPassword']"
        And I click on element having css "form > button.btn-primary"
        And I wait 1 seconds for element having css "div.search-over" to display
        
        # Publish record       
        Given I navigate to "{endPointToTest}"
        Then I click on element having xpath "//*/div[contains(@class, 'active')]//*[contains(text(), 'Draft')]"
        And I wait 3 seconds for element having css "div div.md-actions i.fa-cog" to display
        Then I click on element having css "div div.md-actions i.fa-cog"
        Then I click on element having css "div.btn-group.md-actions.open > ul > li > a[data-ng-click] > i.fa-unlock"
        Then I wait 3 seconds for element having css "div.alert-success" to display
                
        # Logout  
        And I wait 5 seconds for element having css ".gn-user-info" to display
        When I hover over element having css ".gn-user-info"  
        Then I wait 1 seconds for element having css ".fa-sign-out" to display
        Then I click on element having css ".fa-sign-out"
	      Then I wait 3 seconds for element having css "li.signin-dropdown" to display
        
        # Login as Editor
	      When I click on element having css "li.signin-dropdown"
        And I enter "editortest" into input field having xpath "//*[@id='inputUsername']"
        And I enter "editorpass" into input field having xpath "//*[@id='inputPassword']"
        And I click on element having css "form > button.btn-primary"
        And I wait 1 seconds for element having css "div.search-over" to display
        
        # Edit record named "Draft" and name the editing instance as "Workflow 1"   
        Given I navigate to "{endPointToTest}"
        Then I click on element having xpath "//*/div[contains(@class, 'active')]//*[contains(text(), 'Draft')]"
        And I wait 3 seconds for element having css "div.gn-md-view div.btn-toolbar i.fa-pencil" to display
        Then I click on element having css "div.gn-md-view div.btn-toolbar i.fa-pencil"
        And I wait 6 seconds for element having css "div.gn-title" to display
        Then I clear input field having css "div.gn-title input"
        Then I enter "Workflow 1" into input field having css "div.gn-title input"
        Then I click on element having css "button.btn-default > i.fa-sign-out"
        And I wait for 1 sec
                
        # Logout  
        And I wait 5 seconds for element having css ".gn-user-info" to display
        When I hover over element having css ".gn-user-info"  
        Then I wait 1 seconds for element having css ".fa-sign-out" to display
        Then I click on element having css ".fa-sign-out"
	      Then I wait 3 seconds for element having css "li.signin-dropdown" to display
        
        #Check "Draft" is still visible to anonymous users
        Given I navigate to "{endPointToTest}"
        Then I click on element having xpath "//*/div[contains(@class, 'active')]//*[contains(text(), 'Draft')]"
        
        # Login as Editor
	      When I click on element having css "li.signin-dropdown"
        And I enter "editortest" into input field having xpath "//*[@id='inputUsername']"
        And I enter "editorpass" into input field having xpath "//*[@id='inputPassword']"
        And I click on element having css "form > button.btn-primary"
        And I wait 1 seconds for element having css "div.search-over" to display
                
        # Change status to SUBMITTED
        Given I navigate to "{endPointToTest}"
        Then I click on element having xpath "//*/div[contains(@class, 'active')]//*[contains(text(), 'Draft')]"  
        And I wait 3 seconds for element having css "div.gn-search-page div:nth-child(4) .see-draft.see-draft-not-approved" to display
        Then I click on element having css "div.gn-search-page div:nth-child(4) .see-draft.see-draft-not-approved"     
        Then I wait 3 seconds for element having css "div.gn-search-page div:nth-child(5) div.btn-group.md-actions i.fa-cog" to display
        Then I click on element having css "div.gn-search-page div:nth-child(5) div.btn-group.md-actions i.fa-cog"
        Then I click on element having css "div.btn-group.md-actions.open > ul > li > a[data-ng-click] > i.fa-code-fork"
        Then I wait 3 seconds for element having xpath "//form[@data-gn-metadata-status-updater]//input[@value=2]" to display
        Then I wait for 1 sec
        Then I click on element having xpath "//form[@data-gn-metadata-status-updater]//input[@value=4]"
        Then I click on element having xpath "//form[@data-gn-metadata-status-updater]//button[@data-gn-click-and-spin]"
        Then I wait 3 seconds for element having css "div.alert-success" to display
        
        # Check I can navigate from approved instance to editing instance (draft)
        Given I navigate to "{endPointToTest}"
        Then I click on element having xpath "//*/div[contains(@class, 'active')]//*[contains(text(), 'Draft')]"      
        And I wait 3 seconds for element having css "div.gn-search-page div:nth-child(4) .see-draft.see-draft-not-approved" to display
        Then I click on element having css "div.gn-search-page div:nth-child(4) .see-draft.see-draft-not-approved"  
        And I wait 2 seconds for element having css "div.gn-search-page div:nth-child(5) .see-draft.see-draft-approved" to display
        Then I click on element having css "div.gn-search-page div:nth-child(5) .see-draft.see-draft-approved"
        And I wait 1 seconds for element having css "div.gn-search-page div:nth-child(4) .see-draft.see-draft-not-approved" to display
        Then I click on element having css "div.gn-search-page div:nth-child(4) .see-draft.see-draft-not-approved"
                
        # Logout  
        When I hover over element having css ".gn-user-info"  
        Then I wait 1 seconds for element having css ".fa-sign-out" to display
        Then I click on element having css ".fa-sign-out"
	      Then I wait 1 seconds for element having css "li.signin-dropdown" to display
        
        #Check "Draft" is still visible to anonymous users
        Given I navigate to "{endPointToTest}"
        Then I click on element having xpath "//*/div[contains(@class, 'active')]//*[contains(text(), 'Draft')]"
	      
        # Login as Reviewer
	      When I click on element having css "li.signin-dropdown"
        And I enter "reviewertest" into input field having xpath "//*[@id='inputUsername']"
        And I enter "editorpass" into input field having xpath "//*[@id='inputPassword']"
        And I click on element having css "form > button.btn-primary"
        And I wait 1 seconds for element having css "div.search-over" to display
                
        # Change status to APPROVED
        Given I navigate to "{endPointToTest}"
        Then I click on element having xpath "//*/div[contains(@class, 'active')]//*[contains(text(), 'Draft')]"      
        And I wait 3 seconds for element having css "div.gn-search-page div:nth-child(4) .see-draft.see-draft-not-approved" to display
        Then I click on element having css "div.gn-search-page div:nth-child(4) .see-draft.see-draft-not-approved"    
        Then I wait 3 seconds for element having css "div.gn-search-page div:nth-child(5) div.btn-group.md-actions i.fa-cog" to display
        Then I click on element having css "div.gn-search-page div:nth-child(5) div.btn-group.md-actions i.fa-cog"
        Then I click on element having css "div.btn-group.md-actions.open > ul > li > a[data-ng-click] > i.fa-code-fork"
        Then I wait 3 seconds for element having xpath "//form[@data-gn-metadata-status-updater]//input[@value=2]" to display
        Then I wait for 1 sec
        Then I click on element having xpath "//form[@data-gn-metadata-status-updater]//input[@value=2]"
        Then I click on element having xpath "//form[@data-gn-metadata-status-updater]//button[@data-gn-click-and-spin]"
        Then I wait 3 seconds for element having css "div.alert-success" to display
                
        # Logout  
        And I wait 5 seconds for element having css ".gn-user-info" to display
        When I hover over element having css ".gn-user-info"  
        Then I wait 1 seconds for element having css ".fa-sign-out" to display
        Then I click on element having css ".fa-sign-out"
	      Then I wait 3 seconds for element having css "li.signin-dropdown" to display
        
        #Check "Workflow 1" is visible to anonymous users
        Given I navigate to "{endPointToTest}"
        Then I click on element having xpath "//*/div[contains(@class, 'active')]//*[contains(text(), 'Workflow 1')]"
	      
        # Login as Reviewer
	      When I click on element having css "li.signin-dropdown"
        And I enter "reviewertest" into input field having xpath "//*[@id='inputUsername']"
        And I enter "editorpass" into input field having xpath "//*[@id='inputPassword']"
        And I click on element having css "form > button.btn-primary"
        And I wait 1 seconds for element having css "div.search-over" to display
                
        # Change status to RETIRED
        Then I click on element having xpath "//*/div[contains(@class, 'active')]//*[contains(text(), 'Workflow 1')]"      
        Then I wait 3 seconds for element having css "div.gn-search-page div.btn-group.md-actions i.fa-cog" to display
        Then I click on element having css "div.gn-search-page div.btn-group.md-actions i.fa-cog"
        Then I click on element having css "div.btn-group.md-actions.open > ul > li > a[data-ng-click] > i.fa-code-fork"
        Then I wait 3 seconds for element having xpath "//form[@data-gn-metadata-status-updater]//input[@value=3]" to display
        Then I wait for 1 sec
        Then I click on element having xpath "//form[@data-gn-metadata-status-updater]//input[@value=3]"
        Then I click on element having xpath "//form[@data-gn-metadata-status-updater]//button[@data-gn-click-and-spin]"
        Then I wait 3 seconds for element having css "div.alert-success" to display
                
        # Logout  
        And I wait 5 seconds for element having css ".gn-user-info" to display
        When I hover over element having css ".gn-user-info"  
        Then I wait 1 seconds for element having css ".fa-sign-out" to display
        Then I click on element having css ".fa-sign-out"
	      Then I wait 3 seconds for element having css "li.signin-dropdown" to display
        
        #Check "Workflow 1" is visible to anonymous users
        Given I navigate to "{endPointToTest}"
        Then I click on element having xpath "//*/div[contains(@class, 'active')]//*[contains(text(), 'Workflow 1')]"
        
        # Login as reviewer
	      When I click on element having css "li.signin-dropdown"
        And I enter "reviewertest" into input field having xpath "//*[@id='inputUsername']"
        And I enter "editorpass" into input field having xpath "//*[@id='inputPassword']"
        And I click on element having css "form > button.btn-primary"
        And I wait 1 seconds for element having css "div.search-over" to display
        
        # Unpublish record       
        Given I navigate to "{endPointToTest}"
        Then I click on element having xpath "//*/div[contains(@class, 'active')]//*[contains(text(), 'Workflow 1')]"
        And I wait 3 seconds for element having css "div div.md-actions i.fa-cog" to display
        Then I click on element having css "div div.md-actions i.fa-cog"
        Then I click on element having css "div.btn-group.md-actions.open > ul > li > a[data-ng-click] > i.fa-lock"
        Then I wait 3 seconds for element having css "div.alert-success" to display
                
        # Logout as reviewer  
        And I wait 5 seconds for element having css ".gn-user-info" to display
        When I hover over element having css ".gn-user-info"  
        Then I wait 1 seconds for element having css ".fa-sign-out" to display
        Then I click on element having css ".fa-sign-out"
	      Then I wait 3 seconds for element having css "li.signin-dropdown" to display
        
        # Check Workflow 1 is no longer visible to anonymous users
        # This checks there is no metadata published, not even the previous versions of this record
        # If previous tests are modified and publish something, this will fail
        Given I navigate to "{endPointToTest}"
        And I wait 5 seconds for element having css ".alert-warning" to display
