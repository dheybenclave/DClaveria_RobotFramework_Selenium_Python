*** Settings ***


*** Keywords ***
Set Textbox Value
    [Arguments]     ${input_selector}   ${input_value}
#    ${input_selector}    set variable    ${input_selector}   # email_txt= xpath selector of email

    scroll element into view    ${input_selector}
    element should be visible   ${input_selector}
    element should be enabled   ${input_selector}

    input text  ${input_selector}  ${input_value}
    Sleep   1s
   # clear element text   ${email_txt}
