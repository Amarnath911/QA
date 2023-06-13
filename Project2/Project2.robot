*** Settings ***
Documentation  Closing Account
Library  SeleniumLibrary

*** Variables ***
${account_settings}       //a[@class="trading-hub-header__setting"]
${close-account}    //a[@href="/account/closing-account"]
${security_privacy_pdf}    //a[@href="https://deriv.com/tnc/security-and-privacy.pdf"]
${close_account_btn}    //button[@class="dc-btn dc-btn--primary dc-btn__large closing-account__button--close-account"]
${checkbox1}    //*[@name="financial-priorities"]//parent::label
${checkbox2}    //*[@name="stop-trading"]//parent::label
${checkbox3}    //*[@name="not-interested"]//parent::label
${checkbox4}    //*[@name="another-website"]//parent::label
${feedback_other_trading_platform}    //textarea[@name="other_trading_platforms"]
${feedback_improve}    //textarea[@name="do_to_improve"]
${continue_btn}                //button[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large"]
${back_btn}      //button[@class="dc-btn dc-btn__effect dc-btn--secondary dc-btn__large"]
${pop_up_message}    //div[@class="account-closure-warning-modal"]
${close_account_popup_button}    //*[@class="dc-form-submit-button account-closure-warning-modal__close-account-button dc-form-submit-button--relative"]/button[2]
${go_back_btn}    //*[@class="dc-form-submit-button account-closure-warning-modal__close-account-button dc-form-submit-button--relative"]/button[1]
${checkbox_disable}    //span[@class="dc-checkbox__box dc-checkbox__box--disabled"]
${cancel_btn}    //button[@class="dc-btn dc-btn--secondary dc-btn__large closing-account__button--cancel"]

*** Test Cases ***
TC_01: Close account by selecting only one reason and not including feedbacks
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
    Wait Until Element Is Visible   ${close-account}     10
    Click Element    ${close-account}  
    Page Should Contain    Are you sure?
    Wait Until Element Is Visible    ${security_privacy_pdf}    10
    Click Element    ${close_account_btn} 
    Wait Until Element Is Visible    ${checkbox1}    10
    Click Element    ${checkbox1} 
    Click Element    ${continue_btn}   
    Page Should Contain Element   ${pop_up_message}   15
    # Click Element    ${pop_up_message}
    # Click Element    ${close_account_popup_button}   
    Sleep    10

TC_02: Close account by selecting up to 3 reasons and including feedbacks
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
    Wait Until Element Is Visible   ${close-account}     10
    Click Element    ${close-account}  
    Page Should Contain    Are you sure?
    Wait Until Element Is Visible    ${security_privacy_pdf}    10
    Click Element    ${close_account_btn} 
    Wait Until Element Is Visible    ${checkbox1}    10
    Click Element    ${checkbox1} 
    Click Element    ${checkbox2} 
    Click Element    ${checkbox3}
    Wait Until Element Is Visible    ${feedback_other_trading_platform}
    Input Text    ${feedback_other_trading_platform}    Because i'm switching to OCTAFX
    Wait Until Element Is Visible    ${feedback_improve}
    Input Text    ${feedback_improve}    Maybe can change the deriv logo color to blue
    Click Element    ${continue_btn}   
    Page Should Contain Element   ${pop_up_message}   15
    Click Element    ${pop_up_message}
    # Click Element    ${close_account_popup_button}   
    Sleep    10

TC_03: User select more than 3 reason to close their account
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
    Wait Until Element Is Visible   ${close-account}     10
    Click Element    ${close-account}  
    Page Should Contain    Are you sure?
    Wait Until Element Is Visible    ${security_privacy_pdf}    10
    Click Element    ${close_account_btn} 
    Wait Until Element Is Visible    ${checkbox1}    10
    Click Element    ${checkbox1}
    Element Should Be Enabled   ${checkbox1} 
    Wait Until Element Is Enabled    ${checkbox1}    10
    Click Element    ${checkbox2} 
    Element Should Be Enabled   ${checkbox2} 
    Wait Until Element Is Enabled    ${checkbox2}    10  
    Click Element    ${checkbox3}
    Element Should Be Enabled   ${checkbox3} 
    Wait Until Element Is Enabled    ${checkbox3}    10
    Page Should Contain Element    ${checkbox_disable}   

