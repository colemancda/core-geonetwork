Feature: Create Draft
        When trying to edit the published record, a draft is created
 
 Scenario: When trying to edit the published record, a draft is created
        Given I navigate to "{endPointToTest}"
        # Login as editor
        Then I wait 10 seconds for element having css "li.signin-dropdown" to display
	      When I click on element having css "li.signin-dropdown"
        And I enter "editortest" into input field having xpath "//*[@id='inputUsername']"
        And I enter "editorpass" into input field having xpath "//*[@id='inputPassword']"
        And I click on element having css "form > button.btn-primary"
        And I wait 1 seconds for element having css "div.search-over" to display
        
        # Edit approved record       
        When I navigate to "{endPointToTest}/srv/eng/catalog.edit#/board"
        Then I click on link having text "Metadata"
        And I wait 3 seconds for element having css "div.gn-search-page div:nth-child(4) i.fa-pencil" to display
        Then I click on element having css "div.gn-search-page div:nth-child(4) i.fa-pencil"
        And I wait 10 seconds for element having css "div.gn-title" to display
        Then I clear input field having css "div.gn-title input"
        Then I enter "Draft" into input field having css "div.gn-title input"
        Then I click on element having css "button.btn-default > i.fa-sign-out"
        And I wait for 1 sec
        
        #Check draft has been created
        When I navigate to "{endPointToTest}/srv/eng/catalog.search#/search"
        Then I click on link having text "Draft"
                
        # Logout as editor  
        And I wait 5 seconds for element having css ".gn-user-info" to display
        When I hover over element having css ".gn-user-info"  
        Then I wait 1 seconds for element having css ".fa-sign-out" to display
        Then I click on element having css ".fa-sign-out"
	      Then I wait 3 seconds for element having css "li.signin-dropdown" to display
        
