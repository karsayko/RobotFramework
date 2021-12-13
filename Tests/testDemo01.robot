*** Settings ***
Documentation   To validate the login form
Library  SeleniumLibrary
Test Teardown   Close Browser


*** Test Cases ***
Validate Unsuccessful Login
      open the browser with the Mortgage payment url
      Fill the login form
      wait until it checks and display error message
      verify error message is correct

*** Variables ***
${login_error_message_locator}  css:.alert-danger

*** Keywords ***
open the browser with the Mortgage payment url
    create webdriver    Chrome  executable_path=D:/programok/Chromedriver/chromedriver_win32/chromedriver.exe
    go to   https://rahulshettyacademy.com/loginpagePractise

Fill the login form
    input text  id:username    rahulshettyacademy
    input password   id:password    111222
    click button    signInBtn

wait until it checks and display error message
    wait until element is visible   ${login_error_message_locator}

verify error message is correct
#    ${result}=   get text    ${login_error_message_locator}
#   should be equal as strings  ${result}   Incorrect username/password.
    element text should be  ${login_error_message_locator}  Incorrect username/password.

