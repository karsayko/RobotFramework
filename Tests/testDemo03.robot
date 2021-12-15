*** Settings ***
Documentation   To copy an email address from a text in a child window to the parent window
Library  SeleniumLibrary
Library  String
Library  Collections
Test Setup      open the browser with the Mortgage payment url
Test Teardown   Close browser session
Resource        resource.robot


*** Test Cases ***
Validate child window functionality
      select the link of child window
      verify the user is switched to child window
      grab the email id in the child window
      switch to parent window and enter the email


*** Keywords ***
select the link of child window
    click element    css:.blinkingText
    sleep           5

verify the user is switched to child window
    switch window   NEW
    element text should be      css:h1     DOCUMENTS REQUEST

grab the email id in the child window
    ${text}=    get text    css:.red
    @{words}=   split string    ${text}     at
    ${text_split}=  get from list   ${words}    1
    log     ${text_split}
    @{words_2}=   split string    ${text_split}
     ${email}=  get from list   ${words_2}    0
    set global variable     ${email}

switch to parent window and enter the email
    switch window   MAIN
    title should be     LoginPage Practise | Rahul Shetty Academy
    input text       id:username    ${email}
