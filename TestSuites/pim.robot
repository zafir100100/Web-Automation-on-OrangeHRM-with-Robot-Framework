*** Settings ***
Library    SeleniumLibrary
Resource   ../Resources/Keywords/CommonKeywords.robot
Resource   ../Resources/Data/LoginData.robot
Resource   ../Resources/Keywords/DashboardKeywords.robot
Resource   ../Resources/Keywords/PimKeywords.robot
Resource   ../Resources/Data/CreateEmployeeData.robot

*** Test Cases ***
Create Employee
    [Tags]  Employee
    [Documentation]    Verify that a user can create employee
    Login With Credentials    ${USERNAME1}     ${PASSWORD1}
    Login Button Disapperance
    Click On PIM Sidebar
    Create Employee   ${FIRST_NAME_1}     ${LAST_NAME_1}
    Validate Employee Name   ${FIRST_NAME_1}     ${LAST_NAME_1}
    [Teardown]    Close Browser