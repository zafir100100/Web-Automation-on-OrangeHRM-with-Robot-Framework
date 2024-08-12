*** Settings ***
Library    SeleniumLibrary
Resource   ../PageObjects/PimPageElements.robot
Resource   ../PageObjects/AddEmployeePageElements.robot
Resource   ../PageObjects/EditEmployeePageElements.robot

*** Keywords ***
Create Employee
    [Arguments]    ${first_name}    ${last_name}
    Wait Until Element Is Visible    ${EMPLOYEE_ADD_BUTTON}    10 seconds
    Click Element    ${EMPLOYEE_ADD_BUTTON}
    Wait Until Element Is Visible    ${EMPLOYEE_FIRST_NAME_INPUT}    10 seconds
    Input Text    ${EMPLOYEE_FIRST_NAME_INPUT}    ${first_name}
    Input Text    ${EMPLOYEE_LAST_NAME_INPUT}    ${last_name}
    Click Button    ${EMPLOYEE_SAVE_BUTTON}

Validate Employee Name
    [Arguments]    ${first_name}    ${last_name}
    Wait Until Element Is Visible    ${EMPLOYEE_FIRST_NAME_INPUT}    10 seconds
    ${expected_value}=    Set Variable    ${first_name} ${last_name}
    ${actual_first_name}=    Get Value    ${EMPLOYEE_FIRST_NAME_INPUT}
    ${actual_last_name}=    Get Value    ${EMPLOYEE_LAST_NAME_INPUT}
    ${actual_value}=    Set Variable    ${actual_first_name} ${actual_last_name}
    Should Be Equal As Strings    ${actual_value}    ${expected_value}    Employee name does not match expected value.