*** Settings ***
Resource   ../Keywords/CommonKeywords.robot

*** Keywords ***
Click User Profile Icon On The Topmost Right Side
    Click On Element    ${Profile_Icon}     User Profile Icon

Click Logout Button
    Click On Element    ${Logout_Text}     Logout

Log Out
    Click User Profile Icon On The Topmost Right Side
    Click Logout Button
    Verify That User Is Successfully Logged Out

Verify That User Is Successfully Logged Out
    Verify Element Is Present    ${LOGIN_BUTTON}    Login Button
    Verify Element Text Is Present      ${LOGIN_BUTTON}      Login
    Verify Text Is Present In URL       login