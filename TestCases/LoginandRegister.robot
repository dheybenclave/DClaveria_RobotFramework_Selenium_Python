*** Settings ***
Documentation       Register and Login new Customer
Resource             ../Resources/CommonGlobal.robot

*** Variables ***

&{test_data}=   gender=Female   first_name=robot_framework  last_name=selenium  birthdate=12/30/2001    get_news=Yes    email=${GET_GENERATED_RANDOM_EMAIL}    password=test_python




*** Test Cases ***
Register and Login New Customer
    [Documentation]  Create New Customer with validation of elements
    [Tags]  Smoke
    Proceed To Browser
    Navigate To Register Page
    ${test_data.email}=    Generate Randomize Email   robot.framework.selenium  #assign new key value of  email key
    Register Customer   ${test_data.gender}  ${test_data.first_name}    ${test_data.last_name}   ${test_data.birthdate}   ${test_data.get_news}  ${test_data.email}  ${test_data.password}
    LogOut User
    Navigate To Login Page
    Login with Credentials   ${GET_GENERATED_RANDOM_EMAIL}   ${test_data.password}
    Open new Browser Tab and Close  ${NEW_BROWSER_TAB}
    [Teardown]  Close Browser


#
#Validate Input TextBox
#    [Documentation]  Sample Test for Validating and Verifying the Input Elements
#    [Tags]  Smoke
#    Proceed To Browser
#    Navigate To Login Page
#    Login with Credentials   ${GET_GENERATED_RANDOM_EMAIL}    test_python
#    Sleep   2s
#    [Teardown]  Close Browser


*** Keywords ***


Navigate To Login Page
    click element       ${common_mainScreen_login_button}
    location should be  ${LOGIN_URL}
    title should be     nopCommerce demo store. Login

Navigate To Register Page
    click element       ${common_mainScreen_register_button}
    location should be  ${REGISTER_URL}
    title should be     nopCommerce demo store. Register

LogOut User
    Sleep   2s
    click element       ${common_mainscreen_logout_button}
    location should be  ${WELCOME_URL}
    title should be    nopCommerce demo store


Login with Credentials
   [Arguments]     ${input_email}   ${input_password}
    Validate and Verify Input TextBox by Value    ${login_mainScreen_email_txtbox}   ${input_email}
    Validate and Verify Input TextBox by Value    ${login_mainScreen_password_txtbox}    ${input_password}
    click button    xpath://form//button[contains(@class,"login-button")]
    title should be   nopCommerce demo store
    Sleep   2s


Register Customer
    [Arguments]     ${gender}   ${first_name}   ${last_name}    ${birth_date}   ${news_letter}   ${input_email}    ${input_password}

    @{list_of_required_fileds}=   Create list   ${gender}  ${first_name}  ${last_name}  ${birth_date}  ${news_letter}  ${input_email}  ${input_password}

    FOR     ${field}    IN    @{list_of_required_fileds}
         should not be empty  ${field}
    END

    click element   ${common_mainScreen_register_button}

    ${selected_gender}=  convert to lower case  ${gender}
    run keyword if  "${selected_gender}" == "male"   OR   "${selected_gender}" == "female"

    ${selector_gender}=  set variable   //div[@id="gender"]//input[@id="gender-${selected_gender}"]   #default selected
    click element   xpath:${selector_gender}

    Validate and Verify Input TextBox by Value    ${register_mainScreen_firstName_txtbox}   ${first_name}
    Validate and Verify Input TextBox by Value    ${register_mainScreen_lastName_txtbox}    ${last_name}

    Select Birth of Date  ${register_mainScreen_birthdate_datepicker}    ${birth_date}

    Validate and Verify Input TextBox by Value    ${register_mainScreen_email_txtbox}    ${input_email}
    Validate and Verify Input TextBox by Value    ${register_mainScreen_pasword_txtbox}    ${input_password}
    Validate and Verify Input TextBox by Value    ${register_mainScreen_confirmPasword_txtbox}    ${input_password}

    click element  ${register_mainScreen_register_button}
    set selenium timeout   5s
    location should be  ${REGISTER_SUCCESS_URL}
    ${screenshot_filename}=     generate screenshot filename
    capture page screenshot    ReportScreenshots/${screenshot_filename}-{index}.png


