*** Settings ***
Library    SeleniumLibrary    
Suite Setup    Open Browser    http://google.com    chrome
Suite Teardown    Close Browser   
Test Setup    Log    I am in test set up
Test Teardown    Log    I am in test teardown   

*** Test Cases ***
My First Test
    Log    I am in test case 01    
    
My Second Test
    Log    I am in test case 02    
    
My Third Test
    Log    I am in test case 03 