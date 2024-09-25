*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library  SeleniumLibrary
    
*** Variables ***
${url}     https://beahub-web-v1006.devcaprover.nexlesoft.com/
${browserName}    chrome
${username}    merchantowner
${password}    12345678
${urlDashboard}    https://beahub-web-v1006.devcaprover.nexlesoft.com/dashboard
*** Test Cases ***
TC01Test
# Mở browser và tới URL
    Open Browser    ${url}    ${browserName}
    Maximize Browser Window
# Nhập username
    Input Text    id:horizontal_login_username    ${username}
    Sleep    2
# Nhập password
    Input Text    id:horizontal_login_password    ${password}
    Sleep    2
# Click button login
    Click Button    //button[@type='submit']
    Sleep    5
# Chờ đợi trang Dashboard tải xong và kiểm tra sự xuất hiện của văn bản 'Dashboard'
    Wait Until Page Contains    Dashboard    timeout=10s
    Page Should Contain    Dashboard
    [Teardown]    Close Browser




    
*** Keywords ***
