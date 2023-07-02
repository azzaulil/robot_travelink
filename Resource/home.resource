*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Resource    variable.resource

*** Keywords ***
Eksplor Destinasi Section
    Go Back
    Sleep     3s
    Click Element   xpath=//a[contains(text(), "Eksplor Destinasi")]
    Sleep     5s
    Click Element   xpath=//img[@alt="merchants/adc351c05949350b302c9ba6905aa512.jpg"]
    Sleep     3s

Promo Section
    Click Link      /
    Sleep   3s
    Click Element   xpath=//a[contains(text(), "Promo")]

Lokasi Section - Destinasi Kota
    Go Back
    Sleep   3s
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Page Contains    Lokasi
    Click Element   xpath=//a[@href="#destinasi-kota"]
    Sleep   3s
    Click Element   xpath=/html[1]/body[1]/div[1]/div[1]/div[1]/div[1]/div[4]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/a[1]/p[1]

Lokasi Section - Destinasi Tempat Wisata
    Go Back
    Sleep   3s
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Page Contains    Lokasi
    Click Element   xpath=//a[@href="#destinasi-tempat-wisata"]
    Sleep   3s
    Click Element   xpath=/html[1]/body[1]/div[1]/div[1]/div[1]/div[1]/div[4]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/a[1]

