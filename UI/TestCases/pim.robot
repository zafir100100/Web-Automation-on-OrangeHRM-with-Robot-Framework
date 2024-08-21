*** Settings ***
Documentation       This suite covers the functionalities related to employee management within the PIM module of OrangeHRM.

# SUITE LIBRARIES
Suite Setup    Suite Startup
Suite Teardown    Suite Shutdown

# Common Keywords Library
Resource            ../Resources/Keywords/CommonKeywords.robot

*** Test Cases ***
Verify employee creation functionality in PIM module
    [Documentation]    To verify that an admin can create a new employee in the PIM module.
    [Tags]    UI    Regression    PIM
    Login With Valid Credentials    ${USERNAME1}    ${PASSWORD1}
    Navigate To PIM Page
    Create Employee    ${FIRST_NAME_1}    ${LAST_NAME_1}
    Capture Page Screenshot
    Log Out