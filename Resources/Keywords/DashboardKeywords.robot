*** Settings ***
Library    SeleniumLibrary
Resource   ../PageObjects/DashboardPageElements.robot

*** Keywords ***
Click On PIM Sidebar
    Wait Until Element Is Visible    ${PIM_SIDEBAR_TEXT}    10 seconds
    Click Element  ${PIM_SIDEBAR_TEXT}