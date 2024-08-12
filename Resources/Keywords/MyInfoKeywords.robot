*** Settings ***
Library    SeleniumLibrary
Resource   ../PageObjects/MyInfoPageElements.robot

*** Keywords ***
Update My Info
    [Arguments]    ${middle_name}
    Wait Until Element Is Visible    ${MIDDLE_NAME_INPUT}    10 seconds
    Input Text    ${MIDDLE_NAME_INPUT}    ${middle_name}
    Sleep    10
    Click Button    ${SAVE_PERSONAL_DETAILS_BUTTON}