*** Settings ***
Resource    ../Keywords/CommonKeywords.robot

*** Keywords ***
Search User
    [Arguments]    ${username}
    Enter Input Element    ${SEARCH_USERNAME_INPUT}    ${username}
    Click On Element    ${SEARCH_BUTTON}    Search
    Wait Until Page Contains Element    ${SEARCH_RESULT_COUNT_TEXT}
    Wait Until Element Is Visible    ${SEARCH_RESULT_COUNT_TEXT}
    ${Actual_Text}=    Get Text From Element    ${SEARCH_RESULT_COUNT_TEXT}
    ${Expected_Text}=    Set Variable    Found
    Should Contain    ${Actual_Text}    ${Expected_Text}    "The search results did not contain the expected text: '${Expected_Text}'"

Get User Locator
    [Documentation]    This keyword returns the XPath for locating a specific username in a table cell.
    [Arguments]    ${username}
    ${XPath}=    Set Variable    ${TABLE_CELL}/div[text()='${username}']
    RETURN    ${XPath}

Verify That User Exists In The Search Result
    [Arguments]    ${username}
    ${XPath}=    Get User Locator    ${username}
    Wait Until Page Contains Element    ${XPath}
    Wait Until Element Is Visible    ${XPath}
    Log To Console    \nVerified that user '${username}' exists in the list.
