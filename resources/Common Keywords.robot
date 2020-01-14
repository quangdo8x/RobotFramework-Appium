*** Settings ***
Library    ExcelLibrary    

*** Keywords ***
Get Excel Cell Value
    [Arguments]    ${file path}    ${row number}    ${column number}
    Open Excel Document    ${file path}    1
    ${value}=    Read Excel Cell    ${row number}    ${column number}   
    [Return]    ${value}
    Close Current Excel Document