
*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library  SeleniumLibrary

*** Variables ***
${url}     https://beahub-web-v1006.devcaprover.nexlesoft.com/
${browserName}    chrome
${username}    merchantowner
${password}    12345678
${USERNAME_ERROR_MSG}    //span[contains(text(),'Please enter Username!')]
${PASSWORD_ERROR_MSG}    //span[contains(text(),'Please enter password!')]
${USERNAME_FIELD}    id:horizontal_login_username
${PASSWORD_FIELD}    id:horizontal_login_password
${LOGIN_BUTTON}    //button[@type='submit']
${INVALID_USERNAME}    123456789
${INVALID_PASSWORD}    986453636
${ALERT_FAILED}    //div[contains(text(),'Login was failure')]
${USERNAME_OR_PASSWORD_INCORRECT_MSG}    //div[contains(text(),'Username or Password is incorrect.')]
${ICON_ACCOUNT}    //img[@class='user__avatar']
${BUTTON_LOGOUT}    //span[contains(text(),'Log out')]
${CLICK_ICON_AVATAR}    xpath=//img[@class='user__avatar']
${CLICK_LOGOUT}    //span[text() = 'Logout']
${ACC_ERROS_MGS}    //span[contains(text(),'Please enter Username!')]
${BUTTON_SEND_FORGOT_PASS}    //button[@class='ant-btn save-button ant-btn-primary']
${BUTTON_FOGOT_PASS}    //span[contains(text(),'Forgot password?')]
${INPUT_ACC_FORGOT}    //input[@id='username']
*** Test Cases ***
TC8: Login with invalid account
    Open Browser    ${url}    ${browserName}
    Maximize Browser Window
    Click Element    ${BUTTON_FOGOT_PASS}
    Input Text    ${INPUT_ACC_FORGOT}   ${username}
    Click Element    ${BUTTON_SEND_FORGOT_PASS}
    Wait Until Element Is Visible     xpath://div[@class='ant-notification-notice ant-notification-notice-closable']    2s
    Page Should Contain    The system has sent the password recovery link to your email address








    
