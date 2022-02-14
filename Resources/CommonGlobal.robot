*** Settings ***
Documentation       Register and Login new Customer
Library             SeleniumLibrary
Library             String

#Libraries | Keyword Command
Library             ../lib/CustomLibrary.py
Library             ../lib/common/CommonGlobal.py
Library           Collections

#Page Selectors
Resource            ../Resources/PageElementSelectors/Common_MainScreen.robot
Resource            ../Resources/PageElementSelectors/LoginPage/LoginPage_MainScreen.robot
Resource            ../Resources/PageElementSelectors/RegisterPage/RegisterPage_MainScreen.robot

Resource          keywords.robot
#Suite Setup       Log    Suite Setup!
#Suite Teardown    Log    Suite Teardown!

*** Variables ***
${WELCOME_URL}      https://demo.nopcommerce.com/
${BROWSER}          chrome
${LOGIN_URL}        ${WELCOME_URL}login?returnUrl=%2F
${REGISTER_URL}     ${WELCOME_URL}register?returnUrl=%2F
${REGISTER_SUCCESS_URL}     https://demo.nopcommerce.com/registerresult/1?returnUrl=/
${GET_GENERATED_RANDOM_EMAIL}   Placeholder
${NEW_BROWSER_TAB}  https://gxd4e.csb.app/



*** Keywords ***

Generate Randomize Email
    [Arguments]     ${append_email}
    ${GENERATE_RANDOM_EMAILS} =  generate random emails     ${append_email}
    set test variable    ${GET_GENERATED_RANDOM_EMAIL}   ${GENERATE_RANDOM_EMAILS}
    my logger     ${GET_GENERATED_RANDOM_EMAIL}
    [Return]    ${GENERATE_RANDOM_EMAILS}



Proceed To Browser
   [Arguments]  ${app_url}=${WELCOME_URL}   ${app_browser}=${BROWSER}
   open browser    ${app_url}   ${app_browser}
   maximize browser window
   location should be  ${app_url}


Open new Browser Tab and Close
   [Arguments]  ${url}

    Execute Javascript   window.open('${url}');  #Open new Chrome Tab and set URL
    ${handles}=    Get Window Handles            # Get all available tabs and set to list variable handles
    my logger  ${handles}
    Switch Window    ${handles}[1]               #switch window/new tab to access the element
    Wait Until Location Contains     ${url}
    Set Browser Implicit Wait    3s
    Close Window
#   element should be visible    id:openwindow
#   element should be visible   id:openalert
    Set Browser Implicit Wait    3s
    Switch Window    ${handles}[0]               #return to main/default tab
    sleep    5s


Validate and Verify Input TextBox by Value
    [Arguments]     ${input_selector}   ${input_value}
#    ${input_selector}    set variable    ${input_selector}   # email_txt= xpath selector of email

    scroll element into view    ${input_selector}
    element should be visible   ${input_selector}
    element should be enabled   ${input_selector}

    input text  ${input_selector}  ${input_value}
    Sleep   1s
   # clear element text   ${email_txt}



Validate and Verify Dropdown by Value
    [Arguments]     ${dropdown_selector}   ${dropdown_item_value}

    scroll element into view    ${dropdown_selector}
    element should be visible   ${dropdown_selector}
    element should be enabled   ${dropdown_selector}

    select from list by value   ${dropdown_selector}   ${dropdown_item_value}
    Sleep   1s

Validate and Verify Dropdown by
    [Arguments]  ${value_index_label}   ${dropdown_selector}   ${dropdown_item_value}

    scroll element into view    ${dropdown_selector}
    element should be visible   ${dropdown_selector}
    element should be enabled   ${dropdown_selector}

    ${select_by}=   convert to lower case  ${value_index_label}

    IF  '${select_by}' == 'value'
        select from list by value   ${dropdown_selector}   ${dropdown_item_value}
    ELSE IF  '${select_by}' == 'index'
         select from list by index   ${dropdown_selector}   ${dropdown_item_value}
    ELSE
        select from list by label   ${dropdown_selector}   ${dropdown_item_value}
    END

    Sleep   1s

Select Birth of Date
    [Arguments]    ${parent_selector}   ${birth_date_value}

#    ${list_birthday}=   split string  ${birth_date_value}   /
#    ${get_mm}=      set variable  ${list_birthday}[0]
#    my logger  ${list_birthday}-${get_mm}

    ${get_mm}=      split string return by index  ${birth_date_value}   /  0
    ${get_dd}=      split string return by index  ${birth_date_value}   /  1
    ${get_yyyy}=    split string return by index  ${birth_date_value}   /  2
    my logger  ${get_mm}-${get_dd}-${get_yyyy}


    #Month
    Validate and Verify Dropdown by  Index  ${parent_selector}//select[@name="DateOfBirthMonth"]    ${get_mm}
    #Date
    Validate and Verify Dropdown by Value   ${parent_selector}//select[@name="DateOfBirthDay"]  ${get_dd}
    #Year
    Validate and Verify Dropdown by Value  ${parent_selector}//select[@name="DateOfBirthYear"]  ${get_yyyy}

     Sleep   1s