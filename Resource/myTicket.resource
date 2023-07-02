*** Settings ***
Library    SeleniumLibrary
Library    XML
Resource    variable.resource

*** Keywords ***
Go to Transaction History
    Click Button    ${profile_btn}
	Click Element    xpath=//a[contains(text(), "Riwayat Transaksi")]
	Wait Until Element Is Visible    //h1[contains(text(), 'Riwayat Transaksi')]
	Click Element    xpath=//*[@id="__layout"]/div/div[1]/div[1]/div[2]/div[2]/div/div[2]/button[2]    # Konfirmasi Pembayaran status
	Sleep    1s

Go to My Ticket
	Click Button    ${profile_btn}
	Click Element    //a[contains(text(), 'Tiket Saya')]
	Wait Until Element Is Visible    //h1[contains(text(), 'Tiket Saya')]
	Sleep    1s
	Page Should Contain    Pembayaran Sukses

View Transaction Detail
	Click Element    xpath=//button[contains(text(), "Lihat Detail Transaksi")]
	# Scroll Element Into View    //p[contains(text(), 'Metode Pembayaran')]
	Sleep    2s
	Click Element    xpath=//*[@id="__layout"]/div/div[1]/div[1]/div[3]/div[2]/div/div[1]/button    #close button

View Ticket Detail
	Click Element    xpath=//button[contains(text(), "Lihat Tiket")]
	Sleep    2s
	Capture Page Screenshot    filename=${current test result path}/detail_ticket.png
    File Should Exist    ${current test result path}/detail_ticket.png
    