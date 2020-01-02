*** Settings ***
Library        BuiltIn
Library        AppiumLibrary
Resource       ../pages/Calculator.robot
Test Setup     Open Application    ${remote_url}    platformName=${platform_name}    platformVersion=${platform_version}
    ...                            deviceName=${device_name}    appPackage=${app_package}    appActivity=${app_activity}

*** Variables ***
${remote_url}    http://127.0.0.1:4723/wd/hub
${platform_name}    Android
${platform_version}    8.0.0
${device_name}    emulator-5554
${app_package}    com.android.calculator2
${app_activity}    com.android.calculator2.Calculator

*** Test Cases ***
My First Test 01
    Multi Two Digits    ${button 6}    ${button 9}
    
My Second Test abc
    Add Two Digits    ${button 5}    ${button 8}