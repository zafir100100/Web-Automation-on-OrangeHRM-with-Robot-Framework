*** Settings ***
Resource    ../Keywords/CommonKeywords.robot

*** Keywords ***
Navigate To PIM Page
    Fluent Wait     ${PIM_SIDEBAR_TEXT}
    Click On Element    ${PIM_SIDEBAR_TEXT}    PIM

Navigate To Admin Page
    Fluent Wait     ${PIM_SIDEBAR_TEXT}
    Click On Element    ${ADMIN_SIDEBAR_TEXT}    Admin

Navigate To My Info Page
    Fluent Wait     ${PIM_SIDEBAR_TEXT}
    Click On Element    ${MY_INFO_SIDEBAR_TEXT}    My Info
