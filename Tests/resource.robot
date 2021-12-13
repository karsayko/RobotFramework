*** Settings ***
Documentation   A resource file wih reusable keywords and variables
Library  SeleniumLibrary

*** Variables ***
${user_name}         rahulshettyacademy
${invalid_password}  111222
${valid_password}    learning
${url}               https://rahulshettyacademy.com/loginpagePractise

*** Keywords ***

open the browser with the Mortgage payment url
    create webdriver    Chrome  executable_path=D:/programok/Chromedriver/chromedriver_win32/chromedriver.exe
    go to       ${url}

Close browser session
    close browser