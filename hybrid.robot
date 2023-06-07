*** Settings ***
Documentation     Hybrid Testing using QRIS.
Library           SeleniumLibrary
Resource        Resource/variable.resource
Resource        Resource/home.resource
Resource        Resource/login.resource
Resource        Resource/cart.resource
Resource        Resource/checkout.resource
Resource    Resource/register.resource
Resource    Resource/payment.resource
Resource    Resource/myTicket.resource


*** Test Cases ***
Starting
    Starting app    ${url}

Search Site
    Search Site    tmii

Add to cart
    Add to cart
    Go to Cart Page

Checkout
    Go to Checkout Page
    Sleep    1
    Login with valid account    ${username}    ${password}
    # Click Element    xpath=//button[@class="absolute top-4 left-4 p-2 rounded-full hover:bg-red-400 hover:text-white"]
    # Register with valid account    negoto4741@duiter.com

Proceed Payment
    Continue to Payment    ${CC}
    Sleep    30
    # Check Payment Status
    # Wait Until Element Is Visible    xpath=//div[contains(text(), 'Success')]    timeout=10s

View purchased ticket
    back to home
    Go to My Tiket menu
    # Submit Credentials
    # Welcome Page Should Be Open
    # [Teardown]    Close Browser

# *** Keywords ***
# Open Browser To Login Page
#     Open Browser    ${URL}    ${BROWSER}
#     Title Should Be    Login Page

# Input Username
#     [Arguments]    ${username}
#     Input Text    username_field    ${username}

# Input Password
#     [Arguments]    ${password}
#     Input Text    password_field    ${password}

# Submit Credentials
#     Click Button    login_button

# Welcome Page Should Be Open
#     Title Should Be    Welcome Page