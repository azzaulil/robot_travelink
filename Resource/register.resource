*** Settings ***
Library    SeleniumLibrary  
Resource    variable.resource

*** Keywords ***
Go to Register Page
    Click Button    ${profile_btn}
    Click Element    xpath=//button[contains(text(), "Daftar")]
	Sleep    3
	Wait Until Element Is Visible    xpath=//h4[contains(., "Daftar Akun")]
	Sleep    3
	Wait Until Element Is Visible    //input[@id='email']

Register with valid account
    [Arguments]    ${new_email}
	Input Text    //input[@id='email']     ${new_email}
	Input Text    //input[@id='phone_no']     ${phone_no}
	Input Text    //input[@id='fullname']     ${fullname}
	### Kewarganegaraan Selection ###
	Click Element	//input[@class='vs__search']
	Input Text   //input[@class='vs__search']	${nationality}
	Press Keys		//input[@class='vs__search']	ENTER
	Sleep  1s
	Input Text    //input[@id='password']     ${new_password}
	Input Text    //input[@id='confirm_password']     ${confirm_password}
	Click Button	xpath=//button[@type="submit"]
	Sleep  2s

Register with Google
    Click Button    google-signin-btn-0
	Switch Window    locator=NEW
	Click Element    //*[contains(., "Azza Ulil")]
	Click Element    //*[@data-email="${email}"]

Register with registered email
	Input Text    //input[@id='email']     ${email_exist}
	Input Text    //input[@id='phone_no']     ${phone_no}
	Input Text    //input[@id='fullname']     ${fullname}
	### Kewarganegaraan Selection ###
	Click Element	//input[@class='vs__search']
	Input Text   //input[@class='vs__search']	${nationality}
	Press Keys		//input[@class='vs__search']	ENTER
	Sleep  1s
	Input Text    //input[@id='password']     ${new_password}
	Input Text    //input[@id='confirm_password']     ${confirm_password}
	Click Button	xpath=//button[@type="submit"]
	Sleep  2s
	Wait Until Element Is Visible    xpath=//p[contains(., "Email sudah digunakan")]
	
Register with empty mandatory
	Element Should Be Disabled	xpath=//button[@type="submit"]
	Sleep  2s
