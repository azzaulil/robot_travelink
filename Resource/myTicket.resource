*** Settings ***
Library    SeleniumLibrary
Resource    variable.resource

*** Keywords ***
Go to My Tiket menu
	Click Button    ${profile_btn}
	Click Element    xpath=//a[contains(text(), "Tiket Saya")]
	Wait Until Element Is Visible    //h1[contains(text(), 'Tiket Saya')]
	Click Element    xpath=/html[1]/body[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[3]/div[1]/div[3]/button[3]
	Sleep    3
	# Click Element	xpath=//body[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[3]/div[1]/div[2]/div[3]/button[1]
	# Sleep	2s
	# Scroll Element Into View	xpath=//body[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[2]/div[6]/div[2]/div[4]/p[1]
	# Sleep	2s
	# Scroll Element Into View	xpath=//body[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[2]/div[1]/div[1]/span[1]/p[1]
	# Sleep	1s
	# Click Element	xpath=//body[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[2]/div[1]/div[2]/button[1]
	# Sleep	5s
	# Scroll Element Into View	xpath=//body[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]
	# Sleep	1s
	# Click Element	xpath=//body[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[2]/div[1]/div[1]/img[1]
	# Sleep	3s
	# Click Element	xpath=//body[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[2]/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[1]/button[1]
	# Sleep	1s
	# Click Button    //button[@class='w-18 bg-white text-black p-1.5 px-2 rounded-full flex flex-row items-center justify-between border']
	# Sleep	1s
	# Click Element	xpath=//a[contains(text(), "Tiket Saya")]
	# Sleep	1s
	# Click Button    //button[@class='w-18 bg-white text-black p-1.5 px-2 rounded-full flex flex-row items-center justify-between border']
	# Sleep	2s
	# Scroll Element Into View	xpath=//body[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[3]/div[4]/div[2]/div[1]/div[3]/p[2]
	# Sleep	2s
	# Click Element	xpath=//body[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[3]/div[4]/div[2]/div[3]/button[1]
	# Sleep	2s
	# Scroll Element Into View	xpath=//body[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[2]/div[6]/div[2]/div[4]/p[1]
	# Sleep	2s
	# Scroll Element Into View	xpath=//body[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[2]/div[1]/div[1]/span[1]/p[1]
	# Sleep	1s
	# Click Element	xpath=//body[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[2]/div[1]/div[2]/button[1]
	# Sleep	5s
	# Scroll Element Into View	xpath=//body[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]
	# Sleep	1s
	# Click Element	xpath=//body[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[2]/div[1]/div[1]/img[1]
	# Sleep	3s
	# Click Element	xpath=//body[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[2]/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[1]/button[1]
	# Sleep	1s
	# Click Button    //button[@class='w-18 bg-white text-black p-1.5 px-2 rounded-full flex flex-row items-center justify-between border']
    # Click Element    xpath=//button[contains(text(), "Keluar")]
