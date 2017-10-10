*** Settings ***
Suite Setup       Common.Open Browser with title Validation    ${My_Juniper_Testing}
Suite Teardown    Selenium2Library.Close Browser
Resource          ../../Common.robot

*** Test Cases ***
Location Name Column Change to End Customer In Active Subtab
    [Tags]    location
    Common.Click On Contracts
    BuiltIn.Sleep    5s
    ${column_name_elements}    Selenium2Library.Get Webelements    //div[@id='jnprDataTableContent_contracts_ngcsc_subtab_all_active']/div[2]/div/div[1]/div[2]/div/div/div[2]/div/div/div[2]/div[1]/span[1]
    ${columns_text_value}    Common.getting elements text from allwebelements    ${column_name_elements}
    log    ${columns_text_value}
    ${column_Name}    Collections.Get From List    ${columns_text_value}    -1
    BuiltIn.Should Be Equal    ${column_Name}    End Customer

Location Name Column Changed to End Customer in Expired Tab
    [Tags]    location
    BuiltIn.Sleep    2s
    Selenium2Library.Click Element    //ul[@id='nxcsc-tabbed-table-tabs-main']/li[3]
    BuiltIn.Sleep    2s
    ${column_name_elements}    Selenium2Library.Get Webelements    //div[@id='jnprDataTableContent_contracts_ngcsc_subtab_all_expired']/div[2]/div/div[1]/div[2]/div/div/div[2]/div/div/div[2]/div[1]/span[1]
    ${columns_text_value}    Common.getting elements text from allwebelements    ${column_name_elements}
    log    ${columns_text_value}
    ${column_Name}    Collections.Get From List    ${columns_text_value}    -1
    BuiltIn.Should Be Equal    ${column_Name}    End Customer

Location Name Column Changed through Global Search for Active Contract ID
    [Tags]    location
    ${epoch_time_in_pst}    ngcscCommonMethods.epoch max time in pst
    ${current_Date}    DateTime.Get Current Date
    ${header_end_active_date}    DateTime.Add Time To Date    ${current_Date}    10 days
    ${header_end_date}    DateTime.Convert Date    ${header_end_active_date}    result_format=%Y%m%d%H%M    date_format=%Y-%m-%d %H:%M:%S.%f
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ${Account ID}    Common.Setup for Getting Random Account ID    contracts
    ngcscCommonMethods.Send Message    contracts    ${header_end_date}    ${msgRcdTs}    Active    ${Account ID}    00000065
    ...    End Customer    0060082755
    BuiltIn.Sleep    60s
    Selenium2Library.Input Text    //section[@id='nxcsc-global-search-container']/input    0060082755
    Selenium2Library.Press Key    //section[@id='nxcsc-global-search-container']/input    \\13
    BuiltIn.Sleep    5s
    ${column_name_elements}    Selenium2Library.Get Webelements    //div[@id='jnprDataTableContent_search_function_tab_contracts']/div/div/div[2]/div/div/div[2]/div/div/div[2]/div/div/div[2]/div[1]/span[1]
    ${columns_text_value}    Common.getting elements text from allwebelements    ${column_name_elements}
    log    ${columns_text_value}
    ${column_Name}    Collections.Get From List    ${columns_text_value}    -1
    BuiltIn.Should Be Equal    ${column_Name}    End Customer

Location Name Column Changed to End Customer through Global Search for Expired Contract ID
    [Tags]    location
    ${epoch_time_in_pst}    ngcscCommonMethods.epoch max time in pst
    ${current_Date}    DateTime.Get Current Date
    ${header_end_active_date}    DateTime.Add Time To Date    ${current_Date}    10 days
    ${header_end_date}    DateTime.Convert Date    ${header_end_active_date}    result_format=%Y%m%d%H%M    date_format=%Y-%m-%d %H:%M:%S.%f
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ${Account ID}    Common.Setup for Getting Random Account ID    contracts
    ngcscCommonMethods.Send Message    contracts    ${header_end_date}    ${msgRcdTs}    Expired    ${Account ID}    00000065
    ...    End Customer    0060082855
    BuiltIn.Sleep    60s
    Selenium2Library.Input Text    //input[@id='nxcsc-globalsearch-input-2']    0060082855
    Selenium2Library.Press Key    //input[@id='nxcsc-globalsearch-input-2']    \\13
    BuiltIn.Sleep    5s
    ${column_name_elements}    Selenium2Library.Get Webelements    //div[@id='jnprDataTableContent_search_function_tab_contracts']/div/div/div[2]/div/div/div[2]/div/div/div[2]/div/div/div[2]/div[1]/span[1]
    ${columns_text_value}    Common.getting elements text from allwebelements    ${column_name_elements}
    log    ${columns_text_value}
    ${column_Name}    Collections.Get From List    ${columns_text_value}    -1
    BuiltIn.Should Be Equal    ${column_Name}    End Customer

Location Name Column Changed through Charts
    BuiltIn.Sleep    5s
    Selenium2Library.Click Element    //span[@id='nxcsc-globalsearch-btn-close']
    BuiltIn.Sleep    2s
    Selenium2Library.Click Element    //div[@id='nxcsc-widget-overview_contract_summary']/div[1]/button[1]
    BuiltIn.Sleep    2s
