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
Resource            Resource/myTicket.resource


*** Test Cases ***
Starting
    Starting app    ${url}

# User regist
    # Go to Register Page
    # Register with empty mandatory
    # Register with registered email
    # Register with valid account    new_email@gmail.com
    # Register with Google

# User logout
#    Logout

User login
    Go to Login Page
    # Check Link Register on Login Modal
    # Check Link Forgot Password on Login Modal
    # Login with Unregistered Account
    # Login with Invalid PIN
    Login with valid account    ${username}    ${password}

# User search location
#     Search location    Jakarta    30

# User select destination
    # Select Destination    TMII - Pintu Masuk
    # Select destination in Home page   TMII
    # See the destination detail

# User add to cart ticket
#     Add to Cart Ticket    Tiket Masuk TMII    1
#     Go to Cart Page
#     Go to Checkout Page

# User choose payment method
#     Login with valid account    ${username}    ${password}
    # Choose Payment Method    Virtual Account Mandiri
    # Choose Payment Method    Credit / Debit Card
    # Choose Payment Method    QRIS
    # back to home

# User doing payment
#     Pay with Credit Card    $card_number    $card_name    $card_expired    $card_cvv
#     Pay with VA
    # Pay with QRIS
#     Check Payment Status

User view transaction history
    Go to Transaction History

User view my ticket
    Go to My Ticket
    View Transaction Detail
    View Ticket Detail
    # See my ticket detail