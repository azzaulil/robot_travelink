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

Buy zero ticket
    [Arguments]    ${ticket_name}
    Scroll Element Into View    xpath=//div[@class="p-6"]/div/div/h4[contains(text(), "${ticket_name}")]
    Scroll Element Into View    //button[contains(text(), "Beli Langsung")]
    Click Button    //button[@type="submit"]
    Wait Until Element Is Visible    xpath=//p[contains(text(), "Pilih waktu dan jumlah terlebih dahulu")]    timeout=10s
    Capture Page Screenshot    filename=${current test result path}/zero_ticket.png
    File Should Exist    ${current test result path}/zero_ticket.png
    Sleep    2s

Add to Cart Ticket
    [Arguments]    ${ticket_name}    ${ticket_qty}
    Scroll Element Into View    //div[@class="p-6"]/div/div/h4[contains(text(), "${ticket_name}")]
    # Scroll Element Into View    xpath=//*[@id="__layout"]/div/div[1]/div[4]/div[2]/div/div[5]/div/form/div[2]/div[4]/button[1]
    Scroll Element Into View    //button[contains(text(), "Beli Langsung")]
    Sleep    2s
    
    FOR    ${INDEX}    IN RANGE    0   ${ticket_qty}
        Click Element    ${plusbtn_prambanan_dw}
    END

    Click Button    //button[@type="submit"]
    Wait Until Element Is Visible    xpath=//h4[contains(text(), "Berhasil")]
    Capture Page Screenshot    filename=${current test result path}/add_to_cart.png
    File Should Exist    ${current test result path}/add_to_cart.png
    Sleep    3s
    # Get Text    //*[@id="__layout"]/div/nav/div[1]/a/p    ${ticket_qty}    #get ticket qty

Buy ticket
    [Arguments]    ${ticket_name}    ${ticket_qty}
    Scroll Element Into View    //div[@class="p-6"]/div/div/h4[contains(text(), "${ticket_name}")]
    Scroll Element Into View    //button[@type="submit"]
    FOR    ${INDEX}    IN RANGE    0   ${ticket_qty}
        Click Element    ${plusbtn_prambanan_dw}
    END
    Click Element    xpath=//button[contains(text(), "Beli Langsung")]
    Wait Until Element Is Visible    xpath=//h2[@class="text-xl font-semibold py-2"]    timeout=10s
    Sleep    3s

Go to Cart Page
    Click Element    xpath=//a[@href="/cart"]
    Wait Until Element Is Visible    xpath=//h2[@class="text-xl font-semibold py-2"]    timeout=10s
    Capture Page Screenshot    filename=${current test result path}/ticket_chosen.png
    File Should Exist    ${current test result path}/ticket_chosen.png

Edit Cart Item
    Click Element    xpath=//body/div[@id='__nuxt']/div[@id='__layout']/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[2]/div[1]/div[2]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/button[1]
    Sleep     3s
    Scroll Element Into View    xpath=//body/div[3]/div[1]/div[1]/div[2]/div[2]/div[1]/button[30]
    Sleep     3s
    Click Element    xpath=//body/div[3]/div[1]/div[1]/div[2]/div[2]/div[1]/button[30]
    Sleep     3s
    Click Element    xpath=/html[1]/body[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[2]/div[1]/div[2]/div[2]/div[1]/div[1]/div[2]/button[1]
    Sleep     3s
    # Click Element    xpath=//label[contains(text(), "Pukul 08:00 - 12:00")]//span
    # Sleep     3s
    # Click Element    xpath=//body/div[@id='__nuxt']/div[@id='__layout']/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[2]/div[1]/div[2]/div[2]/div[1]/div[1]/div[3]/button[1]
    # Sleep     3s
    # Click Element    xpath=//body/div[@id='__nuxt']/div[@id='__layout']/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[2]/div[1]/div[2]/div[2]/div[1]/div[2]/div[2]/div[1]/div[1]/button[2]
    # Sleep     3s

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
    Capture Page Screenshot    filename=${current test result path}/deleted_cart_item.png
    File Should Exist    ${current test result path}/deleted_cart_item.png

When Cart Item Is empty
    #should use if else condition
    Page Should Contain Element    xpath=//h1[contains(text(), "Keranjang Kosong")]

Delete all Cart Item without select cart item
    Page Should Contain Element    xpath=//div[@class="vs-checkbox-content vs-checkbox--checked"]
    Click Element    xpath=//div[@class="vs-checkbox-content vs-checkbox--checked"]/div/input
    Click Element    xpath=//button[contains(text(), "Hapus Terpilih")]
    Wait Until Element Is Visible    xpath=//p[contains(text(), "Select ticket can't be empty")]
