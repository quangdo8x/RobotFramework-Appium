*** Settings ***
Library    JSONLibrary    
Library    Collections    
Library    RequestsLibrary    
Library    XML    

*** Test Cases ***
Validate Data From JSON File
    ${json obj}=    Load JSON From File    data/JsonData.json
    
    ${name value}=    Get Value From Json    ${json obj}    address.state
    Log To Console    ${name value[0]}
    
Validate Complex Data From JSON Response    
    Create Session    my session    https://restcountries.eu    verify=true
    
    ${response}=    Get Request    my session    /rest/v2/alpha/IN    
    
    ${json obj}=    Convert String to JSON    ${response.content}
    
    ${country name}=    Get Value From Json    ${json obj}    name
    Log To Console    ${country name[0]}    
    Should Be Equal    ${country name[0]}    India    
    
    ${border}=    Get Value From Json    ${json obj}    borders
    Log To Console    ${border[0]}
    Should Contain Any    ${border[0]}    AFG    BGD    BTN    MMR    CHN    NPL    PAK    LKA
    
    ${border 1}=    Get From List    ${border[0]}    0
    Log To Console    ${border 1}
    Should Be Equal    ${border 1}    AFG    
    
Validate Data From XML File
    ${xml obj}=    Parse Xml    data/XmlData.xml    
    
    # Check the single element value         .// is root tag "videoGames"
    ${game name}=    Get Element Text    ${xml obj}    .//videoGame[2]/name
    Log To Console    ${game name}    
    Should Be Equal    ${game name}    Gran Turismo 3
    
    # OR just use one step
    
    Element Text Should Be    ${xml obj}    Gran Turismo 3    .//videoGame[2]/name
    
    # Check number of elements
    ${element number}=    Get Element Count    ${xml obj}    .//videoGame
    Log To Console    ${element number}    
    Should Be Equal As Integers   ${element number}    10   
    
    # Check attribute present
    ${attribute value}=    Get Element Attribute    ${xml obj}    category    .//videoGame[2]
    Log To Console    ${attribute value}
    Element Attribute Should Be    ${xml obj}    category    Driving    .//videoGame[2]

    # Check values of child elements
    ${element children}=    Get Child Elements    ${xml obj}    .//videoGame[2]
    Log To Console    ${element children}    
    Should Not Be Empty    ${element children}    
    
    ${id}=    Get Element Text    ${element children[0]}
    Log To Console    ${id}    
    Should Be Equal    ${id}    2
    
    ${name}=    Get Element Text    ${element children[1]}
    Log To Console    ${name}    
    Should Be Equal    ${name}    Gran Turismo 3
    
    ${release date}=    Get Element Text    ${element children[2]}
    Log To Console    ${release date}    
    Should Be Equal    ${release date}    2001-03-10T00:00:00+07:00
    
    ${review score}=    Get Element Text    ${element children[3]}
    Log To Console    ${review score}    
    Should Be Equal    ${review score}    91

Validate Data From XML Response
    Create Session    my session    http://thomas-bayer.com/sqlrest/CUSTOMER/15
    
    ${response}=    Get Request    my session    /
    
    ${xml string}=    Convert To String    ${response.content}
    
    ${xml obj}=    Parse Xml    ${xml string}

    # Check single element value
    ${city name}=    Get Element Text    ${xml obj}    .//CITY
    Log To Console    ${city name}    
    Element Text Should Be    ${xml obj}    Seattle    .//CITY

    # Check multiple values