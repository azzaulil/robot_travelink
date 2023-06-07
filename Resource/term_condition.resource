*** Settings ***
Library    SeleniumLibrary  
Resource    variable.resource
Resource    login.resource
Resource    cart.resource

*** Keywords ***
Go to TnC
	Click Link		xpath=//a[@href="/termcondition"]
	Switch Window    NEW
	Element Text Should Be    tag:h3    Term Condition    timeout=5

Checking TnC page
    Run Keyword    Starting app
    Run Keyword    Login with valid account    ${username}    ${password}
	Run Keyword    Cart and checkout flow
	Run Keyword    Go to TnC