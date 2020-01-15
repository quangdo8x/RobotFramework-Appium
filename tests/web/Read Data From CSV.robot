*** Settings ***
Library    ExcelLibrary
Resource   ../resources/Common Keywords.robot

*** Test Cases ***
My First Test
    ${content}=    Get Excel Cell Value    ./data/UserAccount.xlsx    1    1   
    Log To Console    ${content}     