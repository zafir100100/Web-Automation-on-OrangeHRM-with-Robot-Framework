*** Settings ***
Documentation       This is a collection of various keywords of the application

# Common Keywords Library
Resource            ../Resources/Keywords/CommonKeywords.robot

# SUITE LIBRARIES
Suite Setup         Suite Startup


*** Test Cases ***
GET All Posts With Empty Token
    [Documentation]    Verify if the GET request returns a list of all posts
    [Tags]    API    Regression    PostAPI
    Set Request Headers    ${Empty_Token}
    Create Request Session
    Request and Response    ${GET}    ${Posts_endPoint}    ${NO_PARAM}    ${Empty_Body}    ${SUCCESS}
    Verify Response Status    ${SUCCESS}    ${200 STATUS MESSAGE}

GET All Posts With Invalid Token
    [Documentation]    Verify if the GET request returns a list of all posts
    [Tags]    API    Regression    PostAPI
    Set Request Headers    ${Invalid_Token}
    Create Request Session
    Request and Response    ${GET}    ${Posts_endPoint}    ${NO_PARAM}    ${Empty_Body}    ${SUCCESS}
    Verify Response Status    ${SUCCESS}    ${200 STATUS MESSAGE}

GET All Posts With Valid Token
    [Documentation]    Verify if the GET request returns a list of all posts
    [Tags]    API    Regression    PostAPI
    Set Request Headers    ${Valid_Token}
    Create Request Session
    Request and Response    ${GET}    ${Posts_endPoint}    ${NO_PARAM}    ${Empty_Body}    ${SUCCESS}
    Verify Response Status    ${SUCCESS}    ${200 STATUS MESSAGE}

GET Single Post
    [Documentation]    Verify if the GET request returns a single post by ID
    [Tags]    API    Regression    PostAPI
    Set Request Headers    ${Valid_Token}
    Create Request Session
    Request and Response    ${GET}    ${Posts_endPoint}/1    ${NO_PARAM}    ${Empty_Body}    ${SUCCESS}
    Verify Response Status    ${SUCCESS}    ${200 STATUS MESSAGE}

Create New Post
    [Tags]    API    Regression    PostAPI
    [Documentation]    Verify if a POST request can create a new post
    Set Request Headers    ${Valid_Token}
    Create Request Session
    ${data}=    Create Dictionary    title=foo    body=bar    userId=1
    Request and Response    ${POST}    ${Posts_endPoint}    ${NO_PARAM}    ${data}    ${CREATED}
    Verify Response Status    ${CREATED}    ${201 STATUS MESSAGE}

Update Post
    [Tags]    API    Regression    PostAPI
    [Documentation]    Verify if a PUT request can update an existing post
    Set Request Headers    ${Valid_Token}
    Create Request Session
    ${data}=    Create Dictionary    id=1    title=foo    body=bar    userId=1
    Request and Response    ${PUT}    ${Posts_endPoint}/1    ${NO_PARAM}    ${data}    ${SUCCESS}
    Verify Response Status    ${SUCCESS}    ${200 STATUS MESSAGE}

DELETE Post
    [Tags]    API    Regression    PostAPI
    [Documentation]    Verify if a DELETE request can remove a post by ID
    Set Request Headers    ${Valid_Token}
    Create Request Session
    Request and Response    ${DELETE}    ${Posts_endPoint}/1    ${NO_PARAM}    ${Empty_Body}    ${SUCCESS}
    Verify Response Status    ${SUCCESS}    ${200 STATUS MESSAGE}