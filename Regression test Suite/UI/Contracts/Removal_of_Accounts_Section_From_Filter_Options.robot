*** Settings ***
Suite Setup       Common.Open Browser with title Validation    ${My_Juniper_Testing}
Suite Teardown    Selenium2Library.Close Browser
Test Setup
Resource          ../../Common.robot

*** Test Cases ***
Verification of Account Section Removal From Active Subtab
    [Tags]    accounts
    Common.Click On Contracts
    BuiltIn.Sleep    10s
    Selenium2Library.Click Element    //div[@id='contracts_tabview_contracts_tabbed_table']/div/section/div/div/div/div[1]/button[1]    #Click Filter Option
    BuiltIn.Sleep    5s
    Selenium2Library.Element Should Not Be Visible    //div[@id='contracts_tabview_contracts_tabbed_table']/div/section/div/div/div[1]/section/aside/nav/ul/li[text()='Accounts']    #Click Accounts Section

Removal of Accounts Section From Filter options Under Expired Tab
    BuiltIn.Sleep    2s
    Selenium2Library.Click Element    //ul[@id='nxcsc-tabbed-table-tabs-main']/li[3]
    BuiltIn.Sleep    10s
    Selenium2Library.Click Element    //div[@id='contracts_tabview_contracts_tabbed_table']/div/section/div/div/div/div[1]/button[1]    #Click Filter Option
    BuiltIn.Sleep    5s
    Selenium2Library.Element Should Not Be Visible    //div[@id='contracts_tabview_contracts_tabbed_table']/div/section/div/div/div[1]/section/aside/nav/ul/li[text()='Accounts']    #Click Accounts Section
