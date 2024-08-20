*** Settings ***
Resource   ../Keywords/CommonKeywords.robot

*** Keywords ***
Click User Profile Icon on the Topmost Right Side
    Click On Element    ${Profile_Icon}     User Profile Icon

Click Logout Button
    Click On Element    ${Logout_Text}     Logout

Log Out
    Click User Profile Icon on the Topmost Right Side
    Click Logout Button
    Verify That User is successfully Logged Out

Verify That User is successfully Logged Out
    Wait Until Page Contains Element    ${LOGIN_BUTTON}
    Wait Until Element Is Visible       ${LOGIN_BUTTON}
    Verify Element Text Is Present      ${LOGIN_BUTTON}      Login
    Verify Text Is Present In URL       login