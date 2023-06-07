*** Settings ***
Library    SeleniumLibrary
Resource    variable.resource
Resource    cart.resource

*** Keywords ***
Select Payment Method
    Sleep     5s
    Switch Window    locator=NEW
    Sleep     3s
    Wait Until Page Contains Element    xpath=//p[contains(text(), 'Pilih Metode Pembayaran')]     timeout=10s
    Sleep    3s
    Scroll Element Into View    xpath=//span[contains(text(),'Virtual Account Mandiri')]
    Click Element    xpath=//span[contains(text(),'Virtual Account Mandiri')]
    Sleep    5s
    Click Button    //button[@class='btn btn-primary button-modal-yes']

Payment with Credit Card
    Sleep    5s
    Switch Window    locator=NEW
    Input Text    //input[@id='cstCCNumber']    4000000000000044
    Input Text    //input[@id='cstCCName']    Bima Sakti  
    Input Text    //input[@id='cc-exp-date']    03/33 
    Input Text    //input[@id='cc-cvv']    123
    # Scroll Element Into View    btnPayCC
    # Sleep    3s
    # Click Button    btnPayCC
    Press Keys    //input[@id='cc-cvv']    ENTER
    Sleep    10
    Input Text    //input[@id='otp']    123456
    Click Element    //input[@value='Confirm']
    Sleep    3s
    # Wait Until Element Is Visible    xpath=//div[contains(text(),'Success')]

Check Payment Status
    Click Button    //button[@class='btn cek-status']

Payment with VA
    Go To    https://sandbox.ipay88.co.id/ePayment/ATMSimulator/

back to home
    Switch Window    locator=MAIN
    Sleep    3s
    Click Link    /
    Sleep    3s


