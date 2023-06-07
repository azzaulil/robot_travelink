*** Settings ***
Library    SeleniumLibrary  
Resource    variable.resource

*** Keywords ***
Check Link Register on Login Modal
    Click Button    ${profile_btn}
    Sleep    3s
    Wait Until Element Is Visible    xpath=//button[contains(text(), "Masuk")]    timeout=10s
    Sleep    3s
    Click Element    xpath=//button[contains(text(), "Masuk")]
    Sleep    3s
    Element Should Be Enabled    xpath=//button[contains(text(), "Daftar")]
    Click Element    xpath=//button[contains(text(), "Daftar")]
    Sleep    3s
    Click Button    //div[@class='py-5 border-b-2 text-center relative']/button
    Sleep    3s

Check Link Forgot Password on Login Modal
    Wait Until Element Is Enabled    xpath=//button[contains(text(), "Lupa Password ?")]
    Click Element    xpath=//button[contains(text(), "Lupa Password ?")]
    Sleep    3s
    Click Button    //div[@class='py-5 border-b-2 text-center']/button
    Sleep    3s

Login with valid account
    [Arguments]    ${username}    ${password}
    # Click Button    ${profile_btn}
    # Click Element    xpath=//button[contains(text(), 'Masuk')]
    Sleep    3s
    Page Should Contain Element    //div[@data-modal='ModalLogin']
    Input Text    username    ${username}
    Sleep    3s
    Click Button    //button[@type='submit']
    Sleep    3s
    Page Should Contain Element    //input[@id='password']
    Input Text    password    ${password}
    Sleep    3s
    Click Button    //button[@type='submit']
    Sleep    15
    Wait Until Element Is Visible    xpath=//a[@href='/cart']