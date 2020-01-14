*** Settings ***
Library    SeleniumLibrary    

*** Variables ***
${USER NAME}       test123456
${PASS WORD}       pass@123
@{USER ACCOUNT}    test123456    pass@123

*** Test Cases ***
My First Test
    Input Text    name=username    ${USER NAME}    
    Input Password    name=pass    ${PASS WORD}    
    Click Element    name=login    

My Second Test
    Input Text    name=username    @{USER ACCOUNT}[0]    
    Input Password    name=pass    @{USER ACCOUNT}[1]    
    Click Element    name=login