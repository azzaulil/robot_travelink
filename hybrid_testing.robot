*** Settings ***
Documentation       Hybrid testing using CC.

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


*** Test Cases ***
User go to Travelink site
    Starting app    ${url}

# User registration
#     Go to Register Page
#     Register with registered email

#     Go to Register Page
#     ${RANDOM INT}=    Evaluate    random.randint(1,100)    random
#     Register with valid account    new_email${RANDOM INT}@gmail.com

# User logout
#    Logout

# User login
#     Go to Login Page
#     Login with Unregistered Account
#     Login with Invalid PIN
#     Login with valid account    ${username}    ${password}

User search location
    Search location    Jakarta    30

User select destination
    Search destination on navbar search    Prambanan
    Select destination in Home page   Prambanan
    View destination page

# User add to cart ticket
#     Buy zero ticket    Prambanan Dewasa - Web
#     Add to Cart Ticket    Prambanan Dewasa - Web    3
#     Buy ticket    Prambanan Dewasa - Web    3

# User go to cart
#     Go to Cart Page
#     Edit Cart Item
#     Delete Cart Item

# User checkout
#     Go to Checkout Page

# User choose payment method
# #     Login with valid account    ${username}    ${password}
#     # Choose Payment Method    Virtual Account Mandiri
#     Choose Payment Method    Credit / Debit Card
#     # Choose Payment Method    Nobu
    

# User doing payment manually
#     # Pay with Credit Card    ${card_number}    ${card_name}    ${card_expired}    ${card_cvv}
#     # Switch Window    locator=MAIN
#     # Pay with VA
#     # Pay with QRIS
#     Switch Window    locator=NEW
#     Sleep    30s

# User check payment status
#     # Check Payment Status
#     back to home

# User view transaction history
#     Go to Transaction History
#     Search by booking no    07wYtxkOen

# User view my ticket
#     Go to My Ticket

# User view transaction detail
#     View Transaction Detail

# User view ticket detail
#     View Ticket Detail