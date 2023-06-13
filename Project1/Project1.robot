*** Settings ***
Documentation  API Token Page Testing 
Library  SeleniumLibrary

*** Variables ***
${account_settings}       //a[@class="trading-hub-header__setting"] 
${API_Token_menu}    //a[@href="/account/api-token"]
${read}    //*[@name="read"]//parent::label
${trade}    //*[@name="trade"]//parent::label
${payments}    //*[@name="payments"]//parent::label
${trading_information}    //*[@name="trading_information"]//parent::label
${admin}    //*[@name="admin"]//parent::label
${token_input}    //*[@name='token_name']
${create}    //button[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button"]
${error_msg}    //div[@class="dc-field dc-field--error"]

*** Test Cases ***
TC_01: Create API Token by selecting READ access option on the scopes
    Open Browser    https://app.deriv.com    chrome
    Maximize Browser Window    
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    10
    Input Text    txtEmail    testemail
    Input Password    txtPass    testpassword
    Click Element    //button[@name="login"]
    Wait Until Element Is Visible   ${account_settings}     10
    Click Element    ${account_settings}  
    Wait Until Element Is Visible   ${API_Token_menu}     10
    Click Element    ${API_Token_menu}
    Wait Until Element Is Visible    ${read} 
    Click Element    ${read} 
    Wait Until Element Is Visible    ${token_input}    10
    Input Text     ${token_input}    test
    Wait Until Element Is Visible    ${create}    10
    Click Element     ${create}   
    

TC_02: Create API Token by selecting all access on the scopes
    Open Browser    https://app.deriv.com    chrome
    Maximize Browser Window    
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    10
    Input Text    txtEmail    testemail
    Input Password    txtPass    testpassword
    Click Element    //button[@name="login"]
    Wait Until Element Is Visible   ${account_settings}     10
    Click Element    ${account_settings}  
    Wait Until Element Is Visible   ${API_Token_menu}     10
    Click Element    ${API_Token_menu}
    Wait Until Element Is Visible    ${read}    10
    Click Element    ${read} 
    Click Element    ${trade} 
    Click Element    ${trading_information} 
    Click Element    ${payments} 
    Click Element    ${admin} 
    Wait Until Element Is Visible    ${token_input}    10
    Input Text     ${token_input}    test
    Wait Until Element Is Visible    ${create}    10
    Click Element     ${create}   
    

TC_03: Create API Token by selecting TRADE access on the scopes
    Open Browser    https://app.deriv.com    chrome
    Maximize Browser Window    
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    10
    Input Text    txtEmail    testemail
    Input Password    txtPass    testpassword
    Click Element    //button[@name="login"]
    Wait Until Element Is Visible   ${account_settings}     10
    Click Element    ${account_settings}  
    Wait Until Element Is Visible   ${API_Token_menu}     10
    Click Element    ${API_Token_menu}
    Wait Until Element Is Visible    ${trade}    10
    Click Element    ${trade} 
    Wait Until Element Is Visible    ${token_input}    10
    Input Text     ${token_input}    test
    Wait Until Element Is Visible    ${create}    10
    Click Element     ${create}   
    

TC_04: Create API Token by not selecting any access option on the scopes
    Open Browser    https://app.deriv.com    chrome
    Maximize Browser Window    
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    10
    Input Text    txtEmail    testemail
    Input Password    txtPass    testpassword
    Click Element    //button[@name="login"]
    Wait Until Element Is Visible   ${account_settings}     10
    Click Element    ${account_settings}  
    Wait Until Element Is Visible   ${API_Token_menu}     10
    Click Element    ${API_Token_menu}
    Wait Until Element Is Visible    ${trade}    10
    Wait Until Element Is Visible    ${token_input}    10
    Input Text     ${token_input}    test
    Element Should Be Disabled    ${create}    
    

TC_05: Create API Token by not selecting any access option on the scopes
    Open Browser    https://app.deriv.com    chrome
    Maximize Browser Window    
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    10
    Input Text    txtEmail    testemail
    Input Password    txtPass    testpassword
    Click Element    //button[@name="login"]
    Wait Until Element Is Visible   ${account_settings}     10
    Click Element    ${account_settings}  
    Wait Until Element Is Visible   ${API_Token_menu}     10
    Click Element    ${API_Token_menu}
    Wait Until Element Is Visible    ${trade}    10
    Wait Until Element Is Visible    ${token_input}    10
    Input Text     ${token_input}    123456789abcdefghijklmnopqrstuvwxyz
    Element Should Be Disabled    ${create}   
    Page Should Contain Element    ${error_msg} 
   

