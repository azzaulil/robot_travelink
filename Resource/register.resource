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

Register with empty mandatory
    Click Element    //input[@id='email']
    Click Element    //input[@id='phone_no']
	Wait Until Page contains    Kolom ini harus diisi
	Element Should Be Disabled	xpath=//button[@type="submit"]
	Sleep  2s

Validate invalid format email
	Input Text    //input[@id='email']     tester
	Wait Until Page contains    Email ini tidak valid
	Input Text    //input[@id='email']     tester@gmail.commercil
	Wait Until Page contains    Email ini tidak valid

Validate invalid number phone
	Input Text    //input[@id='phone_no']     nomor
	Wait Until Page contains    Kolom ini hanya bisa diisi dengan angka
	Input Text    //input[@id='phone_no']     +62
	Wait Until Page contains    Kolom ini hanya bisa diisi dengan angka

Validate invalid PIN format
	Input Text    //input[@id='password']     asdfg
	Wait Until Page contains    Password minimal 6 dan maximal 6 karakter hanya angka
	Input Text    //input[@id='password']     !@#$%
	Wait Until Page contains    Password minimal 6 dan maximal 6 karakter hanya angka

Validate the number of PIN char
	Input Text    //input[@id='password']     12345
	Wait Until Page contains    Password minimal 6 dan maximal 6 karakter hanya angka
	Input Text    //input[@id='password']     1234567
	Wait Until Page contains    Password minimal 6 dan maximal 6 karakter hanya angka

Validate unmatch confirm password
	Input Text    //input[@id='password']     123456
	Input Text    //input[@id='confirm_password']     654321
	Wait Until Page contains    PIN tidak sama

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
	Sleep    2s
	Click Button    //div[@class='py-5 border-b-2 text-center relative']/button    #closed_btn

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
	Wait Until Element Is Visible    xpath=//p[contains(., "Registrasi berhasil!")]    timeout=10s
	Capture Page Screenshot    filename=${current test result path}/regist.png
    File Should Exist    ${current test result path}/regist.png
	Sleep    3s

Validating register link on login form
    Click Element    xpath=//button[contains(text(), "Daftar")]
	
Register with Google
    Click Button    google-signin-btn-0
	${handles}=  Get Window Handles
	Switch Window   ${handles}[1]
	Sleep    3s
	Input Text    //input[@type="email"]    fahminur3031@gmail.com
	Click Button    //div[@id="identifierNext"]//button
	Sleep    3s
	Click Element    //a[@aria-label="Try again"]
	Wait Until Element Is Visible    //input[@type="password"]    timeout=30s
	Input Text    //input[@type="password"]    
	Click Button    //div[@id="passwordNext"]//button
	Sleep    5s
