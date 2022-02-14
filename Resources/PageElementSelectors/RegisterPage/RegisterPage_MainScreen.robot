*** Settings ***
Resource            ../Resources/CommonGlobal.robot

*** Variables ***

${selector_registration_parent}=  xpath://*[@class="page registration-page"]

#FORM
${register_mainScreen_firstName_txtbox}=   ${selector_registration_parent}//form//*[@id="FirstName"]
${register_mainScreen_lastName_txtbox}=  ${selector_registration_parent}//form//*[@id="LastName"]

${register_mainScreen_birthdate_datepicker}=    ${selector_registration_parent}//div[@class="date-picker-wrapper"]

${register_mainScreen_email_txtbox}=   ${selector_registration_parent}//form//*[@id="Email"]
${register_mainScreen_pasword_txtbox}=  ${selector_registration_parent}//form//*[@id="Password"]
${register_mainScreen_confirmPasword_txtbox}=  ${selector_registration_parent}//form//*[@id="ConfirmPassword"]
${register_mainScreen_register_button}=  ${selector_registration_parent}//form//*[@id="register-button"]






