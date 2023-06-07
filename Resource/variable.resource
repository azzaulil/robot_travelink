*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem        
Library    DateTime

*** Variables ***
${url}    https://twc.ainosi.com/
${url_prod}    https://ticket.borobudurpark.com/
${profile_btn}    //button[@class='w-18 bg-white text-black p-1.5 px-2 rounded-full flex flex-row items-center justify-between border']
${username}    Leoo
${password}    P4ss----
# Registration data
${phone_no}     08912345678
${fullname}     Sam John
${nationality}    Indonesia
${new_password}    123456
${confirm_password}    123456
# Destination
${yogya}    xpath=//body/div[2]/div[1]/div[1]/button[1]
${tmii_prod}    xpath=/html[1]/body[1]/div[2]/div[1]/div[2]/button[6]
${tmii}    xpath=//body/div[2]/div[1]/div[2]/button[8]
${prambanan}    xpath=//body/div[4]/div[1]/div[2]/button[1]
${CC}    //span[contains(text(), "Credit / Debit Card")]
${QRIS}    //span[contains(text(), "QRIS")]
${VA_PER}    //span[contains(text(), "Virtual Account Permata")]

${current test result path}    Screenshots

*** Keywords ***
Starting app
    [Arguments]    ${url} 
    Open Browser    ${url}    chrome    verify=true
    Maximize Browser Window

Create directory test result
    ${date}    Get Current Date    local    0    timestamp    True
    ${date}    Convert Date    ${date}    result_format=%Y%m%d_%H%M
    Set Suite Variable    ${current test result path}    Screenshots/${date}
    Create Directory    ${current test result path}
    Directory Should Exist    ${current test result path} 
