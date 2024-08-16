*** Settings ***
Documentation       This suite covers the functionalities related to the Admin module of OrangeHRM.

# Selenium Web Automation Library
Library             SeleniumLibrary
# Data Resources
Resource            ../Resources/Data/LoginData.robot
# Common Keywords Library
Resource            ../Resources/Keywords/CommonKeywords.robot


*** Test Cases ***
Verify user search functionality in Admin module
    [Documentation]    To verify that an admin can search employee in the Admin module.
    [Tags]    ui    regression    admin
    Login With Credentials    ${USERNAME1}    ${PASSWORD1}
    Navigate To Admin Page
    Search User    ${USERNAME1}
    Verify That User Exists In The Search Result    ${USERNAME1}
    Capture Page Screenshot    Verify user search functionality in Admin module.png
    [Teardown]    Close Browser
