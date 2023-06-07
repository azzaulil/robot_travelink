*** Settings ***
Library    SeleniumLibrary
Resource    variable.resource
Resource    home.resource

*** Keywords ***
# Change Date before Add to Cart
#     Click Element    xpath=//input[@name="datepicker"]
#     Sleep     3s
#     Click Element    xpath=//button/div/span[contains(text(), "8")]
#     Sleep     3s    
#     Click Element    xpath=//button[@class="bg-mainGreen text-white rounded-full w-10 h-10 text-lg font-semibold hover:bg-lime-600"]
#     Sleep    3s
Add to cart
	# Scroll Element Into View	xpath=//body[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/a[1]/div[1]/img[1]
	# Sleep	2s
	# Click Element	xpath=//body[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/a[1]/div[1]/img[1]
	Sleep	1
    Scroll Element Into View    //button[contains(text(), "Beli Langsung")]
    Sleep    1
    Click Element    xpath=//body/div[@id='__nuxt']/div[@id='__layout']/div[1]/div[1]/div[4]/div[2]/div[1]/div[5]/div[1]/form[1]/div[2]/div[3]/div[1]/div[2]/div[1]/div[1]/button[2]
    Click Element    //button[@type="submit"]
    Wait Until Element Is Visible    xpath=//h4[contains(text(), "Berhasil")]
    Sleep    4

Go to Cart Page
    Click Element    xpath=//a[@href="/cart"]
    Wait Until Element Is Visible    xpath=//h2[@class="text-xl font-semibold py-2"]    timeout=10s

Edit Cart Item
    Click Element    xpath=//body/div[@id='__nuxt']/div[@id='__layout']/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[2]/div[1]/div[2]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/button[1]
    Sleep     3s
    Scroll Element Into View    xpath=//body/div[3]/div[1]/div[1]/div[2]/div[2]/div[1]/button[30]
    Sleep     3s
    Click Element    xpath=//body/div[3]/div[1]/div[1]/div[2]/div[2]/div[1]/button[30]
    Sleep     3s
    Click Element    xpath=/html[1]/body[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[2]/div[1]/div[2]/div[2]/div[1]/div[1]/div[2]/button[1]
    Sleep     3s
    Click Element    xpath=//label[contains(text(), "Pukul 08:00 - 12:00")]//span
    Sleep     3s
    Click Element    xpath=//body/div[@id='__nuxt']/div[@id='__layout']/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[2]/div[1]/div[2]/div[2]/div[1]/div[1]/div[3]/button[1]
    Sleep     3s
    Click Element    xpath=//body/div[@id='__nuxt']/div[@id='__layout']/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[2]/div[1]/div[2]/div[2]/div[1]/div[2]/div[2]/div[1]/div[1]/button[2]
    Sleep     3s

Delete all Cart Item without select cart item
    Page Should Contain Element    xpath=//div[@class="vs-checkbox-content vs-checkbox--checked"]
    Click Element    xpath=//div[@class="vs-checkbox-content vs-checkbox--checked"]/div/input
    Click Element    xpath=//button[contains(text(), "Hapus Terpilih")]
    Wait Until Element Is Visible    xpath=//p[contains(text(), "Select ticket can't be empty")]

Delete Cart Item
    Click Element    xpath=//body/div[@id='__nuxt']/div[@id='__layout']/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[2]/div[1]/div[2]/div[1]/div[1]/button[1]
    Wait Until Element Is Visible    swal2-title
    Sleep    3s
    Click Button    xpath=//div[@class="swal2-actions"]/button[contains(text(), "Hapus")]
    Sleep    3s

Delete All Cart Items
    Click Element    xpath=//button[contains(text(), "Hapus Terpilih")]
    Wait Until Element Is Visible    swal2-title
    Click Button    xpath=//div[@class="swal2-actions"]/button[contains(text(), "Hapus")]
    Wait Until Element Is Visible    xpath=//h1[contains(text(), "Keranjang Kosong")]

When Cart Item Is empty
    #should use if else condition
    Page Should Contain Element    xpath=//h1[contains(text(), "Keranjang Kosong")]

Cart and checkout flow
    # Run Keyword    Search Site    Prambanan
    # Run Keyword    Add to cart
    Run Keyword    Go to Cart Page
    Run Keyword    Go to Checkout Page