TC_04: Users include special characters other than the “ . , ' - “ inside the feedback field
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
    Wait Until Element Is Visible   ${close-account}     10
    Click Element    ${close-account}  
    Page Should Contain    Are you sure?
    Wait Until Element Is Visible    ${security_privacy_pdf}    10
    Click Element    ${close_account_btn} 
    Wait Until Element Is Visible    ${checkbox1}    10
    Click Element    ${checkbox1} 
    Click Element    ${checkbox2} 
    Click Element    ${checkbox3}
    Wait Until Element Is Visible    ${feedback_other_trading_platform}
    Input Text    ${feedback_other_trading_platform}    Because i'm switching to OCTAFX@%^$%
    Wait Until Element Is Visible    ${feedback_improve}
    Input Text    ${feedback_improve}    Maybe can change the deriv logo color to blue$^&*^$$&
    Set Browser Implicit Wait    2
    Page Should Contain    Must be numbers, letters, and special characters . , ' -
    Sleep    10

TC_05: Users input more than 110 characters inside feedback field
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
    Wait Until Element Is Visible   ${close-account}     10
    Click Element    ${close-account}  
    Page Should Contain    Are you sure?
    Wait Until Element Is Visible    ${security_privacy_pdf}    10
    Click Element    ${close_account_btn} 
    Wait Until Element Is Visible    ${checkbox1}    10
    Click Element    ${checkbox1} 
    Click Element    ${checkbox2} 
    Click Element    ${checkbox3}
    Wait Until Element Is Visible    ${feedback_other_trading_platform}
    Input Text    ${feedback_other_trading_platform}    aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
    Set Browser Implicit Wait    2
    Wait Until Element Is Visible    ${feedback_improve}
    Input Text    ${feedback_improve}    Maybe can change the deriv logo color to blue
    Page Should Contain    Remaining characters: 0
    Sleep    10

TC_06: User edits the their reason again by click “Go Back” button from the prompt message
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
    Wait Until Element Is Visible   ${close-account}     10
    Click Element    ${close-account}  
    Page Should Contain    Are you sure?
    Wait Until Element Is Visible    ${security_privacy_pdf}    10
    Click Element    ${close_account_btn} 
    Wait Until Element Is Visible    ${checkbox1}    10
    Click Element    ${checkbox1} 
    Click Element    ${checkbox2} 
    Wait Until Element Is Visible    ${feedback_improve}
    Input Text    ${feedback_improve}    Maybe can change the deriv logo color to blue
    Click Element    ${continue_btn}   
    Page Should Contain Element   ${pop_up_message}   15
    Wait Until Element Is Visible    ${go_back_btn}
    Click Element    ${go_back_btn}
    Wait Until Element Is Visible    ${checkbox3} 
    Click Element    ${checkbox3}
    Click Element    ${continue_btn}   
    Page Should Contain Element   ${pop_up_message}
    Sleep    10

TC_07: User click “Continue” Button on closing account page without selecting any reasons
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
    Wait Until Element Is Visible   ${close-account}     10
    Click Element    ${close-account}  
    Page Should Contain    Are you sure?
    Wait Until Element Is Visible    ${security_privacy_pdf}    10
    Click Element    ${close_account_btn} 
    Sleep    5 
    Element Should Be Disabled    ${continue_btn}
    Sleep    10

TC_08: User tries to click “Continue” Button by only including feedback on the closing account page

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
    Wait Until Element Is Visible   ${close-account}     10
    Click Element    ${close-account}  
    Page Should Contain    Are you sure?
    Wait Until Element Is Visible    ${security_privacy_pdf}    10
    Click Element    ${close_account_btn} 
    Wait Until Element Is Visible    ${feedback_improve}
    Input Text    ${feedback_improve}    Maybe can change the deriv logo color to blue
    Set Browser Implicit Wait    2
    Element Should Be Disabled    ${continue_btn}
    Page Should Contain    Please select at least one reason
    Sleep    10


TC_09: User cancels the closing account process
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
    Wait Until Element Is Visible   ${close-account}     10
    Click Element    ${close-account}  
    Page Should Contain    Are you sure?
    Wait Until Element Is Visible    ${security_privacy_pdf}    10
    Click Element    ${close_account_btn} 
    Wait Until Element Is Visible    ${back_btn}
    Click Element    ${back_btn}
    Page Should Contain    Are you sure?
    Wait Until Element Is Visible    ${cancel_btn}
    Click Element    ${cancel_btn}
    Sleep    10

TC_10: User view the security and privacy policy 
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
    Wait Until Element Is Visible   ${close-account}     10
    Click Element    ${close-account}  
    Page Should Contain    Are you sure?
    Wait Until Element Is Visible    ${security_privacy_pdf}    10
    Click Element    ${security_privacy_pdf} 
    Sleep    10




    
