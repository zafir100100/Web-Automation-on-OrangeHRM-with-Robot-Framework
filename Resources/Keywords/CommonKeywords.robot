*** Settings ***
Library    SeleniumLibrary
Resource   ../Data/LoginData.robot
Resource   ../PageObjects/LoginPageElements.robot
Resource   ../PageObjects/DashboardPageElements.robot

*** Keywords ***
Login With Credentials
    [Arguments]    ${username}    ${password}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Enter Input Element    ${USERNAME_INPUT}    ${username}
    Enter Input Element    ${PASSWORD_INPUT}    ${password}
    Click On Element    ${LOGIN_BUTTON}     Login

Verify That Failed Login Error Message Is Displayed
    Wait Until Page Contains Element    ${INVALID_CREDENTIAL_TEXT}
    Wait Until Element Is Visible       ${INVALID_CREDENTIAL_TEXT}
    Verify Element Text Is Present      ${INVALID_CREDENTIAL_TEXT}      Invalid credentials

Verify That After Successful Login Dashboard Page Is Displayed
    Verify Element Is Not Present       ${LOGIN_BUTTON}     Login
    Verify Text Is Present In URL       dashboard
    Wait Until Page Contains Element    ${DASHBOARD_SIDEBAR_TEXT}
    Wait Until Element Is Visible       ${DASHBOARD_SIDEBAR_TEXT}
    Verify Element Text Is Present      ${DASHBOARD_SIDEBAR_TEXT}      Dashboard

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