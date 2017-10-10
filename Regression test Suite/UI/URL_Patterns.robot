*** Settings ***
Suite Setup       Common.Open Browser with title Validation    ${My_Juniper_Testing}
Suite Teardown    Selenium2Library.Close Browser
Metadata          \    ${EMPTY}
Resource          ../Common.robot
Resource          ../Variables.txt

*** Test Cases ***
URL Pattern for Overview
    [Tags]    URL
    BuiltIn.Set Suite Variable    ${Environment}    ${My_Juniper_Testing}
    ${overview_title}    Selenium2Library.Get Location
    ${expected_overview_title}    BuiltIn.Catenate    SEPARATOR=/    https://${Environment}/#en    US     dashboard    overview
    Log     ${expected_overview_title}
    BuiltIn.Should Be Equal    ${expected_overview_title}    ${overview_title}

Case URL Pattern
    [Tags]    URL
    [Setup]    Common.Click On Cases
    ${overview_title}    Selenium2Library.Get Location
    ${expected_cases_title}    BuiltIn.Catenate    SEPARATOR=/    https://${Environment}/#en    US     dashboard    cases
    Log     ${expected_cases_title}
    BuiltIn.Should Be Equal    ${expected_cases_title}    ${overview_title}

Products URL Pattern
    [Tags]    URL
    [Setup]    Common.Click on Products
    ${overview_title}    Selenium2Library.Get Location
    ${expected_cases_title}    BuiltIn.Catenate    SEPARATOR=/    https://${Environment}/#en    US     dashboard    products
    Log     ${expected_cases_title}
    BuiltIn.Should Be Equal    ${expected_cases_title}    ${overview_title}

Contracts URL Pattern
    [Setup]    Common.Click On Contracts
    ${contracts_title}    Selenium2Library.Get Location
    ${expected_contracts_title}    BuiltIn.Catenate    SEPARATOR=/    https://${Environment}/#en    US     dashboard    contracts
    Log     ${expected_contracts_title}
    BuiltIn.Should Be Equal    ${expected_contracts_title}    ${contracts_title}

Cases ID URL Pattern
    [Setup]    Common.Click On Cases
    BuiltIn.Sleep    5s
    Selenium2Library.Mouse Over    //ul[@id='nxcsc-tabbed-table-tabs-main']/li[3]
    Selenium2Library.Click Element    //ul[@id='nxcsc-tabbed-table-tabs-main']/li[3]
    BuiltIn.Sleep    5s
    Common.Suite Setup for Case Details    ${NGCSC1_token}    2017-0803-1552
    Selenium2Library.Click Element    //div[@id='cases_tabview_cases_tabbed_table']/div/section/div/div/div/div[1]/button[1]
    BuiltIn.Sleep    5s
    Selenium2Library.Input Text    //input[@id='rc-input-srId']    2017-0803-1552
    BuiltIn.Sleep    5s
    Selenium2Library.Click Element    //div[@id='jnprDataTableContent_cases_ngcsc_subtab_all_open_cases']/div[2]/div/div[1]/div[3]/div/div/div[1]/div[2]/div/div[1]/div/div/div/div/span
    BuiltIn.Sleep    10s
    ${caseId_title}    Selenium2Library.Get Location
    ${expected_casesId_title}    BuiltIn.Catenate    SEPARATOR=/    https://${Environment}/#en    US     dashboard    caseid_2017-0803-1552
    Log     ${expected_casesId_title}
    BuiltIn.Should Be Equal    ${expected_casesId_title}    ${caseId_title}
