*** Settings ***
Library    BuiltIn    
Library    SeleniumLibrary    

*** Variables ***
${URL}    http://google.com

*** Test Cases ***
My First Test
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Input Text    name=q    Robot Framework
    Press Keys    None    RETURN
    Element Text Should Be    class=iUh30    https://robotframework.org