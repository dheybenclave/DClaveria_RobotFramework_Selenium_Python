*** Settings ***
Documentation       Register and Login new Customer
Library             SeleniumLibrary
Library             String

#Libraries | Keyword Command
Library             ../Libraries/CustomLibrary.py
Library             ../Libraries/common/CommonGlobal.py
Library             Collections

#Page Selectors
Resource            ../Resources/PageElementSelectors/Common_MainScreen.robot
Resource            ../Resources/PageElementSelectors/LoginPage/LoginPage_MainScreen.robot
Resource            ../Resources/PageElementSelectors/RegisterPage/RegisterPage_MainScreen.robot

#Page Commands
Resource            ../Resources/Commands/Dropdown/dropdown_keywords.robot
Resource            ../Resources/Commands/TextBox/textbox_keywords.robot
Resource            ../Resources/Commands/Tab/tab_keywords.robot
Resource            ../Resources/Commands/Navigate/navigate_keywords.robot
Resource            ../Resources/Commands/Window/window_keywords.robot
Resource            ../Resources/Commands/Table/table_keywords.robot

#Suite Setup       Log    Suite Setup!
#Suite Teardown    Log    Suite Teardown!

*** Variables ***
${WELCOME_URL}      https://demo.nopcommerce.com/
${BROWSER}          chrome
${LOGIN_URL}        ${WELCOME_URL}login?returnUrl=%2F
${REGISTER_URL}     ${WELCOME_URL}register?returnUrl=%2F
${REGISTER_SUCCESS_URL}     https://demo.nopcommerce.com/registerresult/1?returnUrl=/
${GET_GENERATED_RANDOM_EMAIL}   Placeholder
${NEW_BROWSER_TAB}  https://www.w3schools.com/


*** Keywords ***

Generate Randomize Email
    [Arguments]     ${append_email}
    ${GENERATE_RANDOM_EMAILS} =  generate random emails     ${append_email}
    set test variable    ${GET_GENERATED_RANDOM_EMAIL}   ${GENERATE_RANDOM_EMAILS}
    my logger     ${GET_GENERATED_RANDOM_EMAIL}
    [Return]    ${GENERATE_RANDOM_EMAILS}

Proceed To Browser
    [Arguments]  ${app_url}=${WELCOME_URL}   ${app_browser}=${BROWSER}

    Open browser    ${app_url}   ${app_browser}
    maximize browser window
    location should be  ${app_url}
    Sleep   2s

Login User
    [Arguments]     ${email}   ${password}
    Navigate To Login Page
    Login with Credentials   ${email}   ${password}

LogOut User
    Sleep   2s
    click element       ${common_mainscreen_logout_button}
    location should be  ${WELCOME_URL}
    title should be    nopCommerce demo store


Login with Credentials
   [Arguments]     ${input_email}   ${input_password}
    Set Textbox Value    ${login_mainScreen_email_txtbox}   ${input_email}
    Set Textbox Value    ${login_mainScreen_password_txtbox}    ${input_password}
    click button    xpath://form//button[contains(@class,"login-button")]
    title should be   nopCommerce demo store
    Sleep   2s


