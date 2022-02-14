*** Settings ***
Resource            ../Resources/CommonGlobal.robot

*** Variables ***

${login_mainScreen_email_txtbox}=  xpath://form//*[@id="Email"]
${login_mainScreen_password_txtbox}=  xpath://form//*[@id="Password"]
${login_mainScreen_login_button}=  xpath://form//button[contains(@class,"login-button")]
