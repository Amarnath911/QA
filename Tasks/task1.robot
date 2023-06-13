*** Settings ***
Documentation  single test for login
Library  SeleniumLibrary
*** Variables ***
${Dropdown}  //div[@data-testid="dt_dropdown_container"]
${Demo}   //*[@id="demo"]
${dropdown_btn}     //span[@class="dc-text dc-dropdown__display-text"]

*** Test Cases ***

Task 1
    Open Browser    https://app.deriv.com    chrome
    Set Window Size    1280    1024    
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    10
    Input Text    txtEmail    testemail
    Input Password    txtPass    testpassword
    Click Element    //button[@name="login"]
    Wait Until Page Contains Element    ${dropdown_btn}     10
    Click Element   ${dropdown_btn}
    Wait Until Element Is Visible   //*[@class="dc-list"]   15
    Wait Until Element Is Visible   ${Demo}    15
    Click Element     ${Demo} 

    Sleep    10