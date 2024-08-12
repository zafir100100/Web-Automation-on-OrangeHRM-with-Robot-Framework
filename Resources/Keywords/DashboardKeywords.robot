*** Settings ***
Library    SeleniumLibrary
Resource   ../PageObjects/DashboardPageElements.robot

*** Keywords ***
Click On PIM Sidebar
    Wait Until Element Is Visible    ${PIM_SIDEBAR_TEXT}    10 seconds
    Click Element  ${PIM_SIDEBAR_TEXT}

Click On Admin Sidebar
    Wait Until Element Is Visible    ${ADMIN_SIDEBAR_TEXT}    10 seconds
    Click Element  ${ADMIN_SIDEBAR_TEXT}

Click On My Info Sidebar
    Wait Until Element Is Visible    ${MY_INFO_SIDEBAR_TEXT}    10 seconds
    Click Element  ${MY_INFO_SIDEBAR_TEXT}