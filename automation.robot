*** Settings ***
Documentation     Automation testing using CC.
Library           SeleniumLibrary
Resource        Resource/variable.resource
Resource        Resource/home.resource
Resource        Resource/login.resource
Resource        Resource/cart.resource
Resource        Resource/checkout.resource
Resource        Resource/register.resource
Resource    Resource/payment.resource
Resource    Resource/myTicket.resource

*** Test Cases ***
Starting
    Starting app    ${url}
    Search Site    tmii
    Add to cart
    Go to Cart Page
    Go to Checkout Page
    Sleep    1
    Login with valid account    ${username}    ${password}
    Sleep    1
Proceed Payment
    Continue to Payment    ${CC}
    Sleep    2
    Payment with Credit Card
    Sleep    3
    back to home
    Go to My Tiket menu
    