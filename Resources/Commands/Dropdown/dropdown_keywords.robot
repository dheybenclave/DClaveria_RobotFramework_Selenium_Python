*** Settings ***


*** Keywords ***

Select Dropdown Value
    [Arguments]     ${dropdown_selector}   ${dropdown_item_value}

    scroll element into view    ${dropdown_selector}
    element should be visible   ${dropdown_selector}
    element should be enabled   ${dropdown_selector}

    select from list by value   ${dropdown_selector}   ${dropdown_item_value}
    Sleep   1s

Select Dropdown By
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
    Select Dropdown By  Index  ${parent_selector}//select[@name="DateOfBirthMonth"]    ${get_mm}
    #Date
    Select Dropdown Value   ${parent_selector}//select[@name="DateOfBirthDay"]  ${get_dd}
    #Year
    Select Dropdown Value  ${parent_selector}//select[@name="DateOfBirthYear"]  ${get_yyyy}

    Sleep   1s