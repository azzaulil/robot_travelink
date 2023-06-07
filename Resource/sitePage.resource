*** Settings ***
Library    SeleniumLibrary
Resource    variable.resource

*** Keywords ***
Link to home
	Scroll Element Into View	xpath=//body[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/a[1]/h2[2]
	Scroll Element Into View	xpath=//body[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/a[1]/div[1]/img[1]
	Sleep	2s
	Click Element	xpath=//body[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/a[1]/div[1]/img[1]
	Sleep	3s
	Scroll Element Into View	xpath=//body[1]/div[1]/div[1]/div[1]/div[1]/div[1]/a[1]/font[1]
	Sleep	3s
	# Site Page
	Click Element 	xpath=//body[1]/div[1]/div[1]/div[1]/div[1]/div[1]/a[1]/font[1]
	Sleep	3s
	Scroll Element Into View	xpath=//body[1]/div[1]/div[1]/div[1]/nav[1]/a[1]/img[1]
	Sleep	1s
	Click Element 	xpath=//div[@class="vs-select-content"]
	Wait Until Element Is Visible	//div[@class='vs-select__options']
	Click Element    xpath=//body/div[2]/div[1]/div[1]/button[1]
	Sleep	1s
	Click Button    //button[@class='bg-mainGreen text-white rounded-full w-full h-full text-lg font-semibold hover:bg-lime-600']
	Sleep 	3s
	# 	Cluster Page
	Scroll Element Into View	xpath=//body[1]/div[1]/div[1]/div[1]/div[1]/div[1]/a[1]/font[1]
	Sleep	3s
	Click Element	xpath=//body[1]/div[1]/div[1]/div[1]/div[1]/div[1]/a[1]/font[1]
