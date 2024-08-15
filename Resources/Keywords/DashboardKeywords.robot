*** Settings ***
Library     SeleniumLibrary
Resource    ../PageObjects/DashboardPageElements.robot
Resource    ../Keywords/CommonKeywords.robot


*** Keywords ***
Navigate To PIM Page
    Wait Until Element Is Visible    ${PIM_SIDEBAR_TEXT}    10 seconds
    Click On Element    ${PIM_SIDEBAR_TEXT}    PIM

Navigate To Admin Page
    Wait Until Element Is Visible    ${ADMIN_SIDEBAR_TEXT}    10 seconds
    Click On Element    ${ADMIN_SIDEBAR_TEXT}    Admin

Navigate To My Info Page
    Wait Until Element Is Visible    ${MY_INFO_SIDEBAR_TEXT}    10 seconds
    Click On Element    ${MY_INFO_SIDEBAR_TEXT}    My Info
