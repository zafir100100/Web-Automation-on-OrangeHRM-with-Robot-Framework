*** Settings ***
Resource   ../Keywords/CommonKeywords.robot

*** Keywords ***
Enter Login Username
    [Arguments]    ${username}
    Enter Input Element    ${USERNAME_INPUT}    ${username}

Enter Login Password
    [Arguments]    ${password}
    Enter Input Element    ${PASSWORD_INPUT}    ${password}

Click Login Button
    Click On Element    ${LOGIN_BUTTON}     Login

Login With Invalid Credentials
    [Arguments]    ${username}    ${password}
    Enter Login Username    ${username}
    Enter Login Password    ${password}
    Click Login Button
    Verify That Failed Login Error Message Is Displayed

Login With Valid Credentials
    [Arguments]    ${username}    ${password}
    Enter Login Username    ${username}
    Enter Login Password    ${password}
    Click Login Button
    Verify That After Successful Login Dashboard Page Is Displayed

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
