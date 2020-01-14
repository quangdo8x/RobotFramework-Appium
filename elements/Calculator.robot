*** Settings ***
Library    BuiltIn    
Library    AppiumLibrary    

*** Variables ***
${button 0}         id=digit_0
${button 1}         id=digit_1
${button 2}         id=digit_2
${button 3}         id=digit_3
${button 4}         id=digit_4
${button 5}         id=digit_5
${button 6}         id=digit_6
${button 7}         id=digit_7
${button 8}         id=digit_8
${button 9}         id=digit_9
${button decimal}	id=dec_point
${button equal}     id=eq
${button del}       id=del
${button divide}    id=op_div
${button multi}     id=op_mul
${button subtract}  id=op_sub
${button add}       id=op_add

*** Keywords ***
Add Two Digits
    [Arguments]    ${first digit}    ${second digit}    
    Click Element    ${first digit}
    Click Element    ${button add}
    Click Element    ${second digit}
    Click Element    ${button equal}
    
Multi Two Digits
    [Arguments]    ${first digit}    ${second digit}    
    Click Element    ${first digit}
    Click Element    ${button multi}
    Click Element    ${second digit}
    Click Element    ${button equal}    