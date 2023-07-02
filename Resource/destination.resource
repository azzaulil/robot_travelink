*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Resource    variable.resource

*** Keywords ***
Search location
    [Arguments]    ${location}    ${date_dd}
    Input Text   xpath=//input[@class="vs-select__input"]    ${location}
    # Click Element   xpath=//input[@class="vs-select__input"]
    Sleep    3
    Click Element    ${jakarta}
    Click Element    xpath=//input[@name="datepicker"]
    Sleep    1
    Click Element    xpath=//button/div/span[contains(text(), "${date_dd}")]
    Click Element    xpath=//button[contains(text(), 'Cari')]
    Wait Until Element Is Visible    xpath=//h1[contains(text(), 'Lokasi di ${location}')]     timeout=10s

# Search destination in Cluster page
Select destination
    [Arguments]    ${destination}
    Click Element    xpath=//div[@class="vs-select-content"]
    Input Text    xpath=//input[@class="vs-select__input"]    ${destination}
    # tmii here just for example
    Click Element    ${tmii}
    Click Element    xpath=/html[1]/body[1]/div[1]/div[1]/div[1]/nav[1]/div[1]/div[3]/button[1]
    Wait Until Element Is Visible    xpath=//h1[contains(text(), '${destination}')]     timeout=15s

# Search destination in Home page
Select destination in Home page
    [Arguments]    ${destination}
    Click Link    /
    Sleep    3s
    Scroll Element Into View    xpath=//h2[contains(text(), '${destination}')]
    Sleep    3s
    Click Element    xpath=//h2[contains(text(), '${destination}')]
    Wait Until Element Is Visible    xpath=//h1[contains(text(), '${destination}')]     timeout=10s

See the destination detail
    Sleep    2s
    Click Element    xpath=//*[@id="__layout"]/div/div[1]/div[1]/div[1]/a/div/p    # address of destination
    Sleep    3s
    Switch Window    locator=MAIN
    Scroll Element Into View    xpath=//p[contains(text(), 'Tanggal')]
    Click Element    xpath=//button[contains(text(), 'Baca Selanjutnya')]    # read more button
    Sleep    3s
    Scroll Element Into View    xpath=//h2[contains(text(), 'Anda mungkin juga suka')]

