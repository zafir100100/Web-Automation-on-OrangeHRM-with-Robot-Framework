*** Settings ***
Library    SeleniumLibrary
Resource   ../Data/LoginData.robot
Resource   ../PageObjects/LoginPageElements.robot

*** Keywords ***
Login With Credentials
    [Arguments]    ${username}    ${password}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Enter Input Element    ${USERNAME_INPUT}    ${username}
    Enter Input Element    ${PASSWORD_INPUT}    ${password}
    Click On Element    ${LOGIN_BUTTON}     Login

Error Message Apperance
    Wait Until Page Contains Element    ${INVALID_CREDENTIAL_TEXT}
    Wait Until Element Is Visible       ${INVALID_CREDENTIAL_TEXT}
    Verify Element Text Is Present      ${INVALID_CREDENTIAL_TEXT}      Invalid credentials

Login Button Disapperance
    Verify Element Is Not Present       ${LOGIN_BUTTON}     Login

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