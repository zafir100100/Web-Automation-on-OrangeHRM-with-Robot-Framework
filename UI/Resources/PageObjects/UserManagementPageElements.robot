*** Variables ***
${SEARCH_USERNAME_INPUT}     (//input)[2]
${SEARCH_BUTTON}     //button[@type='submit']
${TABLE_CELL}        //div[@role='row']/div[@role='cell']/div
${SEARCH_RESULT_COUNT_TEXT}     //div/span[@class='oxd-text oxd-text--span']

*** Keywords ***
Get User Locator
    [Documentation]    This keyword returns the XPath for locating a specific username in a table cell.
    [Arguments]    ${username}
    ${XPath}=    Set Variable    ${TABLE_CELL}\[text()='${username}']
#    Log To Console    ${XPath}
    RETURN    ${XPath}