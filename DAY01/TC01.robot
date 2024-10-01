*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library  SeleniumLibrary
    
*** Variables ***
${url}     https://beahub-web-v1006.devcaprover.nexlesoft.com/
${browserName}    chrome
${username}    merchantowner
${password}    12345678
*** Test Cases ***
TC01Test
    Open Browser    ${url}    ${browserName}
    Maximize Browser Window
    Input Text    id:horizontal_login_username    ${username}
    Sleep    2
    Input Text    id:horizontal_login_password    ${password}
    Sleep    2
    Click Button    //button[@type='submit']
    Wait Until Page Contains    Dashboard    5s
    Page Should Contain   Dashboard
    Close Browser




    
*** Keywords ***
