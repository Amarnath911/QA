*** Settings ***
Documentation  single test for login
Library  SeleniumLibrary
*** Variables ***
${Dropdown}  //div[@data-testid="dt_dropdown_container"]
${Demo}   //*[@id="demo"]
${dropdown_btn}     //span[@class="dc-text dc-dropdown__display-text"]
${Dtrader}    //a[@href="/"]
${drop_men}    //*[@class="ic-icon cq-symbol-dropdown"]
${Volatility}    //span[@class="ic-icon ic-R_50"]
${Slider}    //*[@id="trade_container"]//span[5]
${trade_type}    //div[@id="dt_contract_dropdown"]
${multiplier}    //div[@id="dt_contract_multiplier_item"]
${payout_option}    //button[@id="dc_payout_toggle_item"]
${takeprofit}    //*[@name="has_take_profit"]
${stoploss}    //*[@name="has_stop_loss"]


*** Test Cases ***

Task 5
    Open Browser    https://app.deriv.com    chrome
    Maximize Browser Window    
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    10
    Input Text    txtEmail    amarnath@besquare.com.my
    Input Password    txtPass    Mikecool911
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
    Wait Until Element Is Visible    ${trade_type}    10
    Click Element    ${trade_type}
    Wait Until Element Is Visible    ${multiplier}    10
    Click Element    ${multiplier}
    Page Should Not Contain Element    ${payout_option} 
    Wait Until Element Is Visible    ${takeprofit}  
    Click Element    ${takeprofit}  
    Input Text    dc_take_profit-checkbox_input    10
    Wait Until Element Is Visible    ${stoploss}  
    Click Element    ${stoploss}  
    Input Text    dc_stop_loss-checkbox_input   10
    Sleep    10
