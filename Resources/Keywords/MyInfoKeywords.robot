*** Settings ***
Resource    ../Keywords/CommonKeywords.robot


*** Keywords ***
Update Profile Info
    [Arguments]    ${middle_name}
    Enter Input Element    ${MIDDLE_NAME_INPUT}    ${middle_name}
    Sleep   5
    Click On Element    ${SAVE_PERSONAL_DETAILS_BUTTON}    Save
