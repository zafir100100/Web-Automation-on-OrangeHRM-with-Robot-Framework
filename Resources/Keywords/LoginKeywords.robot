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
    Verify Element Is Present    ${INVALID_CREDENTIAL_TEXT}    Invalid Credentials Text
    Verify Element Text Is Present      ${INVALID_CREDENTIAL_TEXT}      Invalid credentials

Verify That After Successful Login Dashboard Page Is Displayed
    Verify Text Is Present In URL       dashboard
    Verify Element Is Present    ${DASHBOARD_SIDEBAR_TEXT}    Dashboard Sidebar Text
    Verify Element Text Is Present      ${DASHBOARD_SIDEBAR_TEXT}      Dashboard