*** Settings ***
Library    SeleniumLibrary
Resource   ../Data/GlobalData.robot
Resource   ../Data/LoginData.robot

*** Keywords ***
Login With Credentials
    [Arguments]    ${username}    ${password}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${USERNAME_INPUT}    10 seconds
    Input Text    ${USERNAME_INPUT}    ${username}
    Input Text    ${PASSWORD_INPUT}    ${password}
    Click Button    ${LOGIN_BUTTON}
