*** Settings ***
Resource    ../Keywords/CommonKeywords.robot


*** Keywords ***
Update Profile Info
    [Arguments]    ${middle_name}
    Enter Input Element    ${MIDDLE_NAME_INPUT}    ${middle_name}
    Wait Until Element Is Ready    ${SAVE_PERSONAL_DETAILS_BUTTON}
#    Wait Until Element Is Enabled    ${SAVE_PERSONAL_DETAILS_BUTTON}
    Sleep    1
    Click On Element    ${SAVE_PERSONAL_DETAILS_BUTTON}    Save
    Verify That Profile Info Is Saved Successfully

Verify That Profile Info Is Saved Successfully
    Verify Element Is Present    ${SAVE_PERSONAL_DETAILS_BUTTON}    Save Button
    Verify Element Text Is Present    ${SAVE_PERSONAL_DETAILS_BUTTON}   Save
