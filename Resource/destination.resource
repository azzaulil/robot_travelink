*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Resource    variable.resource

*** Keywords ***
Validate when search without select destination
    Click Element    xpath=//button[contains(text(), 'Cari')]
    Wait Until Page Contains    Pilih lokasi terlebih dahulu

# Search location in Home page
Search location
    [Arguments]    ${location}    ${date_dd}
    Input Text   xpath=//input[@class="vs-select__input"]    ${location}
    # Click Element   xpath=//input[@class="vs-select__input"]
    Sleep    3s
    Click Element    ${jakarta}
    Click Element    xpath=//input[@name="datepicker"]
    Sleep    1
    Click Element    xpath=//button/div/span[contains(text(), "${date_dd}")]
    Click Element    xpath=//button[contains(text(), 'Cari')]
    Wait Until Element Is Visible    xpath=//h1[contains(text(), 'Lokasi di ${location}')]     timeout=10s
    Capture Page Screenshot    filename=${current test result path}/location.png
    File Should Exist    ${current test result path}/location.png

Select destination from Location page
    [Arguments]    ${destination}
    Scroll Element Into View    //h3[contains(text(),'${destination}')]
    Click Element    //a[contains(text(), "Beli Tiket")]
    Wait Until Element Is Visible    xpath=//h1[contains(text(), '${destination}')]     timeout=30s
    # Click Element    /html[1]/body[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[2]/div[5]/div[3]/a[1]  #tombol beli tiket Ratu boko
    # Scroll Element Into View    /html[1]/body[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[2]/div[5]/div[3]/a[1]  #tombol beli tiket

Search destination on navbar search
    [Arguments]    ${destination}
    Click Element    xpath=//div[@class="vs-select-content"]
    Input Text    xpath=//input[@class="vs-select__input"]    ${destination}
    Click Element    ${prambanan}
    Sleep    2s
    Click Element    xpath=//body/div[@id='__nuxt']/div[@id='__layout']/div[1]/nav[1]/div[1]/div[3]/button[1]
    Wait Until Element Is Visible    xpath=//h1[contains(text(), '${destination}')]     timeout=30s
    Sleep    2s
    Capture Page Screenshot    filename=${current test result path}/destination.png
    File Should Exist    ${current test result path}/destination.png

# Search destination in Home page
Select destination in Home page
    [Arguments]    ${destination}
    back to home
    Sleep    3s
    Scroll Element Into View    xpath=//h2[contains(text(), '${destination}')]
    Sleep    3s
    Click Element    xpath=//h2[contains(text(), '${destination}')]
    Wait Until Element Is Visible    xpath=//h1[contains(text(), '${destination}')]     timeout=30s
    Sleep    3s

View destination page
    Sleep    2s
    # Click Element    xpath=//*[@id="__layout"]/div/div[1]/div[1]/div[1]/a/div/p    # address of destination
    # Sleep    3s
    Scroll Element Into View    xpath=//p[contains(text(), 'Tanggal')]
    Click Element    xpath=//button[contains(text(), 'Baca Selanjutnya')]    # read more button
    Capture Page Screenshot    filename=${current test result path}/destination_detail.png
    File Should Exist    ${current test result path}/destination_detail.png
    Sleep    3s

Validate destination recommendation 
    Scroll Element Into View    xpath=//h2[contains(text(), 'Anda mungkin juga suka')]
    Capture Page Screenshot    filename=${current test result path}/destination_recom.png
    File Should Exist    ${current test result path}/destination_recom.png

