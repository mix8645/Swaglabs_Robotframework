*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         https://www.automationexercise.com/
${BROWSER}        Chrome
${DELAY}          0
${VALID EMAIL}    556677@demo.com
${VALID USER}     standard_user
${VALID PASSWORD}    secret_sauce
${LOGIN PAGE}     https://www.automationexercise.com/login
${SIGNUP PAGE}    https://www.automationexercise.com/signup
${FIRST NAME}    DEMO
${LAST NAME}     DEMO
${COMPANY}       DEMO
${ADDRESS}       DEMO
${STATE}         DEMO
${CITY}       DEMO
${ZIPCODE}       12345
${MOBILE NUMBER}    0800888888


*** Keywords ***
Open Browser To Login Page
    Open Browser    ${SERVER}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Home Page Should Be Open

Home Page Should Be Open
    Title Should Be    Automation Exercise

Click Signup / Login Button
    Click Element    xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[4]/a

Signup / Login Page Should Be Open
    Location Should Be    ${LOGIN PAGE}
    Title Should Be    Automation Exercise - Signup / Login

Input Username For Signup
    [Arguments]    ${VALID USER}
    Input Text    xpath=//*[@id="form"]/div/div/div[3]/div/form/input[2]    ${VALID USER}

Input Email For Signup
    [Arguments]    ${EMAIL}
    Input Text    xpath://*[@id="form"]/div/div/div[3]/div/form/input[3]    ${VALID EMAIL}

Submit Credential
    Click Button   xpath=//*[@id="form"]/div/div/div[3]/div/form/button

Signup Page Should Be Open
    Location Should Be    ${SIGNUP PAGE}
    Title Should Be    Automation Exercise - Signup
    Wait Until Page Contains    Enter Account Information

Select Title
    Select Radio Button    title    Mr
    Radio Button Should Be Set To    title    Mr

Input Password For Signup
    [Arguments]    ${VALID PASSWORD}
    Input Password    id=password    ${VALID PASSWORD}

Date Of Birth
    Select From List By Value    id=days    8
    Select From List By Value    id=months    6
    Select From List By Value    id=years    2002

Signup And Recive Checkbox
    Select Checkbox    id=newsletter
    Checkbox Should Be Selected    id=newsletter
    Select Checkbox    id=optin
    Checkbox Should Be Selected    id=optin

Enter Address Information
    Page Should Contain    Address Information
    Input Text    id=first_name    ${FIRST NAME}
    Input Text    id=last_name    ${LAST NAME}
    Input Text    id=company    ${COMPANY}
    Input Text    id=address1    ${ADDRESS}
    Select From List By Value    id=country    United States
    Input Text    id=city   ${CITY}
    Input Text    id=state   ${STATE}
    Input Text    id=zipcode    ${ZIPCODE}
    Input Text    id=mobile_number    ${MOBILE NUMBER}

Enter Create Account Button
    Click Button    xpath=//*[@id="form"]/div/div/div/div[1]/form/button

Account Created Page Should Be Open
    Title Should Be    Automation Exercise - Account Created
    Wait Until Page Contains    Account Created!
    Click Element   xpath=//*[@id="form"]/div/div/div/div/a
    Home Page Should Be Open

Verify Logged In As standard_user
    Wait Until Page Contains    standard_user

Click Delete Account
    Page Should Contain     Delete Account
    Click Element    xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[5]/a

Delete Account Page Should Be Open
    Title Should Be    Automation Exercise - Account Created
    Wait Until Page Contains    Account Deleted!
    Click Element    xpath=//*[@id="form"]/div/div/div/div/a
    Home Page Should Be Open
