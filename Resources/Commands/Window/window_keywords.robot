*** Settings ***
Resource             ../Resources/CommonGlobal.robot

*** Keywords ***


Open new Browser Tab and Close
   [Arguments]  ${url}

    Execute Javascript   window.open('${url}');  #Open new Chrome Tab and set URL
    ${handles}=    Get Window Handles            # Get all available tabs and set to list variable handles
    my logger  ${handles}
    Switch Window    ${handles}[1]               #switch window/new tab to access the element
#    Set Selenium Timeout    10s
    Wait Until Location Contains     ${url}     timeout=10
    Set Browser Implicit Wait    3s
    Close Window
    Set Browser Implicit Wait    3s
    Switch Window    ${handles}[0]               #return to main/default tab
    sleep    5s


