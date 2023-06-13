* Settings *
Library    SeleniumLibrary

* Variables *
${deposit}    //*[text()="Deposit"]//parent::button
${rst_balance}    //*[text()="Reset Balance"]//parent::button
${dropdown}    dropdown-display
${open_btn}    //a[@href="/"]
${underlying}    //span[@class="ic-icon cq-symbol-dropdown"]
${forex_tade}    //span[@class="ic-icon ic-forex"]
${aud/usd}    //div[@class="sc-mcd__item sc-mcd__item--frxAUDUSD "]
${trade_type}    //div[@id="dt_contract_dropdown"]
${high/low}    //div[@id="dt_contract_high_low_item"]
${duration}    //button[@id="dc_duration_toggle_item"]
${datetab}    //div[@class="dc-input dc-datepicker__input dc-datepicker__input--has-leading-icon"]
# ${barrier}    //div[@class="dc-input-field trade-container__barriers-single"]
${payout}    //button[@id="dc_payout_toggle_item"]  
${error_msg}    //div[@class="dc-popover__bubble dc-popover__bubble--error"] 


* Test Cases *
contract
    Open Browser    https://app.deriv.com    chrome
    Maximize Browser Window
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    10
    Input Text    txtEmail    testemail
    Input Password    txtPass    testpassword
    Click Element    //button[@name="login"]
    Wait Until Element Is Visible    ${deposit}    10
    Wait Until Page Contains Element    ${dropdown}    10
    Click Element    ${dropdown}
    Wait Until Element Is Visible   demo    10
    Click Element    demo
    Wait Until Page Contains Element    ${rst_balance}    10 
    Wait Until Page Contains Element    ${open_btn}    10
    Click Element    ${open_btn}
    Wait Until Page Contains Element    ${underlying}    20
    Click Element    ${underlying}
    Wait Until Element Is Visible    ${forex_tade}    10
    Click Element    ${forex_tade} 
    Wait Until Element Is Visible    ${aud/usd}    20
    Click Element    ${aud/usd}
    Wait Until Element Is Visible    ${trade_type}    10
    Click Element    ${trade_type}
    Wait Until Element Is Visible    ${high/low}    10
    Click Element    ${high/low}
    Wait Until Element Is Visible    ${duration}    10
    Click Element    ${duration}
    Wait Until Element Is Visible    ${datetab}    10
    Click Element    ${datetab}
    Press Keys     ${datetab}    | CONTROL+A+BACKSPACE
    Press Keys     ${datetab}    | 2
    Wait Until Element Is Visible    dt_barrier_1_input    10   
    Press Keys     dt_barrier_1_input    CTRL+a+BACKSPACE
    Input Text     dt_barrier_1_input    -0.1
    Wait Until Element Is Visible    ${payout}    10
    Click Element    ${payout}
    Press Keys     dt_amount_input    CTRL+a+BACKSPACE
    Input Text     dt_amount_input    10   
    Wait Until Element Is Visible    ${error_msg}    20
    Sleep    20
