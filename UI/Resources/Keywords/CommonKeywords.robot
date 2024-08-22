*** Settings ***
Documentation          This is a collection of various keywords of the application

#SELENIUM WEB AUTOMATION LIBRARY
Library                SeleniumLibrary
Library                Screenshot
Library                BuiltIn

# DATA RESOURCES
Resource                ../Data/LoginData.robot
Resource                ../Data/UpdateProfileData.robot
Resource                ../Data/GlobalData.robot
Resource                ../Data/CreateEmployeeData.robot

# KEYWORD LIBRARIES
Resource                ../Keywords/LoginKeywords.robot
Resource                ../Keywords/AdminKeywords.robot
Resource                ../Keywords/DashboardKeywords.robot
Resource                ../Keywords/MyInfoKeywords.robot
Resource                ../Keywords/PimKeywords.robot
Resource                ../Keywords/UserAccountOptionKeywords.robot

# PAGE OBJECT LIBRARIES
Resource                ../PageObjects/UserManagementPageElements.robot
Resource                ../PageObjects/DashboardPageElements.robot
Resource                ../PageObjects/LandingPageElements.robot
Resource                ../PageObjects/MyInfoPageElements.robot
Resource                ../PageObjects/PimPageElements.robot
Resource                ../PageObjects/AddEmployeePageElements.robot
Resource                ../PageObjects/EditEmployeePageElements.robot
Resource                ../PageObjects/UserAccountOptionPageElements.robot

*** Keywords ***
Wait Until Element Is Ready
    [Documentation]    This keyword waits until the element is present on the page and is visible.
    [Arguments]    ${Element}
    Wait Until Page Contains Element    ${Element}
    Wait Until Element Is Visible       ${Element}
    Wait Until Element Is Enabled       ${Element}
    Log To Console                      \nElement Is Ready!

Enter Input Element
    [Documentation]    This keyword helps to enter strings into an input field (editable).
    [Arguments]    ${Element}    ${String}
    Wait Until Element Is Ready     ${Element}
    Element Should Be Enabled           ${Element}
    Clear Input Element                 ${Element}
    Input Text                          ${Element}    ${String}
#    Highlight Element                   ${Element}
    Log To Console                      \nString :: ${String} Inserted Successfully!

Clear Input Element
    [Documentation]    This keyword helps to clear strings from an input field (editable).
    [Arguments]    ${Element}
    Wait Until Element Is Ready     ${Element}
#    Highlight Element                   ${Element}
    Clear Element Text                  ${Element}
    Log To Console                      \nString Cleared Successfully!

Click On Element
    [Documentation]    This keyword helps to click on an element.
    [Arguments]    ${Element}    ${Text}
    Wait Until Element Is Ready     ${Element}
    Element Should Be Enabled           ${Element}
#    Scroll                              ${Element}
#    Highlight Element                   ${Element}
    Click Element                       ${Element}
    Log To Console                      \nClicking On :: ${Text}

Select Environment Variables
    [Arguments]    ${Environment}
    Set Global Variable    ${Environment}
    Run Keyword If    '${Environment}' == 'sandbox'    Set Suite Variable    ${Base_Url}    ${Base_Url_Sandbox}
    Run Keyword If    '${Environment}' == 'dev'        Set Suite Variable    ${Base_Url}    ${Base_Url_Dev}
    Run Keyword If    '${Environment}' == 'test'       Set Suite Variable    ${Base_Url}    ${Base_Url_Test}

Verify Element Text Is Present
    [Documentation]    This keyword helps to verify a web element text is present.
    [Arguments]    ${Element}    ${Expected_Text}
    ${Actual_Text}=    Get Text    ${Element}
    Should Be Equal As Strings    ${Actual_Text}    ${Expected_Text}
#    Highlight Element    ${Element}
    Log To Console    \nElement Text Is Present -> Verified :: Expected: ${Expected_Text} || Actual: ${Actual_Text}

