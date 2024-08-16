*** Settings ***
Documentation    This suite covers the login functionality of the OrangeHRM application.

# SUITE LIBRARIES
Suite Setup    Suite Startup
Suite Teardown    Suite Shutdown

# Common Keywords Library
Resource         ../Resources/Keywords/CommonKeywords.robot

*** Test Cases ***
Verify invalid login functionality with incorrect credentials
    [Tags]          UI    Regression    Login
    [Documentation]     To verify that the system displays an error message when invalid credentials are entered.
    Login With Invalid Credentials    ${USERNAME2}     ${PASSWORD1}
    Capture Page Screenshot     Verify invalid login functionality with incorrect credentials.png

Verify valid login functionality with correct credentials
    [Tags]          UI    Regression    Login
    [Documentation]     To verify that a user can log in with valid credentials.
    Login With Valid Credentials    ${USERNAME1}     ${PASSWORD1}
    Log Out
    Capture Page Screenshot     Verify valid login functionality with correct credentials.png