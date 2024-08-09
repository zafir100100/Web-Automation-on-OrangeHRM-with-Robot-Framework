*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://example.com  # Replace with your actual URL

*** Keywords ***
Login With Credentials
    [Arguments]    ${username}    ${password}
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    ${USERNAME_INPUT}    10 seconds
    Input Text    ${USERNAME_INPUT}    ${username}
    Input Text    ${PASSWORD_INPUT}    ${password}
    Click Button    ${LOGIN_BUTTON}
