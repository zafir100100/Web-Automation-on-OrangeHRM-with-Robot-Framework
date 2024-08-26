*** Settings ***
Documentation       This is a collection of various keywords of the application

# LIBRARY
Library             RequestsLibrary
Library             Collections
# DATA RESOURCES
Resource            ../Data/GlobalData.robot
# KEYWORD LIBRARIES
Resource            ../Keywords/PostKeywords.robot


*** Keywords ***
Select Environment Variables
    [Arguments]    ${Environment}
    Set Global Variable    ${Environment}
    IF    '${Environment}' == 'sandbox'
        Set Suite Variable    ${Base_Url}    ${Base_Url_Sandbox}
    END
    IF    '${Environment}' == 'dev'
        Set Suite Variable    ${Base_Url}    ${Base_Url_Dev}
    END
    IF    '${Environment}' == 'test'
        Set Suite Variable    ${Base_Url}    ${Base_Url_Test}
    END
    Log To Console    \nSelected Environment :: ${Environment}

Suite StartUp
    [Documentation]    This will run before every suite
    Select Environment Variables    ${Environment}
#    Set Request Headers    ${Environment}
#    Create Request Session    ${Base_Url}

# Create Request Session
#    [Documentation]    This keyword creates a session on the given base URL
#    [Arguments]    ${url}
#    Create Session    mysession    ${url}
#    Log To Console    \nSession Successfully Initialized With The Base URL :: ${url}

# Set Request Headers
#    [Documentation]    This keyword sets request headers.
#    [Arguments]    ${token}
#    ${headers}=    Create Dictionary    Content-Type=application/json    Authorization=${token}
#    Log To Console    \nRequest headers created.
#    [Return]    ${headers}

# Verify Status Code Is
#    [Documentation]    This keyword helps to verify that the HTTP response status code is as expected.
#    [Arguments]    ${response}    ${expected_status}
#    ${actual_status}=    Get From Dictionary    ${response}    status_code
#    Log To Console    \nThis is status code\n
#    Log To Console    ${actual_status}
#    Should Be Equal As Numbers    ${actual_status}    ${expected_status}    \nError: Expected status code was ${expected_status}, but got ${actual_status}
#    Log To Console    \nStatus Code Is Present -> Verified :: Expected: ${expected_status} || Actual: ${actual_status}

Set Request Headers
    [Arguments]    ${token}
    ${REQUEST_HEADERS}=    Create Dictionary    Authorization=Bearer ${token}    Content-Type=application/json
    Log To Console    \nRequest headers are set: ${REQUEST_HEADERS}

Create Request Session
    Create Session    alias=${SESSION_NAME}    url=${Base_Url}    headers=${REQUEST_HEADERS}    disable_warnings=True
    Log To Console    \nRequest session created with base URL: ${base_url}

Request and Response
    [Arguments]    ${method}    ${url}    ${params}    ${data}    ${expected_status}
    IF    '${method}' == 'GET'
        ${RESPONSE}=    GET On Session    alias=${SESSION_NAME}    url=${url}    params=${params}    data=${data}    expected_status=${expected_status}
    ELSE IF    '${method}' == 'POST'
        ${RESPONSE}=    POST On Session    alias=${SESSION_NAME}    url=${url}    data=${data}    expected_status=${expected_status}
    ELSE IF    '${method}' == 'PUT'
        ${RESPONSE}=    PUT On Session    alias=${SESSION_NAME}    url=${url}    data=${data}    expected_status=${expected_status}
    ELSE IF    '${method}' == 'DELETE'
        ${RESPONSE}=    DELETE On Session    alias=${SESSION_NAME}    url=${url}    params=${params}    expected_status=${expected_status}
    ELSE
        Fail    Unsupported HTTP method: ${method}
    END
#    ${pretty_response}=    Evaluate    json.dumps(${RESPONSE.json()}, indent=4)    json
    Log To Console    \nResponse received:
#    Log To Console    \n${pretty_response}
    Log To Console    \n${RESPONSE}

Verify Response Status
    [Arguments]    ${expected_status}    ${expected_message}
    RequestsLibrary.Status Should Be    ${expected_status}
    RequestsLibrary.Status Should Be    ${expected_message}
    Log To Console    \nStatus verification successful: ${expected_status} - ${expected_message}
