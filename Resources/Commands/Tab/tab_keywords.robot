*** Settings ***


*** Keywords ***
Select Tab With Value
    [Arguments]     ${tab_parent_selector}   ${tab_value}
#    ${input_selector}    set variable    ${input_selector}   # email_txt= xpath selector of email
    ${selected_tab}=    Catenate    SEPARATOR=   ${tab_parent_selector}   //a[contains(text(),"   ${tab_value}    ")]

    scroll element into view    ${selected_tab}
    element should be visible   ${selected_tab}
    element should be enabled   ${selected_tab}

    click element  ${selected_tab}
    Sleep   1s
   # clear element text   ${email_txt}


Select Tab
    [Arguments]     ${tab_selector}
#   ${input_selector}    set variable    ${input_selector}   # email_txt= xpath selector of email

    scroll element into view    ${tab_selector}
    element should be visible   ${tab_selector}
    element should be enabled   ${tab_selector}

    click element  ${tab_selector}
    Sleep   1s
   # clear element text   ${email_txt}