*** Settings ***
Documentation          This is a collection of various keywords of the application

#SELENIUM WEB AUTOMATION LIBRARY
Library                SeleniumLibrary

# DATA RESOURCES
Resource                ../Data/LoginData.robot

# KEYWORD LIBRARIES
Resource                ../Keywords/LoginKeywords.robot
Resource                ../Keywords/AdminKeywords.robot
Resource                ../Keywords/DashboardKeywords.robot
Resource                ../Keywords/MyInfoKeywords.robot
Resource                ../Keywords/PimKeywords.robot

# PAGE OBJECT LIBRARIES
Resource                ../PageObjects/UserManagementPageElements.robot
Resource                ../PageObjects/DashboardPageElements.robot
Resource                ../PageObjects/LoginPageElements.robot
Resource                ../PageObjects/MyInfoPageElements.robot
Resource                ../PageObjects/PimPageElements.robot
Resource                ../PageObjects/AddEmployeePageElements.robot
Resource                ../PageObjects/EditEmployeePageElements.robot

*** Keywords ***
Enter Input Element
    [Documentation]    This keyword helps to enter strings into an input field (editable).
    [Arguments]    ${Element}    ${String}
    Wait Until Page Contains Element    ${Element}
    Wait Until Element Is Visible       ${Element}
    Element Should Be Enabled           ${Element}
    Clear Input Element                 ${Element}
    Input Text                          ${Element}    ${String}
#    Highlight Element                   ${Element}
    Log To Console                      \nString :: ${String} Inserted Successfully!

Clear Input Element
    [Documentation]    This keyword helps to clear strings from an input field (editable).
    [Arguments]    ${Element}
    Wait Until Page Contains Element    ${Element}
    Wait Until Element Is Visible       ${Element}
#    Highlight Element                   ${Element}
    Clear Element Text                  ${Element}
    Log To Console                      \nString Cleared Successfully!

Click On Element
    [Documentation]    This keyword helps to click on an element.
    [Arguments]    ${Element}    ${Text}
    Wait Until Page Contains Element    ${Element}
    Wait Until Element Is Visible       ${Element}
#    Scroll                              ${Element}
#    Highlight Element                   ${Element}
    Click Element                       ${Element}
    Log To Console                      \nClicking On :: ${Text}

Select API Environment
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

Verify Element Value Is Present
    [Documentation]    This keyword helps to verify a web element text is present.
    [Arguments]    ${Element}    ${Expected_Text}
    ${Actual_Text}=    Get Value From Element    ${Element}
    Should Be Equal As Strings    ${Actual_Text}    ${Expected_Text}
#    Highlight Element    ${Element}
    Log To Console    \nElement Value Is Present -> Verified :: Expected: ${Expected_Text} || Actual: ${Actual_Text}

Verify Element Is Not Present
    [Documentation]    This keyword helps to verify a web element is not present.
    [Arguments]    ${Element}    ${Text}
    Wait Until Element Is Not Visible    ${Element}
    Page Should Not Contain              ${Element}
    Log To Console    \nElement Is Not Present -> Verified :: ${Text}

Verify Element Is Present
    [Documentation]    This keyword helps to verify a web element is present.
    [Arguments]    ${Element}    ${Text}
    Wait Until Element Is Visible    ${Element}
    Page Should Contain              ${Element}
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
    Wait Until Page Contains Element    ${Element}
#    Highlight Element                   ${Element}
    ${Text}=    Get Text    ${Element}
    Log To Console    \nWeb Element Text :: ${Text}
    RETURN    ${Text}

Get Value From Element
    [Documentation]    This keyword helps to get a web element value.
    [Arguments]    ${Element}
    Wait Until Page Contains Element    ${Element}
#    Highlight Element                   ${Element}
    ${Value}=    Get Value    ${Element}
    Log To Console    \nWeb Element Value :: ${Value}
    RETURN    ${Value}

Suite Startup
    [Documentation]    This will run before every suite
    Open Browser    ${URL}    ${BROWSER}
    Log To Console    \nNavigating to the URL :: ${URL}
    Log To Console    \nBrowser Name :: ${BROWSER}
    Maximize Browser Window
    Log To Console    \nMaximizing the Window.
    # ${driver_path}=        Driver.getdriver    chrome
    # Open Browser           https://pypi.org/project/webdriver-manager/    chrome    executable_path=${driver_path}
    # Go to                  https://pypi.org/project/webdriver-manager/
    # Close Browser

    # open browser           ${url}    ${browser}
    # log    Navigating to the URL: ${url}    console=yes
    # log    Browser Name: ${browser} console=yes
    # maximize browser window
    # log    Maximizing the Window.    console=yes
    # wait until element is visible    ${Prel_Logo}

Suite Shutdown
    [Documentation]    This will run after every suite
    Close Browser
    Log To Console    \nBrowser Closed.
