*** Settings ***
Suite Setup       Common.Open Browser with title Validation    ${My_Juniper_Testing}
Suite Teardown    Selenium2library.Close Browser
Resource          ../../Common.robot
Resource          ../../Variables.txt

*** Test Cases ***
Filter Support in Active Tab On Main Grid
    Common.Click On Contracts
    ${epoch_time_in_pst}    ngcscCommonMethods.epoch max time in pst
    ${current_Date}    DateTime.Get Current Date
    ${header_end_date}    DateTime.Add Time To Date    ${current_Date}    10 days
    ${header_end_date}    DateTime.Convert Date    ${header_end_date}    result_format=%Y%m%d%H%M%S    date_format=%Y-%m-%d %H:%M:%S.%f
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ${Account ID}    Common.Setup for Getting Random Account ID    contracts    ${NGCSC1_token}
    ${contractID}    ngcscCommonMethods.random with N digits    7
    ${Random Contract ID}    BuiltIn.Catenate    SEPARATOR=    006    ${contractID}
    ngcscCommonMethods.Send Message    contracts    ${header_end_date}    ${msgRcdTs}    Active    ${Account ID}    00000065
    ...    End Customer    ${Random Contract ID}
    BuiltIn.Sleep    60s
    Selenium2Library.Click Element    //div[@id='contracts_tabview_contracts_tabbed_table']/div/section/div/div/div/div[1]/button[1]    #Click Filter Option
    Comment    BuiltIn.Sleep    5s
    Comment    Selenium2Library.Click Element    //div[@id='contracts_tabview_contracts_tabbed_table']/div/section/div/div/div[1]/section/aside/nav/ul/li[text()='Columns']    #Click Columns
    BuiltIn.Sleep    5s
    Selenium2Library.Click Element    //input[@id='rc-input-contractId']
    BuiltIn.Sleep    5s
    Press Key    //div[@id='rc-custom-datepickerstartDate']/div/div[2]/div/input    \\9
    BuiltIn.Sleep    2s
    Press Key    //div[@id='rc-custom-datepickerendDate']/div/div[2]/div/input    \\9
    BuiltIn.Sleep    2s
    Press Key    //input[@id='rc-input-supportCoverage']    \\9
    BuiltIn.Sleep    2s
    Press Key    //input[@id='rc-input-serialNo']    \\9
    BuiltIn.Sleep    2s
    Selenium2Library.Click Element    //div[@id='rc-filter-section-locationName_locationAccId']/div/div/div[2]/div/span    #Click Drop Down
    BuiltIn.Sleep    8s
    Selenium2Library.Click Element    //div[@id='rc-filter-section-locationName_locationAccId']/div/div/div[2]/div[2]/section/div[1]/label/span[3]/span    #UnSelect All
    BuiltIn.Sleep    5s
    Input Text    //div[@id='rc-filter-section-locationName_locationAccId']/div/div/div[2]/div[2]/section/input    ${Account ID}
    Sleep    10s
    Comment    Selenium2Library.Mouse Over    //div[@id='rc-filter-section-locationName_locationAccId']/div/div/div[2]/div[2]/section/div[1]/label/input
    Comment    BuiltIn.Sleep    5s
    Selenium2Library.Click Element    //div[@id='rc-filter-section-locationName_locationAccId']/div/div/div[2]/div[2]/section/div[2]/ul/li/span[1]
    BuiltIn.Sleep    15s
    ${Get_Text_EndCustomer}    Get Text    //div[@id='jnprDataTableContent_contracts_ngcsc_subtab_all_active']/div[2]/div/div/div[3]/div/div/div/div[2]/div/div[5]/div/div/div/div/span
    Sleep    5
    ${EndCustomer}    Split String From Right    ${Get_Text_EndCustomer}    -    1
    ${EndCustomerAccountID}    Collections.Get From List    ${EndCustomer}    1
    Should Be Equal As Numbers    ${EndCustomerAccountID}    ${Account ID}

