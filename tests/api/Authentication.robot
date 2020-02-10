*** Settings ***
Library    RequestsLibrary
Library    OperatingSystem    

*** Variables ***
${OK CODE}      200

*** Test Cases ***
Get Request With Basic Authentication Using Username And Password
    ${auth}=    Create List    ToolsQA    TestPassword
    Create Session    my session    http://restapi.demoqa.com    auth=${auth}
    ${response}=    Get Request    my session   /authentication/CheckForAuthentication/
    
    ${status code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status code}    ${OK CODE}
    Log To Console    ${response.content}

Post Request With Authentication By Bearer Token
    Create Session    my session    https://certtransaction.elementexpress.com/
    
    ${headers}=    Create Dictionary    Authentication="Bearer E4F284BFADA11D01A52508ED7B92FFD7EE0905659F5DED06A4B73FC7739B48A287648801"    Content-Type=text/xml
    ${body}=    Get File    data/PostData.txt    
    
    ${response}=    Post Request    my session    /    data=${body}    headers=${headers}
    Log To Console    ${response.status_code}    
    Log To Console    ${response.content}    