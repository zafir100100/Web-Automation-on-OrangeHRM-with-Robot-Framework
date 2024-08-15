*** Settings ***
Library     SeleniumLibrary
Resource    ../PageObjects/MyInfoPageElements.robot
Resource    ../Keywords/CommonKeywords.robot


*** Keywords ***
Update Profile Info
    [Arguments]    ${middle_name}
    Wait Until Element Is Visible    ${MIDDLE_NAME_INPUT}    10 seconds
    Enter Input Element    ${MIDDLE_NAME_INPUT}    ${middle_name}
    # Sleep    10
    Click On Element    ${SAVE_PERSONAL_DETAILS_BUTTON}    Save