Filter Support in Expired Tab on Main Grid
    Selenium2Library.Click Element    //ul[@id='nxcsc-tabbed-table-tabs-main']/li[3]    #Click on Expired Tab
    Sleep    5s
    ${epoch_time_in_pst}    ngcscCommonMethods.epoch max time in pst
    ${current_Date}    DateTime.Get Current Date
    ${header_end_date}    DateTime.Subtract Time From Date    ${current_Date}    10 days
    ${header_end_date}    DateTime.Convert Date    ${header_end_date}    result_format=%Y%m%d%H%M%S    date_format=%Y-%m-%d %H:%M:%S.%f
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ${Account ID}    Common.Setup for Getting Random Account ID    contracts    ${NGCSC1_token}
    ${contractID}    ngcscCommonMethods.random with N digits    7
    ${Random Contract ID}    BuiltIn.Catenate    SEPARATOR=    006    ${contractID}
    ngcscCommonMethods.Send Message    contracts    ${header_end_date}    ${msgRcdTs}    Expired    ${Account ID}    00000065
    ...    End Customer    ${Random Contract ID}
    BuiltIn.Sleep    60s
    Selenium2Library.Click Element    //div[@id='contracts_tabview_contracts_tabbed_table']/div/section/div/div/div/div[1]/button[1]    #Click Filter Option
    Comment    BuiltIn.Sleep    5s
    Comment    Selenium2Library.Click Element    //div[@id='contracts_tabview_contracts_tabbed_table']/div/section/div/div/div[1]/section/aside/nav/ul/li[text()='Columns']    #Click Columns
    BuiltIn.Sleep    5s
    Selenium2Library.Click Element    //input[@id='rc-input-contractId']
    BuiltIn.Sleep    5s
    Press Key    //div[@id='rc-custom-datepickerstartDate']/div/div[2]/div/input    \\9
    BuiltIn.Sleep    2s
    Press Key    //div[@id='rc-custom-datepickerendDate']/div/div[2]/div/input    \\9
    BuiltIn.Sleep    2s
    Press Key    //input[@id='rc-input-supportCoverage']    \\9
    BuiltIn.Sleep    2s
    Press Key    //input[@id='rc-input-serialNo']    \\9
    BuiltIn.Sleep    2s
    Selenium2Library.Click Element    //div[@id='rc-filter-section-locationName_locationAccId']/div/div/div[2]/div/span    #Click Drop Down
    BuiltIn.Sleep    8s
    Selenium2Library.Click Element    //div[@id='rc-filter-section-locationName_locationAccId']/div/div/div[2]/div[2]/section/div[1]/label/span[3]/span    #UnSelect All
    BuiltIn.Sleep    5s
    Input Text    //div[@id='rc-filter-section-locationName_locationAccId']/div/div/div[2]/div[2]/section/input    ${Account ID}
    Sleep    10s
    Comment    Selenium2Library.Mouse Over    //div[@id='rc-filter-section-locationName_locationAccId']/div/div/div[2]/div[2]/section/div[1]/label/input
    Comment    BuiltIn.Sleep    5s
    Selenium2Library.Click Element    //div[@id='rc-filter-section-locationName_locationAccId']/div/div/div[2]/div[2]/section/div[2]/ul/li/span[1]
    BuiltIn.Sleep    15s
    ${Get_Text_EndCustomer}    Get Text    //div[@id='jnprDataTableContent_contracts_ngcsc_subtab_all_active']/div[2]/div/div/div[3]/div/div/div/div[2]/div/div[5]/div/div/div/div/span
    Sleep    5
    ${EndCustomer}    Split String From Right    ${Get_Text_EndCustomer}    -    1
    ${EndCustomerAccountID}    Collections.Get From List    ${EndCustomer}    1
    Should Be Equal As Numbers    ${EndCustomerAccountID}    ${Account ID}
