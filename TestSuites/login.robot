*** Settings ***
Library    SeleniumLibrary
Resource   ../PageObjects/LoginPageElements.robot

*** Test Cases ***
Invalid Login Test
    [Documentation]    Verify that a user cannot log in with invalid credentials
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    ${USERNAME_INPUT}    10 seconds
    Input Text    ${USERNAME_INPUT}    invalidUser
    Input Text    ${PASSWORD_INPUT}    invalidPassword
    [Teardown]    Close Browser

Valid Login Test
    [Documentation]    Verify that a user can log in with valid credentials
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    ${USERNAME_INPUT}    10 seconds
    Input Text    ${USERNAME_INPUT}    admin
    Input Text    ${PASSWORD_INPUT}    admin123
    Click Button    ${LOGIN_BUTTON}
    [Teardown]    Close Browser
