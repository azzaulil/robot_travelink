*** Settings ***
Library    SeleniumLibrary  
Resource    variable.resource

*** Variables ***
${url_reset}    https://twc.ainosi.com/password/reset?email=azzaulil50@gmail.com&token=mvoEK-XreetbyMNwlnETzlCSX-0=

*** Keywords ***
Forgot Password
    Click Button    //button[@class='w-18 bg-white text-black p-1.5 px-2 rounded-full flex flex-row items-center justify-between border']
    Click Element    xpath=//button[contains(text(), "Masuk")]
    Sleep     3s
    Click Button    //button[@type='button']
    Wait Until Element Is Visible    email
    Input Text      email     ${valid_email}
    Click Button    //button[@type='submit']
    Sleep     3s
    Click Button    xpath=//button[contains(text(), "Kembali Login")]

Fill wrong email
    Sleep     3s
    Click Button    xpath=//button[contains(text(), "Lupa Password ?")]
    Sleep     5s
    Wait Until Element Is Visible    email      timeout=10s
    Input Text      email     ${invalid_email}
    Click Button    //button[@type='submit']
    Wait Until Element Is Visible      //h4[contains(text(), "Error")]      timeout=10s

Reset password
    Go To      ${url_reset}
    Sleep      3s
    Wait Until Element Is Visible    xpath=//label/span[contains(text(), "Password Baru")]      timeout=15s
    Input Text      xpath=//body/div[@id='__nuxt']/div[@id='__layout']/div[1]/div[1]/div[1]/div[1]/form[1]/span[1]/div[1]/span[1]/div[1]/span[1]/input[1]      ${password}
    Sleep      3s
    Input Text      xpath=//body/div[@id='__nuxt']/div[@id='__layout']/div[1]/div[1]/div[1]/div[1]/form[1]/span[1]/div[1]/span[2]/div[1]/span[1]/input[1]      ${password}
    Sleep      3s
    Click Button    //button[@type='submit']
    Sleep      3s
    Wait Until Element Is Visible      xpath=//p[contains(text(), "Reset password sukses")]     timeout=10s
    Click Button    xpath=//button[contains(text(), "Kembali Login")]

Login with new Password
    Sleep     3s
    Input Text    username    ${username}
    Sleep     3s
    Click Button    //button[@type='submit']
    Sleep     3s
    Input Text    password    ${password}
    Sleep     3s
    Click Button    //button[@type='submit']
