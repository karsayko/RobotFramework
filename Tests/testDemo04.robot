*** Settings ***
Documentation   To validate the login form
Library  SeleniumLibrary
Test Teardown   Close Browser
Test Template   Validate Unsuccessful Login

*** Variables ***
${login_error_message_locator}  css:.alert-danger


*** Test Cases ***      username      password
Invalid username        valami        learning
Invalid password        rahulshetty   almafa
Special characters      %!&@          learning

*** Keywords ***
Validate Unsuccessful Login
      [Arguments]   ${username}     ${password}
      open the browser with the Mortgage payment url
      Fill the login form       ${username}     ${password}
      wait until it checks and display error message
      verify error message is correct

open the browser with the Mortgage payment url
    create webdriver    Chrome  executable_path=D:/programok/Chromedriver/chromedriver_win32/chromedriver.exe
    go to   https://rahulshettyacademy.com/loginpagePractise

Fill the login form
    [arguments]     ${username}     ${password}
    input text       id:username    ${username}
    input password   id:password    ${password}
    click button     signInBtn

wait until it checks and display error message
    wait until element is visible   ${login_error_message_locator}

verify error message is correct
#    ${result}=   get text    ${login_error_message_locator}
#   should be equal as strings  ${result}   Incorrect username/password.
    element text should be  ${login_error_message_locator}  Incorrect username/password.

