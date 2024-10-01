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
${INVALID_USERNAME}    123sdsds
${INVALID_PASSWORD}    87654321
${ALERT_FAILED}    //div[contains(text(),'Login was failure')]
${USERNAME_OR_PASSWORD_INCORRECT_MSG}    //div[contains(text(),'Username or Password is incorrect.')]
${ICON_ACCOUNT}    //img[@class='user__avatar']
${BUTTON_LOGOUT}    //span[contains(text(),'Log out')]
${CLICK_ICON_AVATAR}    xpath=//img[@class='user__avatar']
${CLICK_LOGOUT}    //div[contains(@class,'ant-dropdown ant-dropdown-placement-bottomLeft')]//li[4]
${BUTTON_SEND_FORGOT_PASS}    //button[@class='ant-btn save-button ant-btn-primary']
${BUTTON_FOGOT_PASS}    //div[@class='styles__ForgotPasswordWrapper-sc-18b5g3s-6 iiWWsb']//span[contains(text(),'Forgot password?')]
${ACC_ERROS_MGS}    //span[contains(text(),'Please enter Username!')]
${INPUT_ACC_FORGOT}    //input[@id='username']
*** Test Cases ***
TC01Test
    Open Browser    ${url}    ${browserName}
    Maximize Browser Window
    Click Button    //button[@type='submit']

    Page Should Contain Element    ${USERNAME_ERROR_MSG}
    Page Should Contain Element    ${PASSWORD_ERROR_MSG}
TC02: Empty with empty password
    Reload Page
    Input Text    ${USERNAME_FIELD}    ${username}
    Click Button    ${LOGIN_BUTTON}
    Wait Until Page Contains Element    ${PASSWORD_ERROR_MSG}    10s
    Page Should Contain     Please enter password!
TC3: Empty with empty username
    Reload Page
    Input Text    ${PASSWORD_FIELD}   ${password}
    Click Button    ${LOGIN_BUTTON}
    Page Should Contain Element    ${USERNAME_ERROR_MSG}    10s
    Page Should Contain    Please enter Username!
TC4: Login with invalid account
    Reload Page
    Input Text    ${USERNAME_FIELD}    ${INVALID_USERNAME}
    Input Text    ${PASSWORD_FIELD}    ${INVALID_PASSWORD}
    Click Element    ${LOGIN_BUTTON}
    Wait Until Element Is Visible    ${ALERT_FAILED}    2s
    Page Should Contain    Login was failure
    Page Should Contain    Username or Password is incorrect.
TC5: Login with valid account
     Reload Page
     Input Text    ${USERNAME_FIELD}    ${username}
     Input Text    ${PASSWORD_FIELD}    ${password}
     Click Element    ${LOGIN_BUTTON}
     Wait Until Page Contains    Dashboard    2s
     Page Should Contain         Dashboard
TC6: Log out
    Reload Page
    Wait Until Element Is Visible    ${CLICK_ICON_AVATAR}
    Click Element    ${CLICK_ICON_AVATAR}
    Page Should Contain    Log out
    Click Element    xpath://li[@class='ant-dropdown-menu-item ant-dropdown-menu-item-only-child'][4]/span/span[contains(text(), 'Log out')]

TC07: Forget password with empty account
    Reload Page
    Wait Until Element Is Visible    ${BUTTON_FOGOT_PASS}    2s
    Click Element    ${BUTTON_FOGOT_PASS}
    Wait Until Element Is Visible    xpath://input[@labelname='Account*']    2s
    Click Element    ${BUTTON_SEND_FORGOT_PASS}
    Wait Until Page Contains Element    ${ACC_ERROS_MGS}
    Page should contain    Please enter Username!

TC8: Forget password with invalid account
    Input Text    //input[@id='username']    13434354
    Click Element    ${BUTTON_SEND_FORGOT_PASS}
    Wait Until Element Is Visible    //div[@class='ant-notification-notice ant-notification-notice-closable']    2s
    Page should contain     Username is incorrect.

TC9: Forget password with valid account
    Reload Page
    Click Element    ${BUTTON_FOGOT_PASS}
    Input Text    ${INPUT_ACC_FORGOT}   ${username}
    Click Element    ${BUTTON_SEND_FORGOT_PASS}
    Wait Until Element Is Visible     xpath://div[@class='ant-notification-notice ant-notification-notice-closable']    2s
    Page Should Contain    The system has sent the password recovery link to your email address

*** Keywords ***

