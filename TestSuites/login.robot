*** Settings ***
Documentation    This suite covers the login functionality of the OrangeHRM application.

# Selenium Web Automation Library
Library          SeleniumLibrary

# Data Resources
Resource         ../Resources/Data/LoginData.robot

# Common Keywords Library
Resource         ../Resources/Keywords/CommonKeywords.robot

*** Test Cases ***
Verify invalid login functionality with incorrect credentials
    [Tags]          UI    Regression    Login
    [Documentation]     To verify that the system displays an error message when invalid credentials are entered.
    Login With Credentials    ${USERNAME2}     ${PASSWORD1}
    Error Message Apperance
    [Teardown]    Close Browser

Verify valid login functionality with correct credentials
    [Tags]          UI    Regression    Login
    [Documentation]     To verify that a user can log in with valid credentials.
    Login With Credentials    ${USERNAME1}     ${PASSWORD1}
    Login Button Disapperance
    [Teardown]    Close Browser