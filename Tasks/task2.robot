*** Settings ***
Documentation  single test for login
Library  SeleniumLibrary
*** Variables ***
${Dropdown}  //div[@data-testid="dt_dropdown_container"]
${Demo}   //*[@id="demo"]
${dropdown_btn}     //span[@class="dc-text dc-dropdown__display-text"]
${Dtrader}    //a[@href="/"]
${drop_men}    //*[@class="ic-icon cq-symbol-dropdown"]
${Volatility}    //span[@class="ic-icon ic-1HZ10V"]
${Slider}    //*[@id="trade_container"]//span[5]



*** Test Cases ***

Task 2
    Open Browser    https://app.deriv.com    chrome
    Maximize Browser Window    
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
    Wait Until Page Contains Element    ${Dtrader}     10
    Click Element   ${Dtrader}
    Wait Until Element Is Visible    ${drop_men}     15
    Click Element     ${drop_men} 
    Wait Until Element Is Visible    ${Volatility}     10
    Click Element     ${Volatility} 
    Wait Until Page Contains Element   ${Slider}    10
    Wait Until Page Contains Element   dt_amount_input    10
    Wait Until Page Contains Element   dt_purchase_call_button    10
    Click Element    dt_purchase_call_button
    # Input Text    dt_amount_input    20
    Sleep    20     

    # Wait Until Element Is Visible    dt_duration_range_input  
    # Click Element    dt_duration_range_input 
    # Input Text    dt_duration_range_input    4
    # Sleep    20
    # Wait Until Element Is Visible  //div[@id="dropdown-display"]    10
    # Click Element    //div[@id="dropdown-display"]