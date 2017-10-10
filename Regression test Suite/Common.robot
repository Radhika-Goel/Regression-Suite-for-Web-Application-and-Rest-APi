*** Settings ***
Library           String
Library           json
Library           Collections
Library           BuiltIn
Library           requests
Library           Selenium2Library
Resource          Variables.txt
Library           ast
Library           ngcscCommonMethods
Library           DateTime

*** Variables ***
${Contracts Expired API request}    {"pageItems":50,"paginatingForward":true,"filterModel":[{"status":{"type":"1","filter":["expired"],"fieldCase":"UPPER"}},{"endDate":{"filter":[null]}}],"firstRecord":null,"lastRecord":null,"searchBy":"user"}
${ExternalUser}    ngcsc1@ngcsc.33mail.com
${MyJuniper_IP}    myjuniper.juniper.net
${My_Juniper_Staging}    10.85.81.171
${My_Juniper_Testing}    10.85.40.171
${My_Juniper_Dev}    172.22.147.249
${Click_Login_Menu_Link}    xpath=//div[@id='horz-menu-profile']/i
${Edit_Account}    xpath=//a[contains(@href, 'https://userregistration.juniper.net/entitlement/editAcctInfo.do')]
${Reset_Password}    xpath=//a[@href='https://www.juniper.net/entitlement/changePassword.do']
${Login_Assistance_link}    xpath=//a[contains(@href, 'https://userregistration.juniper.net/entitlement/loginAssistance.do')]
${Add_button}     xpath=.//*[@id='supertab-add-icon']
${Add_Custom_Tab_Window}    xpath=//input[@id='nxcsc-addtab-name']
${Save_Custom_tab_Window}    xpath=//div[@id='nxcsc-add-tab-custom-wrapper']/section/div/button[2]
${Click_Table_Option}    xpath=//div[2]/div/button
${Click_Clear_Filters}    xpath=//section/div/span[2]
${external myjuniper api}    https://apigateway.juniper.net/myjuniper
${Contract Line Item API}    api/contract-manager/contractItems
${Product Component API}    api/ibase-manager/ibaseProducts
${get All Accounts API}    api/user-manager/getAllAccounts
${Case ID}        2017-0427-T-2170
${External URl}    https://devapigateway.sndbx.junipercloud.net/myjuniper
${External products Components URL}    api/v1.0/ibase-manager/productComponents
${External Contract Details API}    api/v1.0/contract-manager/contractDetails
@{Priority}       P1 - Critical    P2 - High    P3 - Medium    P4 - Low
@{Status}         Assigned    Awaiting Customer    Dispatch    In Process    Pending Closure    Submitted
@{Type}           Technical Service Request    Admin Service Request
@{Type Code}      ZTEC    ZADM
@{Priority key}    01    02    03    04
${user}           ngcsc2@ngcsc.33mail.com
${password}       juniper
@{Follow UP method Preference}    Email Secure Web Link    Phone Call    Email Full Text Update
${Case Detail API}    api/case-manager/cases
${Case ID}        2017-0427-T-2170
@{Serial/SSRN}    AB3809AA0014    CABV4435
@{System/Router}    Lemon-12b    RN 45
@{Series}         MX-Series    Contrail
@{Platform}       MX2020    Contrail
@{Release}        JUNOS13.3    4.0
${ssrn}           152115129000
@{Case Fields}    id    priority    categories    escalation    customerTrackingNumber    synopsis    status
...               reason    type    owner    createDate    closedDate    lastModifiedDate
@{Product Fields}    softwareSupportReferenceNumber    serialNumber    series    platform    release    version    routerName
@{Account Fields}    id    name
@{Contact Fields}    name    email    followUpMethodPreferrence    preferredCallBackNumber    addInboundEmailIdToEmailRecipients    emailCC    ccEngineer
...               phone
@{reason}         Customer Info Required    Customer Responded    Partner Info Required    Workaround Provided    Require Information    Monitoring    File Uploaded
@{ccList}         ngcsc1@ngcsc.33mail.com    ngcsc2@ngcsc.33mail.com    ngcsc6@ngcsc.33mail.com
@{srCategory1}    Customer Feedback    Courtesy Case    Environmental Compliance    Software Problem    Hardware Problem
@{Employee Responsible}    Radhika Goel    Jaikanth Seshasayanam
@{Employee ID}    0000051267    0000007518
@{DonotCopyCC}    X    ${EMPTY}
@{srCategory2}    Customer Knowledge    Defect    Feature Configuration    Active Participation    WEEE Submission
@{srCategory3}    Error/InAccurate    Missing    Inaccessible    Complex Data Collection    testing
@{srCategory4}    AA    BB    CC    DD    EE
@{technicalCategory2}    JUNOS Space    Attack Objects    Alarming    Chassis    Device Management
@{technicalCategory3}    Network Activation Director    802.1 ad/ah    Basic    Complete System    HTTP
@{technicalCategory4}    L1    C1    D1    A1    B1
@{CCEngineer}     jerome.boutin@oracle.com    jake@sonicequipment.com    tcastro@semprautilities.com    aru@google.com    rda@rincon.com
@{Preferred Country}    AL    BE    CAR    DE    IN
@{preferredCountryExtension}    +93    +32    +236    +49    +91
@{PreferredPhoneNumber}    3459876    234569870    34560987    98766554431    9872340040
@{Escalation}     Case Status Update    Faster Progress    Support Engineer Now    Case Reassignment    Mis-Use

*** Keywords ***
getting elements text from allwebelements
    [Arguments]    ${all_reported_col_elements}
    ${total_columns}    BuiltIn.Get Length    ${all_reported_col_elements}
    ${columns_text}    BuiltIn.Create List
    : FOR    ${i}    IN RANGE    ${total_columns}
    \    Exit For Loop If    '${i}' == '10'
    \    ${element}    Collections.Get From List    ${all_reported_col_elements}    ${i}
    \    ${value}    Selenium2Library.Get Text    ${element}
    \    Collections.Append To List    ${columns_text}    ${value}
    Log    ${columns_text}
    [Return]    ${columns_text}

