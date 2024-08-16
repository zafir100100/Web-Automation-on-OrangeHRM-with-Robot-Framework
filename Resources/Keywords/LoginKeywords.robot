*** Settings ***
Resource   ../Keywords/CommonKeywords.robot

*** Keywords ***
Login With Credentials
    [Arguments]    ${username}    ${password}
    Enter Input Element    ${USERNAME_INPUT}    ${username}
    Enter Input Element    ${PASSWORD_INPUT}    ${password}
    Click On Element    ${LOGIN_BUTTON}     Login

Verify That Failed Login Error Message Is Displayed
    Wait Until Page Contains Element    ${INVALID_CREDENTIAL_TEXT}
    Wait Until Element Is Visible       ${INVALID_CREDENTIAL_TEXT}
    Verify Element Text Is Present      ${INVALID_CREDENTIAL_TEXT}      Invalid credentials

Verify That After Successful Login Dashboard Page Is Displayed
    Verify Element Is Not Present       ${LOGIN_BUTTON}     Login
    Verify Text Is Present In URL       dashboard
    Wait Until Page Contains Element    ${DASHBOARD_SIDEBAR_TEXT}
    Wait Until Element Is Visible       ${DASHBOARD_SIDEBAR_TEXT}
    Verify Element Text Is Present      ${DASHBOARD_SIDEBAR_TEXT}      Dashboard