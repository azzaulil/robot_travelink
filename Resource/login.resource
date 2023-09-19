*** Settings ***
Library    SeleniumLibrary  
Library    XML
Resource    variable.resource

*** Keywords ***
Go to Login Page
    Click Button    ${profile_btn}
    Click Element    xpath=//button[contains(text(), "Masuk")]
	Wait Until Element Is Visible    xpath=//h4[contains(., "Masuk Akun")]
	Sleep    2s

Validate Unsuccessful Login for blank username
    Go to Login Page
    Click Element    username
    Click Button    //button[@type="submit"]
    Wait Until Page Contains    Kolom ini harus diisi
    Click Button    //div[@class='py-5 border-b-2 text-center']/button

Login with Unregistered Account
    Input Text    username    new_gmail_yahoo@gmail.com
    Click Button    //button[@type='submit']
    Wait Until Element Is Visible    xpath=//p[contains(., "Email belum terdaftar, silakan melanjutkan pendaftaran")]
	Wait Until Element Is Visible    xpath=//h4[contains(., "Daftar Akun")]
    Click Button    //div[@class='py-5 border-b-2 text-center relative']/button
    Click Button    //div[@class='py-5 border-b-2 text-center']/button

Login with Invalid PIN
    Go to Login Page
    Input Text    username    ${username}
    Sleep    3s
    Click Button    //button[@type='submit']
    Sleep   5s
    Input Text    password    ${wrong_password}
    Sleep    3s
    Click Button    //button[@type='submit']
    Wait Until Element Is Visible    xpath=//p[contains(., "Password yang Anda masukkan tidak sesuai")]
    Click Button    //div[@class='py-5 border-b-2 text-center']/button

Login with valid account
    [Arguments]    ${username}    ${password}
    Input Text    username    ${username}
    Click Button    //button[@type='submit']
    Wait Until Element Is Visible    //input[@id='password']    timeout=10s
    Input Text    password    ${password}
    Click Button    //button[@type='submit']
    Wait Until Element Is Visible    xpath=//p[contains(., "Anda berhasil masuk")]    timeout=10s
	Capture Page Screenshot    filename=${current test result path}/login.png
    File Should Exist    ${current test result path}/login.png

Logout
    Click Button    ${profile_btn}
    Sleep    3s
    Wait Until Element Is Visible    xpath=//button[contains(text(), "Keluar")]    timeout=10s
    Click Button    xpath=//button[contains(text(), "Keluar")]
    Wait Until Element Is Visible    xpath=//p[contains(., "Anda berhasil keluar")]
    # ${RANDOM INT}=    Evaluate    random.randint(1,10)    random
	Capture Page Screenshot    filename=${current test result path}/logout.png
    File Should Exist    ${current test result path}/logout.png
    Sleep    2s
    # ${cookies} =    Get Cookie   access-token
    # Should Be Equal    ${cookies}    ${EMPTY}

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