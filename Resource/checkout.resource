*** Settings ***
Library    SeleniumLibrary
Resource    variable.resource

*** Keywords ***
Go to Checkout Page
    Click Element    xpath=//body/div[@id='__nuxt']/div[@id='__layout']/div[1]/div[1]/div[1]/div[2]/div[2]/div[1]/button[2]
    Wait Until Element Is Visible    xpath=//h2[contains(text(), "Checkout")]    timeout=10s

Continue to Payment
    [Arguments]    ${payment_method}
    Scroll Element Into View    ${payment_method}
    Click Element    ${payment_method}
    Sleep    3
    Scroll Element Into View    xpath=//button[@type="button"]/p[contains(text(), "Lanjut Pembayaran")]
    Click Element    xpath=//input[@id='checkbox']
    Click Element    //button[@type="button"]/p[contains(text(), "Lanjut Pembayaran")]

