*** Settings ***
Documentation       This suite covers the functionalities related to employee management within the PIM module of OrangeHRM.

# Selenium Web Automation Library
Library             SeleniumLibrary
# Data Resources
Resource            ../Resources/Data/LoginData.robot
Resource            ../Resources/Data/CreateEmployeeData.robot
# Common Keywords Library
Resource            ../Resources/Keywords/CommonKeywords.robot
# Dashboard Keywords Library
Resource            ../Resources/Keywords/DashboardKeywords.robot
# PIM Keywords Library
Resource            ../Resources/Keywords/PimKeywords.robot


*** Test Cases ***
Verify employee creation functionality in PIM module
    [Documentation]    To verify that an admin can create a new employee in the PIM module.
    [Tags]    ui    regression    pim
    Login With Credentials    ${USERNAME1}    ${PASSWORD1}
    Navigate To PIM Page
    Create Employee    ${FIRST_NAME_1}    ${LAST_NAME_1}
    Validate Employee Name    ${FIRST_NAME_1}    ${LAST_NAME_1}
    Capture Page Screenshot    Verify employee creation functionality in PIM module.png
    [Teardown]    Close Browser
