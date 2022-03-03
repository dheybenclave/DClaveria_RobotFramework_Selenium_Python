*** Settings ***
Resource            ../Resources/CommonGlobal.robot

*** Variables ***

#TOP NAV
${common_mainScreen_currency_dropdown}=  xpath://a[@id="customerCurrency"]
${common_mainScreen_register_button}=  xpath://a[@class="ico-register"]
${common_mainScreen_login_button}=  xpath://a[@class="ico-login"]
${common_mainScreen_logout_button}=  xpath://a[@class="ico-logout"]
${common_mainScreen_wishlist_button}=  xpath://a[@class="ico-wishlist"]
${common_mainScreen_cart_button}=  xpath://a[@class="ico-card"]

#LOG AND SEARCH
${common_mainScreen_logo_button}=  xpath://div[@class="header-logo"]
${common_mainScreen_search_txtbox}=  xpath://div[@id="small-searchterms"]
${common_mainScreen_search_button}=  xpath://button[@type="submit" and contains(@class,"search-box-button")]

#CATEGORY TABS
${category_parent_selector}=    xpath://ul[@class="top-menu notmobile"]
${common_mainScreen_computer_tab}=  ${category_parent_selector}//li//a[@href="/computers"]
${common_mainScreen_electronics_tab}=  ${category_parent_selector}//li//a[@href="/electronics"]
${common_mainScreen_apparel_tab}=  ${category_parent_selector}//li//a[@href="/apparel"]
${common_mainScreen_digitalDownloads_tab}=  ${category_parent_selector}//li//a[@href="/digital-downloads"]
${common_mainScreen_books_tab}=  ${category_parent_selector}//li//a[@href="/books"]
${common_mainScreen_jewelry_tab}=  ${category_parent_selector}//li//a[@href="/jewelry"]
${common_mainScreen_giftCards_tab}=  ${category_parent_selector}//li//a[@href="/gift-cards"]
