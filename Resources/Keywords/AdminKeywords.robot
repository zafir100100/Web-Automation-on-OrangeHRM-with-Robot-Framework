*** Settings ***
Library    SeleniumLibrary
Resource   ../PageObjects/UserManagementPageElements.robot
Resource   ../Keywords/CommonKeywords.robot

*** Keywords ***
Search User
    [Arguments]    ${username}
    Enter Input Element    ${SEARCH_USERNAME_INPUT}      ${username}
    Click On Element    ${SEARCH_BUTTON}        Search

Validate Username From User List
    [Arguments]    ${username}
    Wait Until Element Is Visible    ${TABLE_CELL}/div[text()='${username}']   10 seconds