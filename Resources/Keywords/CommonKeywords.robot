*** Settings ***
Library    SeleniumLibrary
Resource   ../Data/LoginData.robot
Resource   ../PageObjects/LoginPageElements.robot

*** Keywords ***
Login With Credentials
    [Arguments]    ${username}    ${password}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${USERNAME_INPUT}    10 seconds
    Input Text    ${USERNAME_INPUT}    ${username}
    Input Text    ${PASSWORD_INPUT}    ${password}
    Click Button    ${LOGIN_BUTTON}

Error Message Apperance
    Wait Until Element Is Visible    ${INVALID_CREDENTIAL_TEXT}    10 seconds

Login Button Disapperance
    Wait Until Element Is Not Visible    ${LOGIN_BUTTON}    10 seconds