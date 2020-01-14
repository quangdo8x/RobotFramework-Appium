***Settings***
Library    SeleniumLibrary
Library    DataDriver    ../data/UserAccount.xlsx    sheet_name=Accounts
Library    DataDriver    ../data/UserAccount.csv

Suite Setup       Open Browser    https://github.com    chrome
Suite Teardown    Close Browser
Test Setup        Go To    https://github.com/login
Test Template     Invalid login

*** Test Case ***
Login with user ${username} and password ${password}    Default    UserData

*** Keywords ***
Invalid login
    [Arguments]    ${username}    ${password}
    Input Text    name=login    ${username}
    Input Password    name=password    ${password}
    Click Element    name=commit