*** Settings ***
Documentation       This suite covers the functionalities related to profile information management within the My Info module of OrangeHRM.

# SUITE LIBRARIES
Suite Setup    Suite Startup
Suite Teardown    Suite Shutdown

# Common Keywords Library
Resource            ../Resources/Keywords/CommonKeywords.robot

*** Test Cases ***
Verify update own profile functionality in My Info module
    [Documentation]    To verify that a user can update this own profile in the My Info module.
    [Tags]    ui    regression    my_info
    Login With Valid Credentials    ${USERNAME1}    ${PASSWORD1}
    Navigate To My Info Page
    Update Profile Info    ${UPDATE_PROFILE_MIDDLE_NAME}
    Log Out
    Capture Page Screenshot    Verify update own profile functionality in My Info module.png
