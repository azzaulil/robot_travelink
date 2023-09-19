*** Settings ***
Library    SeleniumLibrary
Library    XML
Resource    variable.resource

*** Keywords ***
Go to Transaction History
    Click Button    ${profile_btn}
	Sleep    1
	Click Element    xpath=//a[contains(text(), "Riwayat Transaksi")]
	Wait Until Element Is Visible    //h1[contains(text(), 'Riwayat Transaksi')]

Validate Konfirmasi Pembayaran transaction
	Click Element    xpath=//*[@id="__layout"]/div/div[1]/div[1]/div[2]/div[2]/div/div[2]/button[2]    # Konfirmasi Pembayaran status
	Sleep    2s

Validate Pembayaran Sukses Transaction
	Click Element    xpath=//*[@id="__layout"]/div/div[1]/div[1]/div[2]/div[2]/div/div[2]/button[3]    # Pembayaran Sukses status
    Wait Until Element Is Visible    //span[contains(text(), "Pembayaran Sukses")]
	Sleep    3

Validate Pembayaran Gagal transaction
	Click Element    xpath=//*[@id="__layout"]/div/div[1]/div[1]/div[2]/div[2]/div/div[2]/button[4]
	Sleep    2s

Validate Pembayaran Kadaluarsa transaction
	Click Element    xpath=//*[@id="__layout"]/div/div[1]/div[1]/div[2]/div[2]/div/div[2]/button[5]  
	Sleep    2s

Search by booking no
    [Arguments]    ${booking_no}
	Input Text    //input[@placeholder='Cari Nomor Booking']    ${booking_no}
	Click Element    xpath=//*[@id="__layout"]/div/div[1]/div[1]/div[2]/div[2]/div/div[1]/button
	Wait Until Element Is Visible    xpath=//b[contains(text(), 'BOOKING NO ${booking_no}')]
	Sleep    2s
	Capture Page Screenshot    filename=${current test result path}/searched_transaction.png
    File Should Exist    ${current test result path}/searched_transaction.png

Go to My Ticket
	Click Button    ${profile_btn}
	Click Element    //a[contains(text(), 'Tiket Saya')]
	Wait Until Element Is Visible    //h1[contains(text(), 'Tiket Saya')]
	Page Should Contain    Pembayaran Sukses

View Transaction Detail
    Wait Until Element Is Visible    //button[contains(text(), 'Lihat Detail Transaksi')]
	Click Element    xpath=//button[contains(text(), "Lihat Detail Transaksi")]
	# Scroll Element Into View    //p[contains(text(), 'Metode Pembayaran')]
	Sleep    2s
	Capture Page Screenshot    filename=${current test result path}/detail_transaction.png
    File Should Exist    ${current test result path}/detail_transaction.png
	Click Element    xpath=//*[@id="__layout"]/div/div[1]/div[1]/div[3]/div[2]/div/div[1]/button    #close button

View Ticket Detail
    Wait Until Element Is Visible    //button[contains(text(), 'Lihat Tiket')]
	Click Element    xpath=//button[contains(text(), "Lihat Tiket")]
	Wait Until Element Is Visible    //h1[contains(text(), 'Detail Tiket')]
	Capture Page Screenshot    filename=${current test result path}/detail_ticket.png
    File Should Exist    ${current test result path}/detail_ticket.png

    