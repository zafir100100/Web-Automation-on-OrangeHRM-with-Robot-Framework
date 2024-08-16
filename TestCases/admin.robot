*** Settings ***
Documentation       This suite covers the functionalities related to the Admin module of OrangeHRM.

# SUITE LIBRARIES
Suite Setup    Suite Startup
Suite Teardown    Suite Shutdown

# Common Keywords Library
Resource            ../Resources/Keywords/CommonKeywords.robot

*** Test Cases ***
Verify user search functionality in Admin module
    [Documentation]    To verify that an admin can search employee in the Admin module.
    [Tags]    ui    regression    admin
    Login With Valid Credentials    ${USERNAME1}    ${PASSWORD1}
    Navigate To Admin Page
    Search User    ${USERNAME1}
    Verify That User Exists In The Search Result    ${USERNAME1}
    Log Out
    Capture Page Screenshot    Verify user search functionality in Admin module.png
