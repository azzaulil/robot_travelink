*** Settings ***
Library    SeleniumLibrary
Library    XML
Resource    variable.resource
Resource    cart.resource

*** Keywords ***
Choose Payment Method
    [Arguments]    ${payment_method}
    Sleep     3s
    # Scroll Element Into View    xpath=//span[contains(text(),'${payment_method}')]
    # Click Element    xpath=//span[contains(text(),'${payment_method}')]
    Scroll Element Into View    ${QRIS}
    Sleep    3s
    Click Element    ${QRIS}
    Scroll Element Into View    xpath=//*[@id="__layout"]/div/div[1]/div[2]/div[2]/div[2]/div/button[1]
    Click Element    xpath=//*[@id="checkbox"]
    Click Element    xpath=//*[@id="__layout"]/div/div[1]/div[2]/div[2]/div[2]/div/button[1]
    Sleep    5s

Pay with Credit Card
    [Arguments]    ${card_number}    ${card_name}    ${card_expired}    ${card_cvv}
    Sleep    5s
    Switch Window    locator=NEW
    Input Text    //input[@id='cstCCNumber']    ${card_number}
    Input Text    //input[@id='cstCCName']    ${card_name}  
    Input Text    //input[@id='cc-exp-date']    ${card_expired} 
    Input Text    //input[@id='cc-cvv']    ${card_cvv}
    # Scroll Element Into View    btnPayCC
    # Sleep    3s
    # Click Button    btnPayCC
    Press Keys    //input[@id='cc-cvv']    ENTER
    Sleep    10
    Input Text    //input[@id='otp']    123456
    Click Element    //input[@value='Confirm']
    Sleep    3s
    # Wait Until Element Is Visible    xpath=//div[contains(text(),'Success')]

Pay with VA
    Switch Window    locator=NEW
    # ${va_number}=    Get Text    xpath=//input[@class='copyva']    # get VA number
    Click Element    xpath=//*[@id="card-summary-wrap"]/span[2]/span/div[2]/img    # copy VA button  
    Sleep    3s
    ### Open ATM Simulator in new tab
    Execute Javascript    window.open('')    # open new tab
    Get Window Titles    # get all tab titles
    Switch Window    title=undefined    # switch to new tab
    Go To    ${atm_simulator_url}
    Sleep    3s
    Click Element    bankcode
    Click Element    xpath=//option[@value='70009']
    # Input Text    rekening    ${va_number}
    Click Element    //input[@id='rekening']
    Press Keys    //input[@id='rekening']    CTRL+V
    Click Button    inq-btn
    Wait Until Element Is Visible    //button[@id='pay']
    Click Button    //button[@id='pay']
    Wait Until Element Is Visible    //span[@id='pay-status']
    Switch Window    title=payment_front
    Sleep    3s

Pay with QRIS
    Switch Window    locator=NEW
    Wait Until Element Is Visible    xpath=//span[contains(text(),'Status Pembayaran')]    timeout=10s
    Sleep    20s

Check Payment Status
    Click Button    //button[@class='btn cek-status']
    Wait Until Element Is Visible    //div[contains(text(),'Success')]
    Capture Page Screenshot    filename=${current test result path}/success_payment.png
    File Should Exist    ${current test result path}/success_payment.png

back to home
    Switch Window    locator=MAIN
    Sleep    3s
    Click Link    /
    Sleep    3s