API Request
    [Arguments]    ${pageItems}    ${startDate}    ${endDate}
    ${restIp}    String.Replace String    ${MyJuniper_Segregated_IP}/api1    api1    ${Products_API}
    ${params}    BuiltIn.Set Variable    {"pageItems":${pageItems},"paginatingForward":true,"filterModel":[{"endOfLifeDate":{"type":"13","filter":["${startDate} AND ${endDate}"]}}],"firstRecord":null,"lastRecord":null,"searchBy":"user"}
    ${params}    json.Loads    ${params}
    log    ${params}
    ${params}    json.Dumps    ${params}
    Log    ${params}
    Comment    ${headers}    BuiltIn.Create Dictionary    Authorization=Bearer eyJjdHkiOiJKV1QiLCJlbmMiOiJBMjU2R0NNIiwiYWxnIjoiZGlyIn0..KI2DSldV2RAlPFU8.ZYZFP5Tve-_3bNm975TzUpNf-eX__KF96UHPukKzEHzi9N1PW_uit8FOs7Wh04neES1rHUiUxNX3a5kEnmpR4dOToAHMI9YQGpLmnGp3mqnEOZvWBydIZFfslxjq2qmXCmzfSD2f3pSJvOj9n0NOwYIHMtg6oQ8JxocdPd6NbbVuTurhfdfAWRYojRLv13mSNUSMGCk62VnWlI5X8w7K3_KyluJHW7gAp436ukXqHEORXYpQKTiJ444MpTK0yT2nuq1I0SiXHyp_gT3oaAzPN8TXAmdnUI2BhpdlsQWTX3VHmfI1-NbTe2UL6otOk39z7UslyLLG360ioBDMmdL9Fgr4hwhMvr8SMw4W-mfnLeVxWXBlp9a4YZUBBhRqHv5NVIOKJV3QX2hkGi60Ox3Ee8lfUaeT39ayOGjWR3fIs1dSwZF3lJbvuR25BhLrCReImJwd5SYlj-BY_VcrO-l-D6gidTwyanMCALqE5zOlJb_QX1RCW5IrHmriR7vOafm0srH36HsoX8dnKt4_6Va5e5j8TY3WXxm_Z1o62aUN7Z8xX2uRG35e0pp1K5uy7kSnst6YErHAPeuUCEyy4u66x2iVuA5Squ55aGpQLgDWQfSWVXF86v4VeybcW_cH_fJNT8eXkh4YBONxaLk1KawmIT31tgwv5Zmli3LM0vacM9mk8B6Dy1HokZ05b4scVa1oyQbWZz2F1OZjetSVgSjVqNQQy6-98NwFd3X7P3Fq9TBmFGqCkzKr330FWzOTlFyJGxYZJwRLENUz29CU1XD8voTPTe_syShhrm0pUzpbzIBlVVDeLuFDZXHoEVQDngDUnRNJqp67MUK_t-IqvHfYUFJIDm5teVBAFhLlFWSVSpRm5C5_oUwhPPBDwx2F.fxIyKp0EfIkslF44Fd0tZw
    ${headers}    BuiltIn.Create Dictionary    Authorization=${NGCSC9_token}
    ${headers1}    BuiltIn.Create Dictionary    'content-type'=application/json
    ${response}    requests.Post    ${restIp}    data=${params}    headers=${headers}    verify=${FALSE}
    ${api_output_json}    BuiltIn.Set Variable    ${response.json()}
    [Return]    ${api_output_json}

Getting serial Number from records
    [Arguments]    ${records}    ${key_value}
    ${total_records}    BuiltIn.Get Length    ${records}
    ${all_serial_records}    BuiltIn.Create List
    : FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${records}    ${i}
    \    ${value}    Collections.Get From Dictionary    ${record}    ${key_value}
    \    Collections.Append To List    ${all_serial_records}    ${value}
    Log    ${all_serial_records}
    [Return]    ${all_serial_records}

Contracts Expired API
    [Arguments]    ${total_page_items}
    ${restIp}    String.Replace String    ${MyJuniper_Segregated_IP}/api1    api1    ${Contracts_API}
    Comment    ${restIp}    String.Replace String    http://${MyJuniper_Segregated_IP}/api1    api1    ${Contracts_API}
    ${params}    BuiltIn.Set Variable    {"pageItems":${total_page_items},"paginatingForward":true,"filterModel":[{"status":{"type":"1","filter":["expired"],"fieldCase":"UPPER"}},{"endDate":{"filter":[null]}}],"firstRecord":null,"lastRecord":null,"searchBy":"user"}
    ${params}    json.Loads    ${params}
    log    ${params}
    ${params}    json.Dumps    ${params}
    Log    ${params}
    Comment    ${Authorization_token}    json.Dumps    ${Authorization_token}
    Comment    Log    ${Authorization_token}
    Comment    ${Authorization_token}    ast.Literal Eval    ${Authorization_token}
    Comment    Log    ${Authorization_token}
    Comment    ${headers}    BuiltIn.Create Dictionary    ${Authorization_token}
    ${headers}    BuiltIn.Create Dictionary    Authorization=${NGCSC9_token}
    Comment    Collections.Set To Dictionary    ${headers}    Authorization=${Authorization_token}
    log    ${headers}
    ${headers1}    BuiltIn.Create Dictionary    'content-type'=application/json
    ${response}    requests.Post    ${restIp}    data=${params}    headers=${headers}    verify=${FALSE}
    ${api_output_json}    BuiltIn.Set Variable    ${response.json()}
    [Return]    ${api_output_json}

