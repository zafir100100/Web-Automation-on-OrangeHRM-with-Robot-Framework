*** Settings ***
Library    SeleniumLibrary
Resource   ../Data/LoginData.robot
Resource   ../PageObjects/LoginPageElements.robot

*** Keywords ***
Login With Credentials
    [Arguments]    ${username}    ${password}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${USERNAME_INPUT}    10 seconds
    Enter Input Element    ${USERNAME_INPUT}    ${username}
    Enter Input Element    ${PASSWORD_INPUT}    ${password}
    Click On Element    ${LOGIN_BUTTON}     Login

Error Message Apperance
    Wait Until Element Is Visible    ${INVALID_CREDENTIAL_TEXT}    10 seconds

Login Button Disapperance
    Wait Until Element Is Not Visible    ${LOGIN_BUTTON}    10 seconds

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
