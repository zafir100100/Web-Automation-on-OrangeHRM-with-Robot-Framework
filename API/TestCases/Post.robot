*** Settings ***
Documentation       This is a collection of various keywords of the application

# Common Keywords Library
Resource            ../Resources/Keywords/CommonKeywords.robot

# SUITE LIBRARIES
Suite Setup         Suite Startup


*** Test Cases ***
GET All Posts
    [Documentation]    Verify if the GET request returns a list of all posts
    [Tags]    api    regression    postapi
    Set Request Headers    ${Empty_Token}
    Create Request Session
    Request and Response    ${GET}    ${Posts_endPoint}    ${NO_PARAM}    ${Empty_Body}    ${SUCCESS}
    Verify Response Status    ${SUCCESS}    ${200 STATUS MESSAGE}

# GET All Posts
#    [Tags]    API    Regression    PostAPI
#    [Documentation]    Verify if the GET request returns a list of all posts
#    Create Session    mysession    ${Base_Url}
#    ${response}=    GET    mysession    /posts
#    Log To Console    ${response.status_code}
#    Log To Console    ${response.json()}
#    Verify Status Code Is    ${response}    200

# GET Single Post
#    [Tags]    API    Regression    PostAPI
#    [Documentation]    Verify if the GET request returns a single post by ID
#    Create Session    mysession    ${Base_Url}
#    ${response}=    GET    mysession    /posts/1
#    Log To Console    ${response.status_code}
#    Log To Console    ${response.json()}
#    Verify Status Code Is    ${response}    200
#
# POST Create New Post
#    [Tags]    API    Regression    PostAPI
#    [Documentation]    Verify if a POST request can create a new post
#    Create Session    mysession    ${Base_Url}
#    ${data}=    Create Dictionary    title=foo    body=bar    userId=1
#    ${response}=    POST    mysession    /posts    json=${data}
#    Log To Console    ${response.status_code}
#    Log To Console    ${response.json()}
#    Verify Status Code Is    ${response}    201
#
# PUT Update Post
#    [Tags]    API    Regression    PostAPI
#    [Documentation]    Verify if a PUT request can update an existing post
#    Create Session    mysession    ${Base_Url}
#    ${data}=    Create Dictionary    id=1    title=foo    body=bar    userId=1
#    ${response}=    PUT    mysession    /posts/1    json=${data}
#    Log To Console    ${response.status_code}
#    Log To Console    ${response.json()}
#    Verify Status Code Is    ${response}    200
#
# DELETE Post
#    [Tags]    API    Regression    PostAPI
#    [Documentation]    Verify if a DELETE request can remove a post by ID
#    Create Session    mysession    ${Base_Url}
#    ${response}=    DELETE    mysession    /posts/1
#    Log To Console    ${response.status_code}
#    Verify Status Code Is    ${response}    200

# Get Todos List Without Authorization
#    [Tags]    API    Regression    TodosAPI    NoAuth
#    [Documentation]    To verify a user can get the post list without requiring authorization
#    ${headers}=    Set Request Headers    ${Empty_Token}
#    ${response}=    GET On Session    mysession    /posts
#    Log To Console    \n${response.status_code}
#    Log To Console    \n${response.json()}
##    ${headers}=    Set Request Headers    ${Empty_Token}
###    Create Request Session    ${Base_Url_Sandbox}    ${headers}
##    Create Session    mysession    ${Base_Url}
##    GET On Session    mysession    /posts
##    Request and Response    ${GET}    ${NO PARAM}    /todos    ${Empty_Body}
##    Verify Response Status    ${SUCCESS}    ${200 STATUS MESSAGE}
