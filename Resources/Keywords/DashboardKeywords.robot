*** Settings ***
Library    SeleniumLibrary
Resource   ../PageObjects/DashboardPageElements.robot

*** Keywords ***
Click On PIM Sidebar
    Wait Until Element Is Visible    ${PIM_SIDEBAR_TEXT}    10 seconds
    Click On Element  ${PIM_SIDEBAR_TEXT}       PIM

Click On Admin Sidebar
    Wait Until Element Is Visible    ${ADMIN_SIDEBAR_TEXT}    10 seconds
    Click On Element  ${ADMIN_SIDEBAR_TEXT}     Admin

Click On My Info Sidebar
    Wait Until Element Is Visible    ${MY_INFO_SIDEBAR_TEXT}    10 seconds
    Click On Element  ${MY_INFO_SIDEBAR_TEXT}       My Info