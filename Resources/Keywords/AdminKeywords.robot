*** Settings ***
Library    SeleniumLibrary
Resource   ../PageObjects/UserManagementPageElements.robot

*** Keywords ***
Search User
    [Arguments]    ${username}
    Wait Until Element Is Visible    ${SEARCH_USERNAME_INPUT}    10 seconds
    Input Text    ${SEARCH_USERNAME_INPUT}    ${username}
    Click Button    ${SEARCH_BUTTON}

Validate Username From User List
    [Arguments]    ${username}
    Wait Until Element Is Visible    ${TABLE_CELL}/div[text()='${username}']   10 seconds