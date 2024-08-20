*** Settings ***
Resource    ../Keywords/CommonKeywords.robot


*** Keywords ***
Update Profile Info
    [Arguments]    ${middle_name}
    Enter Input Element    ${MIDDLE_NAME_INPUT}    ${middle_name}
    Wait Until Element Is Enabled    ${SAVE_PERSONAL_DETAILS_BUTTON}
    Sleep    2
    Click On Element    ${SAVE_PERSONAL_DETAILS_BUTTON}    Save
    Verify That Profile Info Is Saved Successfully

Verify That Profile Info Is Saved Successfully
    Wait Until Page Contains Element    ${SAVE_PERSONAL_DETAILS_BUTTON}
    Wait Until Element Is Visible    ${SAVE_PERSONAL_DETAILS_BUTTON}
    Wait Until Element Is Enabled    ${SAVE_PERSONAL_DETAILS_BUTTON}
    Verify Element Text Is Present    ${SAVE_PERSONAL_DETAILS_BUTTON}   Save
