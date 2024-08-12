*** Settings ***
Documentation    This suite covers the functionalities related to profile information management within the My Info module of OrangeHRM.

# Selenium Web Automation Library
Library    SeleniumLibrary

# Data Resources
Resource   ../Resources/Data/LoginData.robot
Resource   ../Resources/Data/UpdateProfileData.robot

# Common Keywords Library
Resource   ../Resources/Keywords/CommonKeywords.robot

# Dashboard Keywords Library
Resource   ../Resources/Keywords/DashboardKeywords.robot

# My Info Keywords Library
Resource   ../Resources/Keywords/MyInfoKeywords.robot

*** Test Cases ***
Verify update own profile functionality in My Info module
    [Tags]          UI    Regression    My_Info
    [Documentation]     To verify that a user can update this own profile in the My Info module.
    Login With Credentials    ${USERNAME1}     ${PASSWORD1}
    Login Button Disapperance
    Click On My Info Sidebar
    Update My Info    ${UPDATE_PROFILE_MIDDLE_NAME}
    [Teardown]    Close Browser