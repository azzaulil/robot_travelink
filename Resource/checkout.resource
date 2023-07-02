*** Settings ***
Library    SeleniumLibrary
Resource    variable.resource

*** Keywords ***
Go to Checkout Page
    Click Element    xpath=//body/div[@id='__nuxt']/div[@id='__layout']/div[1]/div[1]/div[1]/div[2]/div[2]/div[1]/button[2]
    Wait Until Element Is Visible    xpath=//h2[contains(text(), "Checkout")]    timeout=10s
    Page Should Contain Element    xpath=//h2[contains(text(), "Checkout")]