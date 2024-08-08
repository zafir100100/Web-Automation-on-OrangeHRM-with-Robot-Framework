*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://www.google.com/

*** Test Cases ***
Navigate to Example Domain
    Open Browser    url=https://the-internet.herokuapp.com/login    browser=chrome