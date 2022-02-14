*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary


*** Variables ***
${WELCOME URL}      https://demo.nopcommerce.com
${LOGIN URL}        https://demo.nopcommerce.com/login?returnUrl=%2F
${BROWSER}          chrome

*** Test Cases ***
Valid Login
    [Documentation]  This is some basic info about the Smoke test
    [Tags]  Smoke
    Open Browser To Home Page
    Maximize Browser Window
    Click Login Link
    Login Page Should Be Open
    Input Username  robot_framework.selenium@mailinator.com
    Input Password  test_python
    Submit Credentials
    Welcome Page Should Be Open
    Sleep   3s
    [Teardown]  Close Browser

*** Keywords ***

Open Browser To Home Page
    Open Browser        ${WELCOME URL}    ${BROWSER}
    Title Should Be     nopCommerce demo store

Login Page Should Be Open
    Title Should Be     nopCommerce demo store. Login

Input Username
    [Arguments]     ${username}
    Input Text      xpath://form//*[@id="Email"]    ${username}

Input Password
    [Arguments]     ${password}
    Input Text      xpath://form//*[@id="Password"]    ${password}

Click Login Link
    Click Link      xpath://a[@class="ico-login"]

Submit Credentials
    Click Button    xpath://form//button[contains(@class,"login-button")]

Welcome Page Should Be Open
    Title Should Be   nopCommerce demo store
