*** Settings ***
Suite Setup       Common.Setup For Case Detail UI    ${My_Juniper_Staging}    ${NGCSC1_token}    ${Case ID}
Suite Teardown    Selenium2Library.Close Browser
Resource          ../../Common.robot

*** Variables ***
${Case ID}        2017-0914-T-0042
@{Types of File}    Device Config    Core File    Debug File    Log File    Other Device output    RSI    Syslog
...               Tech Support File    Topology

*** Test Cases ***
Navigating to Case through Case Grid
    [Tags]    attach
    BuiltIn.Sleep    5s
    Selenium2Library.Mouse Over    //ul[@id='nxcsc-tabbed-table-tabs-main']/li[3]
    Selenium2Library.Click Element    //ul[@id='nxcsc-tabbed-table-tabs-main']/li[3]
    BuiltIn.Sleep    5s
    Selenium2Library.Click Element    //div[@id='cases_tabview_cases_tabbed_table']/div/section/div/div/div/div[1]/button[1]
    BuiltIn.Sleep    5s
    Selenium2Library.Input Text    //input[@id='rc-input-srId']    ${Case ID}
    BuiltIn.Sleep    5s
    Comment    Selenium2Library.Click Element    //div[@id='jnprDataTableContent_cases_ngcsc_subtab_my_reported_cases']/div[2]/div/div[1]/div[3]/div[1]/div/div[1]/div[2]/div/div[1]/div/div/div/div/span
    Selenium2Library.Click Element    //div[@id='jnprDataTableContent_cases_ngcsc_subtab_all_open_cases']/div[2]/div/div[1]/div[3]/div/div/div[1]/div[2]/div/div[1]/div/div/div/div/span
    BuiltIn.Sleep    10s
    Selenium2Library.Element Should Be Visible    //a[@id='case_attachments_title']
    BuiltIn.Sleep    5s
    Selenium2Library.Click Element    //a[@id='case_attachments_title']
    BuiltIn.Sleep    2s

Types of File Available for Attachment
    [Tags]    attach
    Selenium2Library.Mouse Over    //div[@id='divSelAttachFileType']/div/div[1]
    Selenium2Library.Click Element    //div[@id='divSelAttachFileType']/div/div[1]
    BuiltIn.Sleep    5s
    ${all_file_types_webelements}    Selenium2Library.Get Webelements    //div[@id='divSelAttachFileType']/div/div[2]/ul/li/label/span[1]
    BuiltIn.Sleep    2s
    ${all_fileTypes_text}    Common.getting elements text from allwebelements    ${all_file_types_webelements}
    Log    ${all_fileTypes_text}
    Collections.Lists Should Be Equal    ${all_fileTypes_text}    ${Types of File}

Authorization to Attach a File
    [Tags]    attach
    BuiltIn.Sleep    5s
    Selenium2Library.Element Should Be Visible    //div[@id='uploader']/div/button

Private and Public Button not Available for External User
    [Tags]    attach
    BuiltIn.Sleep    5s
    Selenium2Library.Element Should Not Be Visible    //div[@id="case_attachments"]/div/div/div[1]/div[3]/label
    BuiltIn.Sleep    5s
    Selenium2Library.Element Should Not Be Visible    //div[@id="case_attachments"]/div/div/div[1]/div[3]/label

Navigating to Case Attachment Tab through Global Search
    [Tags]    attach
    Selenium2Library.Input Text    //section[@id='nxcsc-global-search-container']/input    ${Case ID}
    Selenium2Library.Press Key    //section[@id='nxcsc-global-search-container']/input    \\13
    BuiltIn.Sleep    5s
    Selenium2Library.Click Element    //div[@id='jnprDataTableContent_search_function_tab_cases']/div/div/div[2]/div/div[1]/div[3]/div[1]/div/div[1]/div[2]/div/div[1]/div/div/div/div/span
    BuiltIn.Sleep    10s
    Selenium2Library.Element Should Be Visible    //a[@id='case_attachments_title']
    BuiltIn.Sleep    5s
    Selenium2Library.Click Element    //a[@id='case_attachments_title']
    BuiltIn.Sleep    5s

Attach A File
    [Tags]    attach
    Comment    Selenium2Library.Click Button    //div[@id='uploader']/div/button
    BuiltIn.Sleep    2s
    Comment    ${all_windows}    Selenium2Library.List Windows
    Comment    Log    ${all_windows}
    ${original_value}    Selenium2Library.Get Text    //a[@id='case_attachments_title']/span
    Log    ${original_value}
    ${original_value}    String.Strip String    ${original_value}    mode=both    characters=()
    Sleep    5s
    Selenium2Library.Choose File    //div[@id='uploader']/div/input    C:\\Users\\radhikag\\Downloads\\tests.txt
    BuiltIn.Sleep    15s
    ${expected_value}    Evaluate    ${original_value} + 1
    BuiltIn.Sleep    2s
    ${new_value}    Selenium2Library.Get Text    //a[@id='case_attachments_title']/span
    ${new_value}    String.Strip String    ${original_value}    mode=both    characters=()
    Should Be Equal As Integers    ${new_value}    ${expected_value}
