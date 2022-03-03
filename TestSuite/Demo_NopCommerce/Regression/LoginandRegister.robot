*** Settings ***
Documentation       Register and Login new Customer
Resource             ../Resources/CommonGlobal.robot


*** Variables ***

&{test_data}=   gender=Female   first_name=robot_framework  last_name=selenium  birthdate=12/30/2001    get_news=Yes    email=${GET_GENERATED_RANDOM_EMAIL}    password=test_python


*** Test Cases ***
Register and Login New Customer
    [Documentation]  Create New Customer with validation of elements
    [Tags]  Regression

    ${test_data.email}=    Generate Randomize Email   robot.framework.selenium  #assign new key value of  email key

    Proceed To Browser
    Register Customer   ${test_data.gender}  ${test_data.first_name}    ${test_data.last_name}   ${test_data.birthdate}   ${test_data.get_news}  ${test_data.email}  ${test_data.password}
    LogOut User
    Login User    ${GET_GENERATED_RANDOM_EMAIL}   ${test_data.password}
    Open new Browser Tab and Close  ${NEW_BROWSER_TAB}
    my logger  ${GET_GENERATED_RANDOM_EMAIL}
    [Teardown]  Close Browser


Add Items in Shopping Cart
    [Tags]  Regression

    Proceed To Browser

    Login User    ${test_data.email}  ${test_data.password}
    Select Tab With Value  ${category_parent_selector}  Gift Cards
    Select Tab  ${common_mainscreen_books_tab}

    [Teardown]  Close Browser

*** Keywords ***

Login User
    [Arguments]     ${email}   ${password}
    Navigate To Login Page
    Login with Credentials   ${email}   ${password}


Register Customer
    [Arguments]     ${gender}   ${first_name}   ${last_name}    ${birth_date}   ${news_letter}   ${input_email}    ${input_password}

    Navigate To Register Page

    @{list_of_required_fileds}=   Create list   ${gender}  ${first_name}  ${last_name}  ${birth_date}  ${news_letter}  ${input_email}  ${input_password}

    FOR     ${field}    IN    @{list_of_required_fileds}
         should not be empty  ${field}
    END


    click element   ${common_mainScreen_register_button}

    ${selected_gender}=  convert to lower case  ${gender}
    run keyword if  "${selected_gender}" == "male"   OR   "${selected_gender}" == "female"

    ${selector_gender}=  set variable   //div[@id="gender"]//input[@id="gender-${selected_gender}"]   #default selected
    click element   xpath:${selector_gender}

    Set Textbox Value    ${register_mainScreen_firstName_txtbox}   ${first_name}
    Set Textbox Value    ${register_mainScreen_lastName_txtbox}    ${last_name}

    Select Birth of Date  ${register_mainScreen_birthdate_datepicker}    ${birth_date}

    Set Textbox Value    ${register_mainScreen_email_txtbox}    ${input_email}
    Set Textbox Value    ${register_mainScreen_pasword_txtbox}    ${input_password}
    Set Textbox Value    ${register_mainScreen_confirmPasword_txtbox}    ${input_password}

    click element  ${register_mainScreen_register_button}
    set selenium timeout   5s
    location should be  ${REGISTER_SUCCESS_URL}
    ${screenshot_filename}=     generate screenshot filename
    capture page screenshot    Results/${screenshot_filename}-{index}.png



