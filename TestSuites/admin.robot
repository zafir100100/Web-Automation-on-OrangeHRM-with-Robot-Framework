*** Settings ***
Documentation    This suite covers the functionalities related to the Admin module of OrangeHRM.

# Selenium Web Automation Library
Library    SeleniumLibrary

# Data Resources
Resource   ../Resources/Data/LoginData.robot

# Common Keywords Library
Resource   ../Resources/Keywords/CommonKeywords.robot

# Dashboard Keywords Library
Resource   ../Resources/Keywords/DashboardKeywords.robot

# Admin Keywords Library
Resource   ../Resources/Keywords/AdminKeywords.robot

*** Test Cases ***
Verify user search functionality in Admin module
    [Tags]          UI    Regression    Admin
    [Documentation]     To verify that an admin can search employee in the Admin module.
    Login With Credentials    ${USERNAME1}     ${PASSWORD1}
    Login Button Disapperance
    Click On Admin Sidebar
    Search User    ${USERNAME1}
    Validate Username From User List   ${USERNAME1}
    [Teardown]    Close Browser