# Verify Element Value Is Present
#     [Documentation]    This keyword helps to verify a web element text is present.
#     [Arguments]    ${Element}    ${Expected_Text}
#     ${Actual_Text}=    Get Value From Element    ${Element}
#     Should Be Equal As Strings    ${Actual_Text}    ${Expected_Text}
# #    Highlight Element    ${Element}
#     Log To Console    \nElement Value Is Present -> Verified :: Expected: ${Expected_Text} || Actual: ${Actual_Text}

Verify Element Is Not Present
    [Documentation]    This keyword helps to verify a web element is not present.
    [Arguments]    ${Element}    ${Text}
    Wait Until Element Is Not Visible    ${Element}
    Page Should Not Contain              ${Element}
    Log To Console    \nElement Is Not Present -> Verified :: ${Text}

Verify Element Is Present
    [Documentation]    This keyword helps to verify a web element is present.
    [Arguments]    ${Element}    ${Text}
    Wait Until Element Is Ready     ${Element}
    Log To Console    \nElement Is Present -> Verified :: ${Text}

Verify Text Is Present In URL
    [Documentation]    This keyword helps to verify that a specified text is present in the current URL.
    [Arguments]    ${Expected_Text}
    ${Current_URL}=    Get Location
    Should Contain    ${Current_URL}    ${Expected_Text}
    Log To Console    \n'${Expected_Text}' Is Present In URL -> Verified :: ${Current_URL}

Get Text From Element
    [Documentation]    This keyword helps to get a web element text.
    [Arguments]    ${Element}
    Wait Until Element Is Ready     ${Element}
#    Highlight Element                   ${Element}
    ${Text}=    Get Text    ${Element}
    Log To Console    \nWeb Element Text :: ${Text}
    RETURN    ${Text}

Get Value From Element
    [Documentation]    This keyword helps to get a web element value.
    [Arguments]    ${Element}
    Wait Until Element Is Ready     ${Element}
#    Highlight Element                   ${Element}
    ${Value}=    Get Value    ${Element}
    Log To Console    \nWeb Element Value :: ${Value}
    RETURN    ${Value}

Navigate To Landing Page
    Go To    ${Base_Url}/web/index.php/auth/login
    Log To Console    \nNavigating to the URL :: ${Base_Url}/web/index.php/auth/login

Suite Startup
    [Documentation]    This will run before every suite
    Set Selenium Implicit Wait    10s
    Log To Console    \nSelenium Implicit Wait is Set to 10s.
    Select Environment Variables    ${Environment}
    Log To Console    \nSelected Environment :: ${Environment}

Test Startup
    [Documentation]    This will run before every test case
    Open Browser    about:blank     ${BROWSER}
    Log To Console    \nBrowser Opened.
    Log To Console    \nBrowser Name :: ${BROWSER}
#    Maximize Browser Window
#    Log To Console    \nMaximizing the Window.
    Set Window Size    ${BROWSER_WIDTH}    ${BROWSER_HEIGHT}
    Log To Console    \nSetting Window Size to Width: ${BROWSER_WIDTH} and Height: ${BROWSER_HEIGHT}.
    Navigate To Landing Page
    Wait until Element visibility succeeds        ${OrangeHRM_Logo}
    Log To Console    \nOrangeHRM Logo is Visible.

Test Shutdown
    [Documentation]    This will run after every test case
    Close Browser
    Log To Console    \nBrowser Closed.

Wait until Element visibility succeeds
    [Arguments]    ${Locator}
    BuiltIn.wait until keyword succeeds    5x    20 seconds    Wait Until Element Is Visible    ${Locator}

#Wait until Text visibility succeeds
#    [Arguments]    ${Text}
#    BuiltIn.wait until keyword succeeds    3x    20 seconds    Wait Until Page Contains    ${Text}

Fluent Wait
    [Arguments]    ${Locator}
    BuiltIn.wait until keyword succeeds    10x    5 seconds    Wait Until Element Is Visible    ${Locator}

#Check If Browser Is Open
#    ${browser_ids}=    Get Browser Ids
#    Run Keyword If    '${browser_ids}' == '[]'    Run Keywords    Suite Startup
