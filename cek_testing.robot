*** Settings ***
Documentation       Just for check
Default Tags    End-to-end testing
Library             SeleniumLibrary
Resource            Resource/variable.resource
Resource            Resource/home.resource
Resource            Resource/destination.resource
Resource            Resource/login.resource
Resource            Resource/cart.resource
Resource            Resource/checkout.resource
Resource            Resource/register.resource
Resource            Resource/payment.resource
Resource            Resource/trxHistory.resource
Resource            Resource/forgotPass.resource
Resource            Resource/trxHistory.resource

*** Test Cases ***
User go to Travelink site
    Starting app    ${url}

Check some function
    Go to Login Page
    Login with valid account    ${username}    ${password}
    