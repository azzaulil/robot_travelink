*** Settings ***
Documentation       Automation testing using CC.

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
#     Register with Google
#     Register with registered email

#     Go to Register Page
#     ${RANDOM INT}=    Evaluate    random.randint(1,100)    random
#     Register with valid account    new_gmail${RANDOM INT}@gmail.com

# User logout
#     Logout

User login
    Go to Login Page
    Login with Unregistered Account
    Login with Invalid PIN
    Go to Login Page
    Login with valid account    ${username}    ${password}
    Logout


# User search location
#     Search location    TMII    30

# User select destination
#     Select destination    Prambanan
#     Select destination in Home page    Prambanan
#     See the destination detail

# User add to cart ticket
#     Buy zero ticket    Prambanan Dewasa - Web
#     Add to Cart Ticket    Prambanan Dewasa - Web    4
#     Buy ticket    Prambanan Dewasa - Web    4

# User go to cart
#     Go to Cart Page
#     Edit Cart Item
#     Delete Cart Item
#     # Delete All Cart Items

# User checkout
#     Go to Checkout Page

# User choose payment method
# #    Login with valid account    ${username}    ${password}
#     Login with Unregistered Account
#     # Validating register link on login form
#     ${RANDOM INT}=    Evaluate    random.randint(1,100)    random
#     Register with valid account    new_gmail${RANDOM INT}@gmail.com
#     # Choose Payment Method    Virtual Account Mandiri
#     Choose Payment Method    Credit / Debit Card

# User doing payment
#     Pay with Credit Card    ${card_number}    ${card_name}    ${card_expired}    ${card_cvv}
#     # Switch Window    locator=MAIN
#     # Pay with VA

# User check payment status
#     # Check Payment Status
#     back to home

# User view transaction history
#     Go to Transaction History
#     # Search by booking no    07wYtxkOen

# User view my ticket
#     Go to My Ticket

# User view transaction detail
#     View Transaction Detail

# User view ticket detail
#     View Ticket Detail
