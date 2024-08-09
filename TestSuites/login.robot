*** Settings ***
Library    SeleniumLibrary
Resource   ../Resources/PageObjects/LoginPageElements.robot
Resource   ../Resources/Keywords/LoginKeywords.robot

*** Test Cases ***
Invalid Login Test
    [Documentation]    Verify that a user cannot log in with invalid credentials
    Login With Credentials    invalidUser    invalidPassword
    [Teardown]    Close Browser

Valid Login Test
    [Documentation]    Verify that a user can log in with valid credentials
    Login With Credentials    admin    admin123
    [Teardown]    Close Browser