*** Settings ***
Library    SeleniumLibrary
Resource   ../Resources/PageObjects/LoginPageElements.robot
Resource   ../Resources/Keywords/CommonKeywords.robot
Resource   ../Resources/Data/LoginData.robot

*** Test Cases ***
Invalid Login Test
    [Tags]  Login
    [Documentation]    Verify that a user cannot log in with invalid credentials
    Login With Credentials    ${USERNAME2}     ${PASSWORD1}
    Error Message Apperance
    [Teardown]    Close Browser

Valid Login Test
    [Tags]  Login
    [Documentation]    Verify that a user can log in with valid credentials
    Login With Credentials    ${USERNAME1}     ${PASSWORD1}
    Login Button Disapperance
    [Teardown]    Close Browser