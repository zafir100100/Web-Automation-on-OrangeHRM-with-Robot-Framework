*** Settings ***
Documentation          This is a collection of various keywords of the application

##SELENIUM WEB AUTOMATION LIBRARY
#Library                SeleniumLibrary
#Library                Screenshot
#Library                BuiltIn
#
## DATA RESOURCES
#Resource                ../Data/LoginData.robot
#Resource                ../Data/UpdateProfileData.robot
#Resource                ../Data/GlobalData.robot
#Resource                ../Data/CreateEmployeeData.robot
#
## KEYWORD LIBRARIES
#Resource                ../Keywords/LoginKeywords.robot
#Resource                ../Keywords/AdminKeywords.robot
#Resource                ../Keywords/DashboardKeywords.robot
#Resource                ../Keywords/MyInfoKeywords.robot
#Resource                ../Keywords/PimKeywords.robot
#Resource                ../Keywords/UserAccountOptionKeywords.robot
#
## PAGE OBJECT LIBRARIES
#Resource                ../PageObjects/UserManagementPageElements.robot
#Resource                ../PageObjects/DashboardPageElements.robot
#Resource                ../PageObjects/LandingPageElements.robot
#Resource                ../PageObjects/MyInfoPageElements.robot
#Resource                ../PageObjects/PimPageElements.robot
#Resource                ../PageObjects/AddEmployeePageElements.robot
#Resource                ../PageObjects/EditEmployeePageElements.robot
#Resource                ../PageObjects/UserAccountOptionPageElements.robot

*** Keywords ***
Select Environment Variables
    [Arguments]    ${Environment}
    Set Global Variable    ${Environment}
    Run Keyword If    '${Environment}' == 'sandbox'    Set Suite Variable    ${Base_Url}    ${Base_Url_Sandbox}
    Run Keyword If    '${Environment}' == 'dev'        Set Suite Variable    ${Base_Url}    ${Base_Url_Dev}
    Run Keyword If    '${Environment}' == 'test'       Set Suite Variable    ${Base_Url}    ${Base_Url_Test}