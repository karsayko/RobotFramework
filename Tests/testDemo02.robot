*** Settings ***
Documentation   To validate the login form
Library  SeleniumLibrary
Library  Collections
Test Setup      open the browser with the Mortgage payment url
#Test Teardown   Close browser session
Resource        resource.robot

*** Variables ***
${login_error_message_locator}  css:.alert-danger
${shop_page_load}  css:.nav-link

*** Test Cases ***
#Validate Unsuccessful Login
 #     Fill the login form   ${user_name}    ${invalid_password}
  #    wait until element appears in the page    ${login_error_message_locator}
   #   verify error message is correct

Validate Cards display in the Shopping Page
    Fill the login form     ${user_name}    ${valid_password}
    wait until element appears in the page  ${shop_page_load}
    verify card titles in the shop page
    select the card     Blackberry

Select the Formand navigate to Child Window
    Fill the login details and login form

*** Keywords ***

Fill the login form
    [arguments]     ${username}     ${password}
    input text       id:username    ${username}
    input password   id:password    ${password}
    click button     signInBtn


wait until element appears in the page
    [arguments]     ${element}
    wait until element is visible   ${element}

verify error message is correct
#    ${result}=   get text    ${login_error_message_locator}
#   should be equal as strings  ${result}   Incorrect username/password.
    element text should be  ${login_error_message_locator}  Incorrect username/password.

verify card titles in the shop page
   @{expectedList} =  create list     iphone X    Samsung Note 8  Nokia Edge   Blackberry
   ${elements} =    get webelements     css:.card-title
   @{actualList} =  create list

   FOR  ${element}  IN    @{elements}
      log   ${element.text}
      append to list  ${actualList}     ${element.text}
   END
   lists should be equal    ${expectedList}   ${actualList}

select the card
    [arguments]     ${cardName}
    ${elements} =    get webelements     css:.card-title
    ${index}=   set variable    1
    FOR  ${element}  IN    @{elements}
        Exit For Loop If   '${cardName}' == '${element.text}'
        ${index}=   Evaluate     ${index} + 1
    END
    click button    xpath:(//*[@class='card-footer'])[${index}]/button

Fill the login details and login form

    input text       id:username    rahulshettyacademy
    input password   id:password    learning
    click element    css:input[value='user']
    wait until element is visible   okayBtn
    click element    okayBtn
    wait until element is not visible    css:.modal-body
    select from list by value   css:select.form-control      teach
    select checkbox     id:terms
    checkbox should be selected     id:terms