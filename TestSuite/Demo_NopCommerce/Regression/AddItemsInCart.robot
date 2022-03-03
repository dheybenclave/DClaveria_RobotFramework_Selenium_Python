*** Settings ***
Documentation       Register and Login new Customer
Resource             ../Resources/CommonGlobal.robot

*** Variables ***

&{test_data}=   gender=Female   first_name=robot_framework  last_name=selenium  birthdate=12/30/2001    get_news=Yes    email=${GET_GENERATED_RANDOM_EMAIL}    password=test_python


*** Test Cases ***

Add Items in Shopping Cart
    [Tags]  Regressions
    Proceed To Browser

    Login User    ${test_data.email}  ${test_data.password}
    Select Tab With Value  ${category_parent_selector}  Gift Cards
    Select Tab  ${common_mainscreen_books_tab}
    [Teardown]  Close Browser
