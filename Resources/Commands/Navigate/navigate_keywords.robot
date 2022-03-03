*** Settings ***
Resource             ../Resources/CommonGlobal.robot

*** Keywords ***

Navigate To Login Page
    click element       ${common_mainScreen_login_button}
    location should be  ${LOGIN_URL}
    title should be     nopCommerce demo store. Login

Navigate To Register Page
    click element       ${common_mainScreen_register_button}
    location should be  ${REGISTER_URL}
    title should be     nopCommerce demo store. Register
