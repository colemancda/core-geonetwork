Feature: Create and publish record
        An editor creates and a reviewer approves a record
 
 Scenario: Editor creates and a reviewer approves a record
        # Login as editor
        When I navigate to "{endPointToTest}"
        And I wait 10 seconds for element having css "li.signin-dropdown" to display
	      Then I click on element having css "li.signin-dropdown"
        And I enter "editortest" into input field having xpath "//*[@id='inputUsername']"
        And I enter "editorpass" into input field having xpath "//*[@id='inputPassword']"
        And I click on element having css "form > button.btn-primary"
        And I wait 1 seconds for element having css "div.search-over" to display
        
        # Create new record
        When I navigate to "{endPointToTest}/srv/eng/catalog.edit#/create"
        Then I click on link having partial text "preferred!"
        And I wait 10 seconds for element having css "div.btn-group > button.btn-success" to display
        Then I click on element having css "div.btn-group > button.btn-success"
        And I wait 10 seconds for element having css "div.gn-title" to display
        Then I clear input field having css "div.gn-title input"
        Then I enter "Metadata" into input field having css "div.gn-title input"
        Then I click on element having css "button.btn-default > i.fa-sign-out"
        Then I wait 10 seconds for element having css ".fa-file-text" to display
              
        # Add privileges to group for edit
        Given I navigate to "{endPointToTest}"
        Then I click on element having xpath "//*/div[contains(@class, 'active')]//*[contains(text(), 'Template for Vector data')]"
        And I wait 3 seconds for element having css "div:nth-child(4) div.md-actions i.fa-cog" to display
        Then I click on element having css "div:nth-child(4) div.md-actions i.fa-cog"
        And I wait 3 seconds for element having css "div.btn-group.md-actions.open  i.fa-key" to display
        Then I click on element having css "div.btn-group.md-actions.open  i.fa-key"
        Then I wait 1 seconds for element having xpath "//*[@id="opsForm"]/table/tbody/tr[4]/td[5]/input" to display
        Then I click on element having xpath "//*[@id="opsForm"]/table/tbody/tr[4]/td[5]/input"
        And I wait 1 seconds for element having css "button.btn-primary>i.fa-eraser" to display
        Then I click on element having css "button.btn-primary>i.fa-eraser"
        Then I wait 3 seconds for element having css "div.alert-success" to display
        Then I click on element having css "div.modal.fade.in div.modal-header > button"
        
        # Logout as editor
        When I hover over element having css ".gn-user-info"  
        Then I wait 1 seconds for element having css ".fa-sign-out" to display
        Then I click on element having css ".fa-sign-out"
        
        # Login as reviewer
	      When I click on element having css "li.signin-dropdown"
        And I enter "reviewertest" into input field having xpath "//*[@id='inputUsername']"
        And I enter "editorpass" into input field having xpath "//*[@id='inputPassword']"
        And I click on element having css "form > button.btn-primary"
        And I wait 1 seconds for element having css "div.search-over" to display
        
        # Approve record
        Given I navigate to "{endPointToTest}"
        Then I click on element having xpath "//*/div[contains(@class, 'active')]//*[contains(text(), 'Template for Vector data')]"
        And I wait 3 seconds for element having css "div:nth-child(4) div.md-actions i.fa-cog" to display
        Then I click on element having css "div:nth-child(4) div.md-actions i.fa-cog"
        And I wait 3 seconds for element having css "div.btn-group.md-actions.open  i.fa-bell" to display
        Then I click on element having css "div.btn-group.md-actions.open  i.fa-bell"
        Then I wait 3 seconds for element having css ".modal.fade.in .modal-body div:nth-child(4) > label > input" to display
        Then I wait for 1 sec
        Then I click on element having css ".modal.fade.in .modal-body div:nth-child(4) > label > input"
        Then I click on element having css ".modal-body .btn-default i.fa-bell"
        Then I click on element having css "div.modal.fade.in div.modal-header > button"
        
        # Logout editor
        When I hover over element having css ".gn-user-info"  
        Then I wait 1 seconds for element having css ".fa-sign-out" to display
        Then I click on element having css ".fa-sign-out"
	      And I wait 3 seconds for element having css "li.signin-dropdown" to display
