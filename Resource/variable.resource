*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem        
Library    DateTime

*** Variables ***
${url}    https://twc.ainosi.com/
${url_prod}    https://ticket.borobudurpark.com/
${atm_simulator_url}    https://sandbox.ipay88.co.id/ePayment/ATMSimulator/
${profile_btn}    //button[@class='w-18 bg-white text-black p-1.5 px-2 rounded-full flex flex-row items-center justify-between border']
${username}    Leoo
${password}    P4ss----
${unregistered}   dsbfvha
${wrong_password}    P4ss---

# Registration data
${email_exist}     qa@gmail.com
${phone_no}     08912345678
${fullname}     Sam John
${nationality}    Indonesia
${new_password}    123456
${confirm_password}    123456

# Destination
${yogya}    xpath=//body/div[2]/div[1]/div[1]/button[1]
${jakarta}    xpath=//body/div[2]/div[1]/div[1]/button[3]
${tmii_prod}    xpath=/html[1]/body[1]/div[2]/div[1]/div[2]/button[6]
${tmii}    xpath=//body[1]/div[2]/div[1]/div[2]/button[8]
${prambanan}    xpath=//body/div[2]/div[1]/div[2]/button[1]

# Ticket
${plusbtn_prambanan_dw}    //*[@id="__layout"]/div/div[1]/div[4]/div[2]/div/div[6]/form/div[2]/div[2]/div[1]/div[2]/div/div/button[2]
${plusbtn_prambanan_an}    //*[@id="__layout"]/div/div[1]/div[4]/div[2]/div/div[9]/form/div[2]/div[2]/div[1]/div[2]/div/div/button[2]
${plusbtn_prambanan_dom}    //*[@id="__layout"]/div/div[1]/div[4]/div[2]/div/div[7]/form/div[2]/div[2]/div[1]/div[2]/div/div/button[2]
${plusbtn_tmii_tiketbus}    //*[@id="__layout"]/div/div[1]/div[4]/div[3]/div/div[5]/div/form/div[2]/div[3]/div/div[2]/div/div/button[2]
${plusbtn_tmii_tiketmasuk}    //*[@id="__layout"]/div/div[1]/div[4]/div[2]/div/div[5]/div/form/div[2]/div[3]/div/div[2]/div/div/button[2]
${plusbtn_ratuboko_dw}    //*[@id="__layout"]/div/div[1]/div[4]/div[2]/div/div[6]/form/div[2]/div[2]/div[1]/div[2]/div/div/button[2]

# Payment
${CC}    //span[contains(text(), "Credit / Debit Card")]
${QRIS}    xpath=//*[@id="__layout"]/div/div[1]/div[2]/div[2]/div[2]/div/div[7]/div[1]/div[2]/div[1]
${VA_PER}    //span[contains(text(), "Virtual Account Permata")]
${card_number}    4000000000000044
${card_name}    QA Tester
${card_expired}    03/33
${card_cvv}    123
${current test result path}     Screenshots

*** Keywords ***
Starting app
    [Arguments]    ${url} 
    Open Browser    ${url}    chrome    verify=true
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//input[@class="vs-select__input"]    10s
    Run Keyword    Create directory test result

Create directory test result
    ${date}    Get Current Date    local    0    timestamp    True
    ${date}    Convert Date    ${date}    result_format=%Y%m%d_%H%M
    Set Suite Variable    ${current test result path}    Screenshots/${date}
    Create Directory    ${current test result path}
    Directory Should Exist    ${current test result path} 
        
    # Capture Page Screenshot    filename=${current test result path}/tiket_qr_${INDEX}.png
    # File Should Exist    ${current test result path}/tiket_detail_${INDEX}.png

back to home
    Switch Window    locator=MAIN
    Sleep    3s
    Click Link    /
    Sleep    3s