Contracts 90 days
    [Arguments]    ${total_page_items}    ${startDate}    ${endDate}
    ${restIp}    String.Replace String    ${MyJuniper_Segregated_IP}/api1    api1    ${Contracts_API}
    Comment    ${restIp}    String.Replace String    http://${MyJuniper_Segregated_IP}/api1    api1    ${Contracts_API}
    ${params}    BuiltIn.Set Variable    {"pageItems":${total_page_items},"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"status":{"type":"1","filter":["active"],"fieldCase":"UPPER"}},{"endDate":{"type":"13","filter":["${startDate} AND ${endDate}"]}}],"firstRecord":null,"lastRecord":null,"searchBy":"user"}
    ${params}    json.Loads    ${params}
    log    ${params}
    ${params}    json.Dumps    ${params}
    Log    ${params}
    Comment    ${headers}    BuiltIn.Create Dictionary    Authorization=Bearer eyJjdHkiOiJKV1QiLCJlbmMiOiJBMjU2R0NNIiwiYWxnIjoiZGlyIn0..KI2DSldV2RAlPFU8.ZYZFP5Tve-_3bNm975TzUpNf-eX__KF96UHPukKzEHzi9N1PW_uit8FOs7Wh04neES1rHUiUxNX3a5kEnmpR4dOToAHMI9YQGpLmnGp3mqnEOZvWBydIZFfslxjq2qmXCmzfSD2f3pSJvOj9n0NOwYIHMtg6oQ8JxocdPd6NbbVuTurhfdfAWRYojRLv13mSNUSMGCk62VnWlI5X8w7K3_KyluJHW7gAp436ukXqHEORXYpQKTiJ444MpTK0yT2nuq1I0SiXHyp_gT3oaAzPN8TXAmdnUI2BhpdlsQWTX3VHmfI1-NbTe2UL6otOk39z7UslyLLG360ioBDMmdL9Fgr4hwhMvr8SMw4W-mfnLeVxWXBlp9a4YZUBBhRqHv5NVIOKJV3QX2hkGi60Ox3Ee8lfUaeT39ayOGjWR3fIs1dSwZF3lJbvuR25BhLrCReImJwd5SYlj-BY_VcrO-l-D6gidTwyanMCALqE5zOlJb_QX1RCW5IrHmriR7vOafm0srH36HsoX8dnKt4_6Va5e5j8TY3WXxm_Z1o62aUN7Z8xX2uRG35e0pp1K5uy7kSnst6YErHAPeuUCEyy4u66x2iVuA5Squ55aGpQLgDWQfSWVXF86v4VeybcW_cH_fJNT8eXkh4YBONxaLk1KawmIT31tgwv5Zmli3LM0vacM9mk8B6Dy1HokZ05b4scVa1oyQbWZz2F1OZjetSVgSjVqNQQy6-98NwFd3X7P3Fq9TBmFGqCkzKr330FWzOTlFyJGxYZJwRLENUz29CU1XD8voTPTe_syShhrm0pUzpbzIBlVVDeLuFDZXHoEVQDngDUnRNJqp67MUK_t-IqvHfYUFJIDm5teVBAFhLlFWSVSpRm5C5_oUwhPPBDwx2F.fxIyKp0EfIkslF44Fd0tZw
    ${headers}    BuiltIn.Create Dictionary    Authorization=${NGCSC9_token}
    ${headers1}    BuiltIn.Create Dictionary    'content-type'=application/json
    ${response}    requests.Post    ${restIp}    data=${params}    headers=${headers}    verify=${FALSE}
    ${api_output_json}    BuiltIn.Set Variable    ${response.json()}
    [Return]    ${api_output_json}

Contracts slice
    [Arguments]    ${total_page_items}    ${startDate}    ${endDate}
    ${restIp}    String.Replace String    ${MyJuniper_Segregated_IP}/api1    api1    ${Contracts_API}
    Comment    ${restIp}    String.Replace String    http://${MyJuniper_Segregated_IP}/api1    api1    ${Contracts_API}
    ${params}    BuiltIn.Set Variable    {"pageItems":${total_page_items},"paginatingForward":true,"filterModel":[{"endDate":{"type":"13","filter":["${startDate} AND ${endDate}"]}}],"firstRecord":null,"lastRecord":null,"searchBy":"user"}
    ${params}    json.Loads    ${params}
    log    ${params}
    ${params}    json.Dumps    ${params}
    Log    ${params}
    ${headers}    BuiltIn.Create Dictionary    Authorization=${NGCSC9_token}
    ${headers1}    BuiltIn.Create Dictionary    'content-type'=application/json
    ${response}    requests.Post    ${restIp}    data=${params}    headers=${headers}    verify=${FALSE}
    ${api_output_json}    BuiltIn.Set Variable    ${response.json()}
    [Return]    ${api_output_json}

Open Browser with Internal User Details
    [Arguments]    ${env_IP}
    Selenium2Library.Open Browser    https://${env_IP}    Chrome
    ${title}    Selenium2Library.Get Title
    #Selenium2Library.Title Should Be    MyJuniper
    sleep    5s
    Selenium2Library.Input Text    //input[@id='userid']
    Selenium2Library.Input Password    //input[@id='password']
    Selenium2Library.Click Button    //input[@value=' Login ']
    Selenium2Library.Maximize Browser Window
    BuiltIn.Sleep    5s

Open Browser with Invalid Credentails
    Selenium2Library.Open Browser    https://${MyJuniper_IP}    Chrome
    ${title}    Selenium2Library.Get Title
    sleep    5s
    Selenium2Library.Input Text    //input[@id='userid']    abcd
    Selenium2Library.Input Password    //input[@id='password']    1234
    Selenium2Library.Click Button    //input[@value=' Login ']
    Selenium2Library.Maximize Browser Window
    BuiltIn.Sleep    5s
    Selenium2Library.Title Should Be    Login : Juniper Networks

Login with external user credentials
    Selenium2Library.Input Text    //input[@id='customer-email-address']    ${ExternalUser}
    Selenium2Library.Select From List By Index    //select[@id='login-reason-opt']    2
    BuiltIn.Sleep    2s
    Selenium2Library.Click Button    //button[@id='nxcsc-btn-external-login']
    BuiltIn.Sleep    5s

Select External User
    BuiltIn.Sleep    5s
    Selenium2Library.Mouse Over    //*[@id='external-login-wrapper']/section
    Selenium2Library.Mouse Over    //*[@id='login-format']/label[1]/span[4]
    #Selenium2Library.Select Radio Button    login-type    login-customer
    Selenium2Library.Click Element    //*[@id='login-format']/label[1]/span[4]
    BuiltiN.Sleep    5s

Login to view external user data
    Common.Open Browser with Internal User Details    ${My_Juniper_Testing}
    Common.Select External User
    Common.Login with external user credentials

Capturing data through Horizontal Scroll
    [Arguments]    ${last}
    ${loop_value}    Evaluate    ${last} / 10
    ${total_elements}    Create List
    : FOR    ${i}    IN RANGE    ${loop_value}
    \    ${open_elements}    Selenium2Library.Get Webelements    //div[@id='jnprDataTableContent_contracts_ngcsc_subtab_all_active']/div[2]/div/div[1]/div[3]/div
    \    Execute Javascript    window.scrollTo(223,0)
    \    BuiltIn.Sleep    10s
    \    Selenium2Library.Click Element    //div[@id='jnprDataTableContent_contracts_ngcsc_subtab_all_active']/div[2]/div/div[2]/div
    ${EMPTY}
    \    Comment    Selenium2Library.Mouse Over    //div[@id='jnprDataTableContent_contracts_ngcsc_subtab_all_active']/div[2]/div/div[2]/div
    ${EMPTY}
    \    #${new_elements}    Selenium2Library.Get Webelements    //div[@id='jnprDataTableContent_contracts_ngcsc_subtab_all_active']/div[2]/div/div[1]/div[3]/div
    \    ${total_elements}    Collections.Combine Lists    ${total_elements}    ${open_elements}
    ${all_elements_text}    Common.getting elements text from allwebelements    ${total_elements}

Executing API
    [Arguments]    ${API}    ${Param}    ${token}
    ${rest_api}    BuiltIn.Set Variable    ${API}
    ${params}    BuiltIn.Set Variable    ${Param}
    ${inputData}    json.Loads    ${params}
    ${inputData}    json.Dumps    ${inputData}
    Log    ${inputData}
    Comment    ${headers}    Create Dictionary    Authorization=Bearer eyJjdHkiOiJKV1QiLCJlbmMiOiJBMjU2R0NNIiwiYWxnIjoiZGlyIn0..i6s_jMOA88NohfR6.lgSLmf5Fv9xCKkJ-wQqQyEJBuM_M5vjs0hXK_n5Y7hu3PMUEc3ZsO2LiQ8HlghHNErm-Inx8zyXLOAyECn7wESj3_fhCu7AfvN1nSCbaLSRNbPUsMph4TPRK7t2GbGR2SIXzD0fvXvfcb6causWOxpANqbOrSduOkgzo0AHmYb9Czlpi-GgxwnsFrsjL2LGDLWFDt-D6yb1A-vy1bxwNRc06etszb529X4LTZNvybF9mSr2Ktdpf7dMiE6jsDNBVj8K6BdwNtYqiWAh6KkFwYozLMzUPxlMKqgOIVTIRATzdVwklcW-Day73z1Qt9U37HWnM-VGfCk__fAsKlRI0BxVkOL-i80-mEvIcDNqnmiagUMVCXPNpl9ws0pPmznFvGSrzCuicjcfcsvnmmkKMyyi5CRkz_atlcREIYr32R7OKnl6HHQ6bGTMeO_1k2uvveE7A1As4DGYAMfEbPu7bxlFS0etJsdbks9Zq-GzXOz6RYdWu0lqqy4CHFmsU3_swc1FkNXj8PXcAYQIx5S1lVRAzzvNZdsusQMARGmRz5GQkedKzQFSI70qeUIm1Ka46raFIcXD2FFSYkpVMLbHB33WYDVKXRD1f2t-dC5Fg8Xyb-RAEPm3ycpRcGJjtOgI-aDG6GqI1dmuJvWrWJsvBvkK0_wLLpcIXOKNBqx3IjcONEjg_3nPOCOO89fVIU7I4AYQzA32VWFDoq_pFFAQG6ltWTWa5nYsOckDsoIb_n8XSfC1Ib4oC0n-xwbVA2qg5ng_YBNsZxHD0z5l0UHmAOxEiZkseD1ZPkuxM0bK6HRVguoCvSNsRot5mkQ7KmRvJ3N07vgVeTNJG_Wo2HflDuZ5FaBzKEt8WRuF_Zbo2q4ot1JN4a-2SlxBxXgUc.37CCBaM36qzhLAvl2LfSKA
    ${headers}    BuiltIn.Create Dictionary    Authorization=${token}
    Comment    ${headers1}    Create Dictionary    'content-type'=application/json
    ${response}    requests.Post    ${rest_api}    data=${inputData}    headers=${headers}    verify=${FALSE}
    Log    ${response.content}
    Should Be Equal    ${response.status_code}    ${200}
    Log    ${response.headers}
    ${api_output_json}    BuiltIn.Set Variable    ${response.json()}
    Log    ${api_output_json}
    [Return]    ${api_output_json}

Click On Cases
    BuiltIn.Sleep    5s
    Selenium2Library.Mouse Over    //div[@id='mCSB_1_container']/li/div/div/ul/li/span[text()='CASES']
    Selenium2Library.Click Element    //div[@id='mCSB_1_container']/li/div/div/ul/li/span[text()='CASES']

Click on Products
    BuiltIn.Sleep    5s
    Selenium2Library.Mouse Over    //div[@id='mCSB_1_container']/li/div/div/ul/li/span[text()='PRODUCTS']
    Selenium2Library.Click Element    //div[@id='mCSB_1_container']/li/div/div/ul/li/span[text()='PRODUCTS']

Click On Contracts
    BuiltIn.Sleep    5s
    Selenium2Library.Mouse Over    //div[@id='mCSB_1_container']/li/div/div/ul/li/span[text()='CONTRACTS']
    Selenium2Library.Click Element    //div[@id='mCSB_1_container']/li/div/div/ul/li/span[text()='CONTRACTS']

Setup For Search SN Enhancement
    Common.Open Browser with title Validation    ${My_Juniper_Testing}
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ngcscCommonMethods.send message    cases    ${Case ID}    152115123000    ${msgRcdTs}    SUB00019940428
    BuiltIn.Sleep    60s
    Log    Sending Messages for Products
    ${start_time_pst_epoch}    ngcscCommonMethods.epoch min time in pst
    ${current_Date}    ngcscCommonMethods.get currentdate pst
    ${slice_date}    DateTime.Add Time To Date    ${current_Date}    89 days
    ${endDate_pst_epoch}    ngcscCommonMethods.epoch pst end slice time    ${slice_date}
    ${eol_date_format}    DateTime.Add Time To Date    ${current_Date}    10 days
    ${eol_date}    DateTime.Convert Date    ${eol_date_format}    result_format=%Y%m%d%H%M    date_format=%Y-%m-%d %H:%M:%S.%f
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ngcscCommonMethods.Send Message    ib    10019728101    0100071675    ZI000002    Installed At    0162052013000477
    ...    RTU00000050128    ${msgRcdTs}
    ngcscCommonMethods.Send Message    pm    ${eol_date}    ${msgRcdTs}
    ngcscCommonMethods.Send Message    ib    10019728101    0100071675    ZI000002    Installed At    0162052013000477
    ...    RTU00000050128    ${msgRcdTs}
    BuiltIn.Sleep    60s
    ${start_time_pst_epoch}    ngcscCommonMethods.epoch min time in pst
    ${current_Date}    ngcscCommonMethods.get currentdate pst
    ${slice_date}    DateTime.Add Time To Date    ${current_Date}    89 days
    ${endDate_pst_epoch}    ngcscCommonMethods.epoch pst end slice time    ${slice_date}
    ${header_end_date}    DateTime.Add Time To Date    ${current_Date}    10 days
    ${header_end_date}    DateTime.Convert Date    ${header_end_date}    result_format=%Y%m%d%H%M    date_format=%Y-%m-%d %H:%M:%S.%f
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ngcscCommonMethods.Send Message    contracts    ${header_end_date}    ${msgRcdTs}    Active    0100108001    ZRE00001
    ...    Primary Reseller    0060133102
    BuiltIn.Sleep    60s

Suite Setup for Vesper changes
    [Arguments]    ${message}
    Common.Open Browser with title Validation    ${MyJuniper_IP}
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ngcscCommonMethods.send message    ${message}    152115129000    ${msgRcdTs}    SUB00019940428    2017-0814-T-1714
    BuiltIn.Sleep    5s
    Common.Click On Cases

Remove Colums From Cases Widget
    Selenium2Library.Click Element    //div[@id='cases_tabview_cases_tabbed_table']/div/section/div/div/div[1]/section/aside/div[2]/div[2]/section/div[2]/ul/li[2]/span[2]
    BuiltIn.Sleep    5s
    Selenium2Library.Click Element    //div[@id='cases_tabview_cases_tabbed_table']/div/section/div/div/div[1]/section/aside/div[2]/div[2]/section/div[2]/ul/li[3]/span[2]
    BuiltIn.Sleep    5s
    Selenium2Library.Click Element    //div[@id='cases_tabview_cases_tabbed_table']/div/section/div/div/div[1]/section/aside/div[2]/div[2]/section/div[2]/ul/li[4]/span[2]
    BuiltIn.Sleep    5s
    Selenium2Library.Click Element    //div[@id='cases_tabview_cases_tabbed_table']/div/section/div/div/div[1]/section/aside/div[2]/div[2]/section/div[2]/ul/li[5]/span[2]
    BuiltIn.Sleep    5s
    Selenium2Library.Click Element    //div[@id='cases_tabview_cases_tabbed_table']/div/section/div/div/div[1]/section/aside/div[2]/div[2]/section/div[2]/ul/li[6]/span[2]
    BuiltIn.Sleep    5s
    Selenium2Library.Click Element    //div[@id='cases_tabview_cases_tabbed_table']/div/section/div/div/div[1]/section/aside/div[2]/div[2]/section/div[2]/ul/li[7]/span[2]
    BuiltIn.Sleep    5s
    Selenium2Library.Click Element    //div[@id='cases_tabview_cases_tabbed_table']/div/section/div/div/div[1]/section/aside/div[2]/div[2]/section/div[2]/ul/li[8]/span[2]
    BuiltIn.Sleep    5s
    Selenium2Library.Click Element    //div[@id='cases_tabview_cases_tabbed_table']/div/section/div/div/div[1]/section/aside/div[2]/div[2]/section/div[2]/ul/li[9]/span[2]
    BuiltIn.Sleep    5s
    Selenium2Library.Mouse Over    //div[@id='cases_tabview_cases_tabbed_table']/div/section/div/div/div/section/aside/div/div/i
    Selenium2Library.Click Element    //div[@id='cases_tabview_cases_tabbed_table']/div/section/div/div/div/section/aside/div/div/i
    BuiltIn.Sleep    5s

Open Browser with title Validation
    [Arguments]    ${testing_env}
    ${IP}    String.Replace String    http://url    url    ${testing_env}
    Selenium2Library.Open Browser    ${IP}    Chrome
    Maximize Browser Window
    Sleep    5
    Selenium2Library.Title Should Be    Login : Juniper Networks
    Sleep    3
    Input Text    //input[@id='userid']    ${user}
    Input Password    //input[@id='password']    ${password}
    Sleep    3
    Click Element    //input[@value=' Login ']
    Sleep    5
    Title Should Be    MyJuniper
    BuiltIn.Sleep    5s

Click on Cases Filter Clear all
    Sleep    5
    Click Element    ${Click_Table_Option}
    Sleep    3
    Click Element    ${Click_Clear_Filters}
    Comment    Selenium2Library.click Element    //div[@id="cases_tabview_cases_tabbed_table"]/div/section/div/div/div[1]/section/aside/div[2]/div[3]/section/div[1]/span[2]

Logout
    sleep    2s
    Click Element    xpath=//*[@class='material-icons arrow-down animated']
    sleep    2s
    Click Element    xpath=//*[@id='btnLogout']
    Selenium2Library.Close Browser

Contract Line Item
    [Arguments]    ${IP}    ${URL}    ${field}    ${Contract ID}    ${token}
    ${restIp}    String.Replace String    ${IP}/api1    api1    ${URL}
    ${params}    BuiltIn.Set Variable    {"contractId":"${Contract ID}"}
    ${params}    json.Loads    ${params}
    log    ${params}
    ${params}    json.Dumps    ${params}
    Log    ${params}
    ${headers}    BuiltIn.Create Dictionary    Authorization=${token}
    log    ${headers}
    ${headers1}    BuiltIn.Create Dictionary    'content-type'=application/json
    ${response}    requests.Post    ${restIp}    data=${params}    headers=${headers}    verify=${FALSE}
    ${api_output_json}    BuiltIn.Set Variable    ${response.json()}
    ${total_records_output}    Collections.Get From Dictionary    ${api_output_json}    totalRecords
    ${contract_records}    Collections.Get From Dictionary    ${api_output_json}    ${field}
    ${all_contractId_records}    Common.Getting serial Number from records    ${contract_records}    contractId
    [Return]    ${all_contractId_records}

Product Component API
    [Arguments]    ${IP}    ${URL}    ${field}    ${Parent Serial Number}
    ${restIp}    String.Replace String    ${IP}/api1    api1    ${URL}
    ${params}    BuiltIn.Set Variable    {"serialNumber":"${Parent Serial Number}"}
    ${params}    json.Loads    ${params}
    log    ${params}
    ${params}    json.Dumps    ${params}
    Log    ${params}
    ${headers}    BuiltIn.Create Dictionary    Authorization=${NGCSC1_token}
    log    ${headers}
    ${headers1}    BuiltIn.Create Dictionary    'content-type'=application/json
    ${response}    requests.Post    ${restIp}    data=${params}    headers=${headers}    verify=${FALSE}
    ${api_output_json}    BuiltIn.Set Variable    ${response.json()}
    ${product_records}    Collections.Get From Dictionary    ${api_output_json}    ${field}
    ${all_serialNumber_records}    Common.Getting serial Number from records    ${product_records}    serialNumber
    [Return]    ${all_serialNumber_records}

Get All Accounts API
    [Arguments]    ${entity}    ${token}
    ${restIp}    String.Replace String    ${MyJuniper_Segregated_IP}/api1    api1    ${get All Accounts API}
    ${params}    BuiltIn.Set Variable    {"entity":"${entity}"}
    ${params}    json.Loads    ${params}
    log    ${params}
    ${params}    json.Dumps    ${params}
    Log    ${params}
    ${headers}    BuiltIn.Create Dictionary    Authorization=${token}
    log    ${headers}
    ${headers1}    BuiltIn.Create Dictionary    'content-type'=application/json
    ${response}    requests.Post    ${restIp}    data=${params}    headers=${headers}    verify=${FALSE}
    ${api_output_json}    BuiltIn.Set Variable    ${response.json()}
    [Return]    ${api_output_json}

Suite Setup For Edit Case Details
    [Arguments]    ${testing_env}    ${token}
    Common.Open Browser with title Validation    ${testing_env}
    Sleep    5s
    Comment    Common.Suite Setup for Case Details    ${token}    2017-0905-T-0033
    Common.Click On Cases
    Sleep    5s
    Selenium2Library.Click Element    //ul[@id='nxcsc-tabbed-table-tabs-main']/li[3]    #Click on Open Tab
    Sleep    5s
    Selenium2Library.Click Button    //div[@id='cases_tabview_cases_tabbed_table']/div/section/div/div/div/div[1]/button[1]    #Click on Filter Options
    Sleep    5s
    Selenium2Library.Input Text    //input[@id='rc-input-srId']    2017-0810-T-0316
    Sleep    5s
    Selenium2Library.Click Element    //div[@id="jnprDataTableContent_cases_ngcsc_subtab_all_open_cases"]/div[2]/div/div[1]/div[3]/div/div/div[1]/div[2]/div/div[1]/div/div/div/div/span
    BuiltIn.sleep    10s
    Selenium2Library.Click Button    //input[@id='btnEdit']
    BuiltIn.sleep    10s

Suite Setup for Case Details
    [Arguments]    ${token}    ${Case ID}
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ${Type_value}    Generate Random String    1    01
    ${Type_value}    BuiltIn.Convert To Integer    ${Type_value}
    ${type}    Collections.Get From List    ${Type}    ${Type_value}
    ${type code}    Collections.Get From List    ${Type Code}    ${Type_value}
    ${priority_value}    Generate Random String    1    0123
    ${priority}    Collections.Get From List    ${Priority}    ${priority_value}
    ${priorty key}    Collections.Get From List    ${Priority key}    ${priority_value}
    ${follow_up_index}    Generate Random String    1    012
    ${followUpMethod}    Collections.Get From List    ${Follow UP method Preference}    ${follow_up_index}
    ${status_value}    Generate Random String    1    012345
    ${status}    Collections.Get From List    ${Status}    ${status_value}
    ${reason_script}    Collections.Get From List    ${reason}    ${follow_up_index}
    ${reason_sr}    BuiltIn.Set Variable If    '${status}' == 'Awaiting Customer'    ${reason_script}    ${None}
    ${status_for_UI}    BuiltIn.Catenate    SEPARATOR=${SPACE}-${SPACE}    ${status}    ${reason_sr}
    ${status_UI}    BuiltIn.Set Variable If    '${status}' == 'Awaiting Customer'    ${status_for_UI}    ${status}
    ${curent_date_local}    DateTime.Get Current Date    result_format=datetime    exclude_millis=true
    Comment    ${curent_date_local}    DateTime.Subtract Time From Date    ${curent_date}    05:30:00
    Log    ${curent_date_local}
    Comment    ${current_Date}    ngcscCommonMethods.get current date time pst
    ${create_date}    DateTime.Subtract Time From Date    ${curent_date_local}    10 days
    ${created_date_time}    DateTime.Convert Date    ${create_date}    result_format=%Y%m%d%H%M%S    date_format=%Y-%m-%d %H:%M:%S.%f
    Log    ${created_date_time}
    Set Global Variable    ${created_date_time}
    ${last_modified_date}    DateTime.Subtract Time From Date    ${curent_date_local}    1 day
    ${last modified time}    DateTime.Convert Date    ${last_modified_date}    result_format=%Y%m%d%H%M%S    date_format=%Y-%m-%d %H:%M:%S.%f
    log    ${last modified time}
    Set Global Variable    ${last modified time}
    ${all_cases_accounts}    Common.Get All Accounts API    cases    ${token}
    ${all_accounts}    Collections.Get From Dictionary    ${all_cases_accounts}    accountsList
    ${accountIds}    Common.Getting serial Number from records    ${all_accounts}    accountId
    ${accountName}    Common.Getting serial Number from records    ${all_accounts}    accountName
    ${total_records}    BuiltIn.Get Length    ${accountIds}
    ${index}    ngcscCommonMethods.getting randomNo fromlist    ${total_records}
    ${Account ID }    Collections.Get From List    ${accountIds}    ${index}
    ${account Name}    Collections.Get From List    ${accountName}    ${index}
    ${synopsis}    Generate Random String    250    [LETTERS]
    Comment    Common.Click On Cases
    Comment    BuiltIn.Sleep    5s
    Comment    Selenium2Library.Mouse Over    //ul[@id='nxcsc-tabbed-table-tabs-main']/li[3]
    Comment    Selenium2Library.Click Element    //ul[@id='nxcsc-tabbed-table-tabs-main']/li[3]
    ${customer_tracking}    Generate Random String    40    [LETTERS][NUMBERS]
    ${platform_details_index}    Generate Random String    1    01
    ${serial/ssrn}    Collections.Get From List    ${Serial/SSRN}    ${platform_details_index}
    ${system/router}    Collections.Get From List    ${System/Router}    ${platform_details_index}
    ${series}    Collections.Get From List    ${Series}    ${platform_details_index}
    ${platform}    Collections.Get From List    ${Platform}    ${platform_details_index}
    ${release}    Collections.Get From List    ${Release}    ${platform_details_index}
    ${categoryNo}    Generate Random String    1    01234
    ${srCategory1_script}    Collections.Get From List    ${srCategory1}    ${categoryNo}
    ${srCategory2_script}    Collections.Get From List    ${srCategory2}    ${categoryNo}
    ${srCategory3_script}    Collections.Get From List    ${srCategory3}    ${categoryNo}
    ${srCategory4_script}    Collections.Get From List    ${srCategory4}    ${categoryNo}
    ${employee_responsible_name}    Collections.Get From List    ${Employee Responsible}    ${Type_value}
    ${employee_responsible_id}    Collections.Get From List    ${Employee ID}    ${Type_value}
    ${donotCopyCCfield}    Collections.Get From List    ${DonotCopyCC}    ${Type_value}
    ${ccList_script}    Collections.Get From List    ${ccList}    ${follow_up_index}
    ${ccEngineer}    Collections.Get From List    ${CCEngineer}    ${categoryNo}
    ${techcate2}    Collections.Get From List    ${technicalCategory2}    ${categoryNo}
    ${techcate3}    Collections.Get From List    ${technicalCategory3}    ${categoryNo}
    ${techcate4}    Collections.Get From List    ${technicalCategory4}    ${categoryNo}
    ${prefCountry}    Collections.Get From List    ${Preferred Country}    ${categoryNo}
    ${prefExt}    Collections.Get From List    ${preferredCountryExtension}    ${categoryNo}
    ${prefPhone}    Collections.Get From List    ${PreferredPhoneNumber}    ${categoryNo}
    ${escalation_script}    Collections.Get From List    ${Escalation}    ${categoryNo}
    ${escalation_api}    BuiltIn.Set Variable If    '${type code}' == 'ZTEC'    ${escalation_script}    ${EMPTY}
    ngcscCommonMethods.send message    casemanager_case    ${account Name}    ${Account ID }    ${followUpMethod}    ${type}    ${priority}
    ...    ${status}    ${type code}    ${created_date_time}    ${last modified time}    ${priorty key}    ${msgRcdTs}
    ...    ${synopsis}    ${customer_tracking}    ${release}    ${serial/ssrn}    ${system/router}    ${series}
    ...    ${platform}    ${ssrn}    ${reason_script}    ${employee_responsible_name}    ${employee_responsible_id}    ${donotCopyCCfield}
    ...    ${srCategory1_script}    ${srCategory2_script}    ${srCategory3_script}    ${srCategory4_script}    ${ccList_script}    ${Case ID}
    ...    ${ccEngineer}    ${techcate2}    ${techcate3}    ${techcate4}    ${prefCountry}    ${prefExt}
    ...    ${prefPhone}    ${escalation_api}
    BuiltIn.Sleep    5s
    &{product detail dict}    BuiltIn.Create Dictionary    softwareSupportReferenceNumber=${ssrn}    serialNumber=${serial/ssrn}    series=${series}    platform=${platform}    release=${release}
    ...    version=F6    routerName=${system/router}
    &{account detail dict}    BuiltIn.Create Dictionary    id=${Account ID }    name=${account Name}
    ${Users data}    Common.Getting User Details    ${token}
    Log    ${Users data}
    ${user_api_data}    Collections.Get From Dictionary    ${Users data}    Users
    ${users_data}    Collections.Get From List    ${user_api_data}    0
    ${first_name}    Collections.Get From Dictionary    ${users_data}    firstName
    ${last_name}    Collections.Get From Dictionary    ${users_data}    lastName
    ${phone_api_response}    Collections.Get From Dictionary    ${users_data}    phone
    ${email_api_response}    Collections.Get From Dictionary    ${users_data}    email
    ${value}    BuiltIn.Set Variable If    '${donotCopyCCfield}'=='X'    ${False}    ${True}
    &{preferredCallBack}    BuiltIn.Create Dictionary    phoneNumber=${prefPhone}    extension=${prefExt}    country=${prefCountry}
    Comment    &{contact detail dict}    BuiltIn.Create Dictionary    name=NATASHA ROMANOFF    email=ngcsc9@ngcsc.33mail.com    followUpMethodPreferrence=${followUpMethod}    &{preferredCallBack}
    ...    addInboundEmailIdToEmailRecipients=${value}    ccCustomer=${ccList_script}    phone=7838140699
    ${reporter name}    BuiltIn.Catenate    ${first_name}    ${last_name}
    ${contact detail dict}    BuiltIn.Create List    ${reporter name}    ${email_api_response}    ${followUpMethod}    ${value}    ${ccList_script}
    ...    ${phone_api_response}
    Log Dictionary    ${product detail dict}
    Log Dictionary    ${account detail dict}
    Comment    Log Dictionary    ${contact detail dict}
    ${product_details_for_UI}    BuiltIn.Create List    ${serial/ssrn}    ${system/router}    ${series}    ${platform}
    BuiltIn.Set Global Variable    ${product_details_for_UI}
    BuiltIn.Set Global Variable    ${product detail dict}
    BuiltIn.Set Global Variable    ${account detail dict}
    BuiltIn.Set Global Variable    ${contact detail dict}
    BuiltIn.Set Global Variable    ${ccEngineer}
    ${tech_Cate_script}    BuiltIn.Create Dictionary    category1=${techcate2}    category2=${techcate3}    category3=${techcate4}
    ${sr_Cate_script}    BuiltIn.Create Dictionary    category1=${srCategory4_script}    category2=${srCategory3_script}    category3=${srCategory2_script}    category4=${srCategory1_script}
    BuiltIn.Set Global Variable    ${tech_Cate_script}
    BuiltIn.Set Global Variable    ${sr_Cate_script}
    ${created_date_time_epoch}    ngcscCommonMethods.time in epoch    ${created_date_time}
    ${last modified time epoch}    ngcscCommonMethods.time in epoch    ${last modified time}
    ${created_date_time_epoch}    Evaluate    ${created_date_time_epoch} + 19800000
    ${last modified time epoch}    Evaluate    ${last modified time epoch} + 19800000
    ${escalation_value}    BuiltIn.Set Variable If    '${escalation_api}' == '${EMPTY}'    ${None}    ${escalation_script}
    ${case_detail_values}    BuiltIn.Create List    ${Case ID}    ${priority}    ${escalation_value}    ${customer_tracking}    ${synopsis}
    ...    ${status}    ${reason_sr}    ${type}    ${employee_responsible_name}    ${created_date_time_epoch}    ${None}
    ...    ${last modified time epoch}
    BuiltIn.Set Global Variable    ${case_detail_values}
    Log    ${case_detail_values}
    BuiltIn.Set Global Variable    ${preferredCallBack}
    BuiltIn.Set Global Variable    ${reason_sr}
    ${Product Values}    BuiltIn.Create List    ${serial/ssrn} / ${ssrn}    ${system/router}    ${series}    ${platform}    ${release}
    ...    F6
    BuiltIn.Set Global Variable    ${Product Values}
    ${Account Value}    Catenate    SEPARATOR=${SPACE}-${SPACE}    ${account Name}    ${Account ID }
    BuiltIn.Set Global Variable    ${Account Value}
    ${categories}    Catenate    SEPARATOR=,    ${srCategory4_script}    ${srCategory3_script}    ${srCategory2_script}    ${srCategory1_script}
    ...    ${techcate2}    ${techcate3}    ${techcate4}
    BuiltIn.Set Global Variable    ${categories}
    ${preferred_call_back_ui}    Catenate    SEPARATOR=-    ${prefCountry}    ${prefPhone}    ${prefExt}
    BuiltIn.Set Global Variable    ${preferred_call_back_ui}
    ${created_date_time}    ngcscCommonMethods.datetime for casedetails    ${created_date_time_epoch}
    ${last modified time}    ngcscCommonMethods.datetime for casedetails    ${last modified time epoch}
    ${case_detail_values_UI}    BuiltIn.Create List    ${Case ID}    ${priority}    ${escalation_value}    ${customer_tracking}    ${synopsis}
    ...    ${status_UI}    ${reason_sr}    ${type}    ${employee_responsible_name}    ${created_date_time}    ${None}
    ...    ${last modified time}
    BuiltIn.Set Global Variable    ${case_detail_values_UI}
    Log    ${case_detail_values_UI}

Setup for Getting Random Account ID
    [Arguments]    ${entity}    ${token}
    [Documentation]    getting random account number using getAllAccounts
    ${all_accounts_json}    Common.Get All Accounts API    ${entity}    ${token}
    ${all_accounts}    Collections.Get From Dictionary    ${all_accounts_json}    accountsList
    ${accountIds}    Common.Getting serial Number from records    ${all_accounts}    accountId
    ${accountName}    Common.Getting serial Number from records    ${all_accounts}    accountName
    ${total_records}    BuiltIn.Get Length    ${accountIds}
    ${index}    ngcscCommonMethods.getting randomNo fromlist    ${total_records}
    ${Random Account ID}    Collections.Get From List    ${accountIds}    ${index}
    ${Account_Name_for_Random_Account_ID}    Collections.Get From List    ${accountName}    ${index}
    BuiltIn.Set Suite Variable    ${Random Account ID}
    [Return]    ${Random Account ID}

Suite Setup for EOL Summary
    ${current_Date}    DateTime.Get Current Date
    ${eol_date}    DateTime.Subtract Time From Date    ${current_Date}    7 days
    ${eol_date}    DateTime.Convert Date    ${eol_date}    result_format=%Y%m%d%H%M    date_format=%Y-%m-%d %H:%M:%S.%f
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ${equipmentId}    Generate Random String    11    [NUMBERS]
    ngcscCommonMethods.Send Message    ib    ${equipmentId}    ${Random Account ID}    ZI000002    Installed At    null
    ...    0162052013000477    ${msgRcdTs}
    ngcscCommonMethods.Send Message    pm    ${eol_date}    ${msgRcdTs}
    ngcscCommonMethods.Send Message    ib    ${equipmentId}    ${Random Account ID}    ZI000002    Installed At    ${EMPTY}
    ...    0162052013000477    ${msgRcdTs}
    BuiltIn.Sleep    60s

Case Detail API
    [Arguments]    ${IP}    ${URL}    ${key}    ${token}
    ${restIp}    String.Replace String    ${IP}/api1    api1    ${URL}
    ${headers}    BuiltIn.Create Dictionary    Authorization=${token}
    log    ${headers}
    ${headers1}    BuiltIn.Create Dictionary    'content-type'=application/json
    ${response}    requests.Get    ${restIp}    headers=${headers}    verify=${FALSE}
    Log    ${response.content}
    Should Be Equal    ${response.status_code}    ${200}
    ${api_output_json}    BuiltIn.Set Variable    ${response.json()}
    ${records}    Collections.Get From Dictionary    ${api_output_json}    ${key}
    [Return]    ${records}

Getting User Details
    [Arguments]    ${token}
    ${restIp}    String.Replace String    ${MyJuniper_Segregated_IP}/api1    api1    ${userListAPI}
    ${params}    BuiltIn.Set Variable    {"userIdList": ["${NGCSC9_Contact ID}"],"idType": "numeric"}
    ${params}    json.Loads    ${params}
    log    ${params}
    ${params}    json.Dumps    ${params}
    Log    ${params}
    ${headers}    BuiltIn.Create Dictionary    Authorization=${token}
    log    ${headers}
    ${headers1}    BuiltIn.Create Dictionary    'content-type'=application/json
    ${response}    requests.Post    ${restIp}    data=${params}    headers=${headers}    verify=${FALSE}
    ${api_output_json}    BuiltIn.Set Variable    ${response.json()}
    [Return]    ${api_output_json}

Setup For Case Detail UI
    [Arguments]    ${testing_env}    ${token}    ${Case ID}
    Common.Open Browser with title Validation    ${testing_env}
    Sleep    5s
    Common.Suite Setup for Case Details    ${token}    ${Case ID}
    Common.Click On Cases
    Sleep    5s
    Selenium2Library.Click Element    //div[@id='cases_tabview_cases_tabbed_table']/div/section/div/div/div/div[1]/span/button
    Sleep    5s
    Selenium2Library.Input Text    //div[@id='cases_tabview_cases_tabbed_table']/div/section/div/div/div/div[1]/span/div/section/input    India Standard Time(UTC + 5:30)
    Selenium2Library.Mouse Over    //div[@id='cases_tabview_cases_tabbed_table']/div/section/div/div/div/div[1]/span/div/section/div/ul/li
    Selenium2Library.Click Element    //div[@id='cases_tabview_cases_tabbed_table']/div/section/div/div/div/div[1]/span/div/section/div/ul/li
    Sleep    2s

Suite Setup For Products UI
    [Arguments]    ${testing_env}    ${token}
    Common.Open Browser with title Validation    ${testing_env}
    Sleep    5s
    Comment    Common.Suite Setup for Case Details    ${token}    ${Case ID}
    Common.Click on Products
    ${current_Date}    DateTime.Get Current Date
    ${eol_date_format}    DateTime.Add Time To Date    ${current_Date}    10 days
    ${eol_date}    DateTime.Convert Date    ${eol_date_format}    result_format=%Y%m%d%H%M    date_format=%Y-%m-%d %H:%M:%S.%f
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ${all_accounts_json}    Common.Get All Accounts API    ibases    ${NGCSC9_token}
    ${all_accounts}    Collections.Get From Dictionary    ${all_accounts_json}    accountsList
    ${accountIds}    Common.Getting serial Number from records    ${all_accounts}    accountId
    ${Account ID}    Collections.Get From List    ${accountIds}    0
    ngcscCommonMethods.Send Message    ib    10019718090    ${Account ID}    ZI000002    Installed At    0162052013000477
    ...    RTU00000048128    ${msgRcdTs}
    ngcscCommonMethods.Send Message    pm    ${eol_date}    ${msgRcdTs}
    ngcscCommonMethods.Send Message    ib    10019718090    ${Account ID}    ZI000002    Installed At    0162052013000477
    ...    RTU00000048128    ${msgRcdTs}
    BuiltIn.Sleep    60s

Suite Setup for Contracts UI
    [Arguments]    ${testing_env}    ${token}    ${status}
    Common.Open Browser with title Validation    ${testing_env}
    Sleep    5s
    Common.Click On Contracts
    ${epoch_time_in_pst}    ngcscCommonMethods.epoch max time in pst
    ${current_Date}    DateTime.Get Current Date
    ${header_end_active_date}    DateTime.Add Time To Date    ${current_Date}    10 days
    ${header_end_active_date}    DateTime.Convert Date    ${header_end_active_date}    result_format=%Y%m%d%H%M    date_format=%Y-%m-%d %H:%M:%S.%f
    ${header_end_expired_date}    DateTime.Subtract Time From Date    ${current_Date}    10 days
    ${header_end_expired_date}    DateTime.Convert Date    ${header_end_expired_date}    result_format=%Y%m%d%H%M    date_format=%Y-%m-%d %H:%M:%S.%f
    ${header_end_date}    BuiltIn.Set Variable If    '${status}' == 'Active'    ${header_end_active_date}    ${header_end_expired_date}
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    Comment    ${Random Contract ID}    Generate Random String    10    00[NUMBERS]
    Comment    ${contractID}    ngcscCommonMethods.random with N digits    8
    Comment    ${Random Contract ID}    BuiltIn.Catenate    SEPARATOR=    00    ${contractID}
    ${Account ID}    Common.Setup for Getting Random Account ID    contracts    ${NGCSC1_token}
    ngcscCommonMethods.Send Message    contracts    ${header_end_date}    ${msgRcdTs}    ${status}    ${Account ID}    ZRE00001
    ...    Primary Reseller    0060082684
    BuiltIn.Sleep    60s

Filter Setup For External API
    [Arguments]    ${key}    ${total_records}    ${records_value}
    ${product_filter_values}    BuiltIn.Create List
    : FOR    ${i}    IN RANGE    ${total_records}
    \    Exit For Loop If    '${i}' == '10'
    \    ${record}    Collections.Get From List    ${records_value}    ${i}
    \    ${product_value}    Collections.Get From Dictionary    ${record}    ${key}
    \    Collections.Append To List    ${product_value_list}    ${product_value}
    Log    ${product_value_list}
    [Return]    ${product_value_list}

Getting Text from all WebElements
    [Arguments]    ${all_reported_col_elements}
    ${total_columns}    BuiltIn.Get Length    ${all_reported_col_elements}
    ${columns_text}    BuiltIn.Create List
    : FOR    ${i}    IN RANGE    ${total_columns}
    \    ${element}    Collections.Get From List    ${all_reported_col_elements}    ${i}
    \    ${value}    Selenium2Library.Get Text    ${element}
    \    Collections.Append To List    ${columns_text}    ${value}
    Log    ${columns_text}
    [Return]    ${columns_text}
