#*** Settings ***
#Resource               ../Resources/Home.robot
#Resource               ../Resources/Utilities.robot
#Resource               ../Resources/Helper/HelperKeywords.robot
#
#Suite Setup            Suite Starting
#Suite Teardown         Cleaning Up Resources
#
#*** Test Cases ***
#New Holidays List with Value Team and No Params
#    [Documentation]    New Regression : Verify if user can get the Holidays List with a valid team and no optional params
#    Create Request Session    ${session}    ${token}
#    Request and Response      ${session}    /holidays    ${headers}    ${body}
#    Verify Status Code Is    ${response}    200
#    ${parsed}    Parse Json To Dict    ${response.content}
#    ${holidays}    Evaluate    [x for x in $parsed['holidays']]    ${locals}    $globals
#    Log To Console    ${holidays}
#    Verify    '${holidays}[0]["status"]' == 'SUCCESS'    1     Holiday request returned successfully
#
#New Holidays List with Value Team and Valid Optional Params
#    [Documentation]    New Regression : Verify if user can get the Holidays List with a valid team and valid optional params
#    Create Request Session    ${session}    ${token}
#    Request and Response      ${session}    /holidays    ${headers}    ${body}
#    Verify Status Code Is    ${response}    200
#    ${parsed}    Parse Json To Dict    ${response.content}
#    ${holidays}    Evaluate    [x for x in $parsed['holidays']]    ${locals}    $globals
#    Log To Console    ${holidays}
#    Verify    '${holidays}[0]["status"]' == 'SUCCESS'    1     Holiday request returned successfully
#
#New Holidays List with Invalid Team and Invalid Optional Params
#    [Documentation]    New Regression : Verify if user cannot get the Holidays List with an invalid team and invalid optional params
#    Create Request Session    ${session}    ${token}
#    Request and Response      ${session}    /holidays    ${headers}    ${body}
#    Verify Status Code Is    ${response}    400
#    ${parsed}    Parse Json To Dict    ${response.content}
#    ${error}      Get From Dictionary    ${parsed}    error
#    Log To Console    ${error}
#    Verify    '${error}' == 'INVALID_TEAM'    1     Invalid team error returned
#
#New Holidays List with Invalid Team and No Params
#    [Documentation]    New Regression : Verify if user cannot get the Holidays List with an invalid team and no optional params
#    Create Request Session    ${session}    ${token}
#    Request and Response      ${session}    /holidays    ${headers}    ${body}
#    Verify Status Code Is    ${response}    400
#    ${parsed}    Parse Json To Dict    ${response.content}
#    ${error}      Get From Dictionary    ${parsed}    error
#    Log To Console    ${error}
#    Verify    '${error}' == 'INVALID_TEAM'    1     Invalid team error returned
