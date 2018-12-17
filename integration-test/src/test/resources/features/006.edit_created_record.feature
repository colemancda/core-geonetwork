Feature: Create Draft
        When trying to edit the previously approved record, a draft is created and is visible to all editors in that group
 
 Scenario: When trying to edit the previously approved record, a draft is created and is visible to all editors in that group
        Given I navigate to "{endPointToTest}"
        # Login as editor
        Then I wait 10 seconds for element having css "li.signin-dropdown" to display
	      When I click on element having css "li.signin-dropdown"
        And I enter "editortest" into input field having xpath "//*[@id='inputUsername']"
        And I enter "editorpass" into input field having xpath "//*[@id='inputPassword']"
        And I click on element having css "form > button.btn-primary"
        And I wait 1 seconds for element having css ".gn-user-info" to display
        
        # Edit approved record       
        When I navigate to "{endPointToTest}/srv/eng/catalog.edit#/board"
        Then I click on link having text "Metadata"
        And I wait 3 seconds for element having css "div.gn-md-view div.btn-toolbar i.fa-pencil" to display
        Then I click on element having css "div.gn-md-view div.btn-toolbar i.fa-pencil"
        And I wait 6 seconds for element having css "div.gn-title" to display
        Then I clear input field having css "div.gn-title input"
        Then I enter "Draft" into input field having css "div.gn-title input"
        Then I click on element having css "button.btn-default > i.fa-sign-out"
        And I wait for 1 sec
        
        #Check draft has been created
        When I navigate to "{endPointToTest}/srv/eng/catalog.search#/search"
        Then I click on link having text "Metadata"
        And I wait 3 seconds for element having css ".see-draft.see-draft-not-approved" to display
                
        # Logout as editor  
        And I wait 5 seconds for element having css ".gn-user-info" to display
        When I hover over element having css ".gn-user-info"  
        Then I wait 1 seconds for element having css ".fa-sign-out" to display
        Then I click on element having css ".fa-sign-out"
	      Then I wait 3 seconds for element having css "li.signin-dropdown" to display
	      
        # Login as editor2
	      Then I click on element having css "li.signin-dropdown"
        And I enter "editortest2" into input field having xpath "//*[@id='inputUsername']"
        And I enter "editorpass" into input field having xpath "//*[@id='inputPassword']"
        And I click on element having css "form > button.btn-primary"
        And I wait 1 seconds for element having css ".gn-user-info" to display
        
        #Check draft is visible to this editor
        When I navigate to "{endPointToTest}/srv/eng/catalog.search#/search"
        Then I click on link having text "Metadata"
        And I wait 3 seconds for element having css ".see-draft.see-draft-not-approved" to display
        Then I click on element having css ".see-draft"
                
        # Logout as editor2  
        And I wait 5 seconds for element having css ".gn-user-info" to display
        When I hover over element having css ".gn-user-info"  
        Then I wait 1 seconds for element having css ".fa-sign-out" to display
        Then I click on element having css ".fa-sign-out"
                
        
