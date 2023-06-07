*** Settings ***
Library    SeleniumLibrary  
Resource    variable.resource

*** Keywords ***
Register with valid account
    [Arguments]    ${new_email}    
    Click Button    ${profile_btn}
    Click Element    xpath=//button[contains(text(), "Daftar")]
	# Click Element    xpath=/html[1]/body[1]/div[1]/div[1]/div[1]/nav[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/p[1]/button[1]
	Sleep    3
	Wait Until Element Is Visible    xpath=//h4[contains(., "Daftar Akun")]
	Sleep    3
	Wait Until Element Is Visible    //input[@id='email']
	Input Text    //input[@id='email']     ${new_email}
	Input Text    //input[@id='phone_no']     ${phone_no}
	Input Text    //input[@id='fullname']     ${fullname}
	# kewarganegaraan selection
	Click Element	//input[@class='vs__search']
	Input Text   //input[@class='vs__search']	${nationality}
	Press Keys		//input[@class='vs__search']	ENTER
	sleep  1s
	# Click Element	//input[@placeholder='Kota/Kabupaten']
	# Input Text   //input[@placeholder='Kota/Kabupaten']	${kota}
	# Press Keys		//input[@placeholder='Kota/Kabupaten']	ENTER
	##
	Input Text    //input[@id='password']     ${new_password}
	Input Text    //input[@id='confirm_password']     ${confirm_password}
	Click Button	xpath=//button[@type="submit"]
	sleep  2s

Register with Google
    Click Button    google-signin-btn-0
	Switch Window    locator=NEW
	Click Element    //*[contains(., "Azza Ulil")]
	Click Element    //*[@data-email="${email}"]

Register from login modal
    [Arguments]    ${new_email}
    # Click Button    ${profile_btn}
    # Click Element    xpath=//button[contains(text(), 'Masuk')]
    # Sleep    3s
    Page Should Contain Element    //div[@data-modal='ModalLogin']
    Input Text    username    ${new_email}
    # Sleep    3s
    Click Button    //button[@type='submit']
    Sleep    3s
	Input Text    //input[@id='phone_no']     ${phone_no}
	Input Text    //input[@id='fullname']     ${fullname}
	# kewarganegaraan selection
	Click Element	//input[@class='vs__search']
	Input Text   //input[@class='vs__search']	${nationality}
	Press Keys		//input[@class='vs__search']	ENTER
	sleep  1s
	Input Text    //input[@id='password']     ${new_password}
	Input Text    //input[@id='confirm_password']     ${confirm_password}
	sleep  2s
	Scroll Element Into View    xpath=//button[@type="submit"]
	Click Button	xpath=//button[@type="submit"]
	