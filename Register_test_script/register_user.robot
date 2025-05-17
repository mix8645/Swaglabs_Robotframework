*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Register User
    Open Browser To Login Page
    Home Page Should Be Open
    Click Signup / Login Button
    Signup / Login Page Should Be Open
    Input Username For Signup    standard_user
    Input Email For Signup    556677@demo.com
    Submit Credential
    Signup Page Should Be Open
    Select Title
    Input Password For Signup    secret_sauce
    Date Of Birth
    Signup And Recive Checkbox
    Enter Address Information
    Enter Create Account Button
    Account Created Page Should Be Open
    Verify Logged In As standard_user
    Click Delete Account
    Delete Account Page Should Be Open
    [Teardown]    Close Browser

        