*** Settings ***
Library    SeleniumLibrary
Library    XML
Resource    variable.resource

*** Keywords ***
Validate success send email forgot
	Input Text    email    ${email_exist}
	Click Button    //button[@type="submit"]
	Wait Until Element Is Visible    xpath=//p[contains(., "Berhasil")]

Validate invalid email forgot
	Input Text    email     tester
	Wait Until Page contains    Kolom ini harus diisi email yang valid
	Press Keys    email    CTRL+a+BACKSPACE
	Input Text    email     tester@gmail
	Wait Until Page contains    Kolom ini harus diisi email yang valid
	Press Keys    email    CTRL+a+BACKSPACE

Validate unregistered email
    Wait Until Element Is Enabled    xpath=//button[contains(text(), "Lupa Password ?")]
    Click Element    xpath=//button[contains(text(), "Lupa Password ?")]
    Wait Until Page Contains    Lupa Password
	Input Text    email     tester@gmail.com
	Sleep    2
	Click Button    //button[@type="submit"]
	Wait Until Element Is Visible    xpath=//p[contains(., "E-mail tidak terdaftar")]    timeout=10s
	Press Keys    email    CTRL+a+BACKSPACE
	Sleep    2

    
    