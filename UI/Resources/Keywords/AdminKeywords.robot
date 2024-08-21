*** Settings ***
Resource    ../Keywords/CommonKeywords.robot

*** Keywords ***
Search User
    [Arguments]    ${username}
    Enter Input Element    ${SEARCH_USERNAME_INPUT}    ${username}
    Click On Element    ${SEARCH_BUTTON}    Search
    Verify That Search Result Is Loaded

Verify That Search Result Is Loaded
    Verify Element Is Present    ${SEARCH_RESULT_COUNT_TEXT}    Record(s) Found
    ${Actual_Text}=    Get Text From Element    ${SEARCH_RESULT_COUNT_TEXT}
    ${Expected_Text}=    Set Variable    Found
    Should Contain    ${Actual_Text}    ${Expected_Text}    "The search results did not contain the expected text: '${Expected_Text}'"

Verify That User Exists In The Search Result
    [Arguments]    ${username}
    ${XPath}=    Get User Locator    ${username}
    Verify Element Is Present    ${XPath}    Table Row Containing ${username}
    Log To Console    \nVerified that user '${username}' exists in the search result.
