*** Settings ***
Library    SeleniumLibrary
Resource   ../PageObjects/PimPageElements.robot
Resource   ../PageObjects/AddEmployeePageElements.robot
Resource   ../PageObjects/EditEmployeePageElements.robot
Resource   ../Keywords/CommonKeywords.robot

*** Keywords ***
Create Employee
    [Arguments]    ${first_name}    ${last_name}
    Click On Element    ${EMPLOYEE_ADD_BUTTON}      Add Employee
    Enter Input Element    ${EMPLOYEE_FIRST_NAME_INPUT}    ${first_name}
    Enter Input Element    ${EMPLOYEE_LAST_NAME_INPUT}    ${last_name}
    Click On Element    ${EMPLOYEE_SAVE_BUTTON}     Save

Validate Employee Name
    [Arguments]    ${first_name}    ${last_name}
    Wait Until Element Is Visible    ${EMPLOYEE_FIRST_NAME_INPUT}    10 seconds
    ${expected_value}=    Set Variable    ${first_name} ${last_name}
    ${actual_first_name}=    Get Value    ${EMPLOYEE_FIRST_NAME_INPUT}
    ${actual_last_name}=    Get Value    ${EMPLOYEE_LAST_NAME_INPUT}
    ${actual_value}=    Set Variable    ${actual_first_name} ${actual_last_name}
    Should Be Equal As Strings    ${actual_value}    ${expected_value}    Employee name does not match expected value.