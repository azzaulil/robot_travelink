*** Settings ***
Library    SeleniumLibrary  
Resource    variable.resource

*** Keywords ***
Go to Login Page
    Click Button    ${profile_btn}
    Click Element    xpath=//button[contains(text(), "Masuk")]
	Sleep    3
	Wait Until Element Is Visible    xpath=//h4[contains(., "Masuk Akun")]
	Sleep    3

Check Link Register on Login Modal
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

Login with Unregistered Account
    Sleep    3s
    Input Text    username    ${unregistered}
    Sleep    3s
    Click Button    //button[@type='submit']
    Wait Until Element Is Visible    xpath=//p[contains(., "Email belum terdaftar, silakan melanjutkan pendaftaran")]
	Wait Until Element Is Visible    xpath=//h4[contains(., "Daftar Akun")]
    Click Button    //div[@class='py-5 border-b-2 text-center relative']/button
    Sleep    3s

Login with Invalid PIN
    Sleep    3s
    Input Text    username    ${username}
    Sleep    3s
    Click Button    //button[@type='submit']
    Sleep   5s
    Input Text    password    ${wrong_password}
    Sleep    3s
    Click Button    //button[@type='submit']
    Wait Until Element Is Visible    xpath=//p[contains(., "Password yang Anda masukkan tidak sesuai")]


Login with valid account
    [Arguments]    ${username}    ${password}
    # Run Keyword    Create directory test result
    # Directory Should Exist    ${current test result path} 
    Sleep    3s
    # Page Should Contain Element    //div[@data-modal='ModalLogin']
    Input Text    username    ${username}
    Sleep    3s
    Click Button    //button[@type='submit']
    Sleep    3s
    Wait Until Element Is Visible    //input[@id='password']    timeout=10s
    Input Text    password    ${password}
    Sleep    3s
    Click Button    //button[@type='submit']
    Sleep    5s
    # Wait Until Element Is Visible    xpath=//h4[contains(text(), "Berhasil")]
    # ${RANDOM INT}=    Evaluate    random.randint(1,10)    random
	# Capture Page Screenshot    filename=${current test result path}/login_${RANDOM INT}.png
    # File Should Exist    ${current test result path}/login_${RANDOM INT}.png

Logout
    Click Button    ${profile_btn}
    Sleep    3s
    Wait Until Element Is Visible    xpath=//button[contains(text(), "Keluar")]    timeout=10s
    Click Button    xpath=//button[contains(text(), "Keluar")]
    Wait Until Element Is Visible    xpath=//p[contains(., "Anda berhasil keluar")]
    Sleep    3s
    # ${cookies} =    Get Cookie   access-token
    # Should Be Equal    ${cookies}    ${EMPTY}