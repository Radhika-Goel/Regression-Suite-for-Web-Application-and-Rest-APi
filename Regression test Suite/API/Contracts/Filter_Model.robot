*** Settings ***
Resource          ../../Common.robot

*** Variables ***
@{EndCustomer_keys}    accountId    accountName    uuid
@{Contract List Fields}    city    contractId    contractType    country    endDate    hasLineItems    locationAccId
...               locationName    primaryKey    product    serialNo    shipDate    softwareSupportReferenceNumber    startDate
...               state    status    supportCoverage    warrantyExpDate
@{Contract Fields for External API}    contractId    endDate    hasLineItems    location    primaryKey    product    serialNumber
...               shipDate    softwareSupportReferenceNumber    startDate    status    supportCoverage    warrantyExpirationDate

*** Test Cases ***
API for Contract ID Filter
    ${epoch_time_in_pst}    ngcscCommonMethods.epoch max time in pst
    ${current_Date}    DateTime.Get Current Date
    ${header_start_date}    DateTime.Subtract Time From Date    ${current_Date}    7 days
    ${header_start_date}    DateTime.Convert Date    ${header_start_date}    result_format=%Y%m%d%H%M%S    date_format=%Y-%m-%d %H:%M:%S.%f
    LOg    ${header_start_date}
    ${header_end_date}    DateTime.Add Time To Date    ${current_Date}    10 days
    ${header_end_date}    DateTime.Convert Date    ${header_end_date}    result_format=%Y%m%d%H%M%S    date_format=%Y-%m-%d %H:%M:%S.%f
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    Comment    ${all_accounts_json}    Common.Get All Accounts API    contracts    ${NGCSC1_token}
    Comment    ${all_accounts}    Collections.Get From Dictionary    ${all_accounts_json}    accountsList
    Comment    ${accountIds}    Common.Getting serial Number from records    ${all_accounts}    accountId
    Comment    ${accountName}    Common.Getting serial Number from records    ${all_accounts}    accountName
    Comment    ${Account ID}    Collections.Get From List    ${accountIds}    1
    Comment    ${Account Name}    Collections.Get From List    ${accountName}    1
    ${Account ID}    Common.Setup for Getting Random Account ID    contracts    ${NGCSC1_token}
    ${contractID}    ngcscCommonMethods.random with N digits    7
    ${Random Contract ID}    BuiltIn.Catenate    SEPARATOR=    006    ${contractID}
    ngcscCommonMethods.Send Message    contracts    ${header_end_date}    ${msgRcdTs}    Active    ${Account ID}    00000065
    ...    End Customer    ${Random Contract ID}    ${header_start_date}
    BuiltIn.Sleep    60s
    Comment    ${Contract ID Filter}    BuiltIn.Set Variable    {"pageItems":50,"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"status":{"type":"1","filter":["Active"],"fieldCase":"UPPER"}},{"contractId":{"type":"1","filter":["${Random Contract ID}"],"fieldCase":"UPPER"}}],"firstRecord":null,"lastRecord":null,"searchBy":"user","searchFor":"Headers"}
    ${Contract ID Filter}    BuiltIn.Set Variable    {"pageItems":50,"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"status":{"type":"1","filter":["Active"],"fieldCase":"UPPER"}},{"contractId":{"type":"1","filter":["0066022344"],"fieldCase":"UPPER"}}],"firstRecord":null,"lastRecord":null,"searchBy":"user","searchFor":"Headers"}
    ${Contracts API}    String.Replace String    ${MyJuniper_Segregated_IP}/api1    api1    api/contract-manager/contracts
    ${contract_details}    Common.Executing API    ${Contracts API}    ${Contract ID Filter}    ${NGCSC1_token}
    Log    ${contract_details}
    Comment    ${total_records}    Collections.Get From Dictionary    ${contract_details}    totalRecords
    Comment    ${Contracts Filter End Customer}    BuiltIn.Set Variable    {"pageItems":${total_records},"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"locationAccId":{"type":"2","filter":["${Account ID}"]}}],"firstRecord":null,"lastRecord":null,"searchFor":"Headers"}
    Comment    Comment    Log    ${Contracts Filter End Customer}
    Comment    ${contract_details}    Common.Executing API    ${External Contracts API}    ${Contracts Filter End Customer}    ${NGCSC1_token}
    ${contract_details}    Collections.Get From Dictionary    ${contract_details}    contractsList
    ${first_record}    Collections.Get From List    ${contract_details}    0
    ${contract_details_keys}    Collections.Get Dictionary Keys    ${first_record}
    Log    ${contract_details}
    Lists Should Be Equal    ${Contract List Fields}    ${contract_details_keys}
    ${filtered contract ID}    Collections.Get From Dictionary    ${first_record}    contractId
    Comment    BuiltIn.Should Be Equal    ${filtered contract ID}    ${Random Contract ID}
    BuiltIn.Should Be Equal    ${filtered contract ID}    0066022344
    ${External Contracts API}    String.Replace String    ${External API URL}/api1    api1    contract-manager/contracts
    ${contract_details}    Common.Executing API    ${External Contracts API}    ${Contract ID Filter}    ${NGCSC1_token}
    Log    ${contract_details}
    ${contract_details}    Collections.Get From Dictionary    ${contract_details}    contracts
    ${first_record}    Collections.Get From List    ${contract_details}    0
    ${contract_details_keys}    Collections.Get Dictionary Keys    ${first_record}
    Log    ${contract_details}
    Lists Should Be Equal    ${Contract Fields for External API}    ${contract_details_keys}
    ${filtered contract ID}    Collections.Get From Dictionary    ${first_record}    contractId
    Comment    BuiltIn.Should Be Equal    ${filtered contract ID}    ${Random Contract ID}
    BuiltIn.Should Be Equal    ${filtered contract ID}    0066022344

Start Date Filter Model
    ${epoch_time_in_pst}    ngcscCommonMethods.epoch max time in pst
    ${current_Date}    DateTime.Get Current Date
    Log    ${current_Date}
    ${header_start_date}    DateTime.Subtract Time From Date    ${current_Date}    7 days
    ${header_start_epoch_pst}    ngcscCommonMethods.epoch pst start slice time    ${header_start_date}
    ${header_end_epoch_pst}    ngcscCommonMethods.epoch pst end slice time    ${header_start_date}
    Log    ${header_start_epoch_pst}
    Log    ${header_end_epoch_pst}
    ${header_start_date}    DateTime.Convert Date    ${header_start_date}    result_format=%Y%m%d%H%M%S    date_format=%Y-%m-%d %H:%M:%S.%f
    LOg    ${header_start_date}
    ${header_end_date}    DateTime.Add Time To Date    ${current_Date}    10 days
    ${header_end_date}    DateTime.Convert Date    ${header_end_date}    result_format=%Y%m%d%H%M%S    date_format=%Y-%m-%d %H:%M:%S.%f
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ${Account ID}    Common.Setup for Getting Random Account ID    contracts    ${NGCSC1_token}
    ${contractID}    ngcscCommonMethods.random with N digits    7
    ${Random Contract ID}    BuiltIn.Catenate    SEPARATOR=    006    ${contractID}
    ngcscCommonMethods.Send Message    contracts    ${header_end_date}    ${msgRcdTs}    Active    ${Account ID}    00000065
    ...    End Customer    ${Random Contract ID}    ${header_start_date}
    BuiltIn.Sleep    60s
    Comment    ${Contract ID Filter}    BuiltIn.Set Variable    {"pageItems":50,"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"status":{"type":"1","filter":["Active"],"fieldCase":"UPPER"}},{"startDate":{"type":"13","filter":["${header_start_epoch_pst} AND ${header_end_epoch_pst}"]}}],"firstRecord":null,"lastRecord":null,"searchBy":"user","searchFor":"Headers"}
    ${Contract Start Date Filter}    BuiltIn.Set Variable    {"pageItems":50,"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"status":{"type":"1","filter":["Active"],"fieldCase":"UPPER"}},{"startDate":{"type":"13","filter":["1254384000000 AND 1254470399000"]}}],"firstRecord":null,"lastRecord":null,"searchBy":"user","searchFor":"Headers"}
    ${Contracts API}    String.Replace String    ${MyJuniper_Segregated_IP}/api1    api1    api/contract-manager/contracts
    ${contract_details}    Common.Executing API    ${Contracts API}    ${Contract Start Date Filter}    ${NGCSC1_token}
    Log    ${contract_details}
    ${total_records}    Collections.Get From Dictionary    ${contract_details}    totalRecords
    ${Contract Start Date Filter}    BuiltIn.Set Variable    {"pageItems":${totalRecords},"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"status":{"type":"1","filter":["Active"],"fieldCase":"UPPER"}},{"startDate":{"type":"13","filter":["1254384000000 AND 1254470399000"]}}],"firstRecord":null,"lastRecord":null,"searchBy":"user","searchFor":"Headers"}
    ${contract_details}    Common.Executing API    ${Contracts API}    ${Contract Start Date Filter}    ${NGCSC1_token}
    ${contract_details}    Collections.Get From Dictionary    ${contract_details}    contractsList
    ${first_record}    Collections.Get From List    ${contract_details}    0
    ${contract_details_keys}    Collections.Get Dictionary Keys    ${first_record}
    Log    ${contract_details}
    Lists Should Be Equal    ${Contract List Fields}    ${contract_details_keys}
    ${start_date_value_list}    BuiltIn.Create List
    ${ContractID_List}    BuiltIn.Create List
    : FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${contract_details}    ${i}
    \    ${startdate_value}    Collections.Get From Dictionary    ${record}    startDate
    \    ${value}    Evaluate    ${header_start_epoch_pst} < ${startdate_value} < ${header_end_epoch_pst}
    \    BuiltIn.Should Be Equal    ${value}    ${True}
    \    ${contract_ID}    Collections.Get From Dictionary    ${record}    contractId
    \    Comment    Append To List    ${start_date_value_list}    ${startdate_value}
    \    Append To List    ${ContractID_List}    ${contract_ID}
    \    Comment    Collections.List Should Contain Value    ${ContractID_List}    ${Random Contract ID}
    Collections.List Should Contain Value    ${ContractID_List}    0066022344
    ${External Contracts API}    String.Replace String    ${External API URL}/api1    api1    contract-manager/contracts
    ${contract_details}    Common.Executing API    ${External Contracts API}    ${Contract Start Date Filter}    ${NGCSC1_token}
    ${contract_details}    Collections.Get From Dictionary    ${contract_details}    contracts
    ${first_record}    Collections.Get From List    ${contract_details}    0
    ${contract_details_keys}    Collections.Get Dictionary Keys    ${first_record}
    Log    ${contract_details}
    Lists Should Be Equal    ${Contract Fields for External API}    ${contract_details_keys}
    ${start_date_value_list}    BuiltIn.Create List
    ${ContractID_List}    BuiltIn.Create List
    : FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${contract_details}    ${i}
    \    ${startdate_value}    Collections.Get From Dictionary    ${record}    startDate
    \    ${contract_ID}    Collections.Get From Dictionary    ${record}    contractId
    \    ${value}    Evaluate    ${header_start_epoch_pst} < ${startdate_value} < ${header_end_epoch_pst}
    \    BuiltIn.Should Be Equal    ${value}    ${True}
    \    Append To List    ${ContractID_List}    ${contract_ID}
    Collections.List Should Contain Value    ${ContractID_List}    ${Random Contract ID}
    Collections.List Should Contain Value    ${ContractID_List}    0066022344

End Date Filter Model
    ${epoch_time_in_pst}    ngcscCommonMethods.epoch max time in pst
    ${current_Date}    DateTime.Get Current Date
    Log    ${current_Date}
    ${header_start_date}    DateTime.Subtract Time From Date    ${current_Date}    7 days
    ${header_start_date}    DateTime.Convert Date    ${header_start_date}    result_format=%Y%m%d%H%M%S    date_format=%Y-%m-%d %H:%M:%S.%f
    LOg    ${header_start_date}
    ${header_end_date}    DateTime.Add Time To Date    ${current_Date}    10 days
    ${headerend_start_epoch_pst}    ngcscCommonMethods.epoch pst start slice time    ${header_end_date}
    ${headerend_end_epoch_pst}    ngcscCommonMethods.epoch pst end slice time    ${header_end_date}
    log    ${headerend_start_epoch_pst}
    log    ${headerend_end_epoch_pst}
    ${header_end_date}    DateTime.Convert Date    ${header_end_date}    result_format=%Y%m%d%H%M%S    date_format=%Y-%m-%d %H:%M:%S.%f
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ${Account ID}    Common.Setup for Getting Random Account ID    contracts    ${NGCSC1_token}
    ${contractID}    ngcscCommonMethods.random with N digits    7
    ${Random Contract ID}    BuiltIn.Catenate    SEPARATOR=    006    ${contractID}
    ngcscCommonMethods.Send Message    contracts    ${header_end_date}    ${msgRcdTs}    Active    ${Account ID}    00000065
    ...    End Customer    ${Random Contract ID}    ${header_start_date}
    BuiltIn.Sleep    60s
    Comment    ${Contract ID Filter}    BuiltIn.Set Variable    {"pageItems":50,"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"status":{"type":"1","filter":["Active"],"fieldCase":"UPPER"}},{"startDate":{"type":"13","filter":["${headerend_start_epoch_pst} AND ${headerend_end_epoch_pst}"]}}],"firstRecord":null,"lastRecord":null,"searchBy":"user","searchFor":"Headers"}
    ${Contract End Date Filter}    BuiltIn.Set Variable    {"pageItems":50,"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"status":{"type":"1","filter":["Active"],"fieldCase":"UPPER"}},{"startDate":{"type":"13","filter":["1254384000000 AND 1254470399000"]}}],"firstRecord":null,"lastRecord":null,"searchBy":"user","searchFor":"Headers"}
    ${Contracts API}    String.Replace String    ${MyJuniper_Segregated_IP}/api1    api1    api/contract-manager/contracts
    ${contract_details}    Common.Executing API    ${Contracts API}    ${Contract End Date Filter}    ${NGCSC1_token}
    Log    ${contract_details}
    ${total_records}    Collections.Get From Dictionary    ${contract_details}    totalRecords
    ${Contract End Date Filter}    BuiltIn.Set Variable    {"pageItems":${totalRecords},"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"status":{"type":"1","filter":["Active"],"fieldCase":"UPPER"}},{"startDate":{"type":"13","filter":["1254384000000 AND 1254470399000"]}}],"firstRecord":null,"lastRecord":null,"searchBy":"user","searchFor":"Headers"}
    ${contract_details}    Common.Executing API    ${Contracts API}    ${Contract End Date Filter}    ${NGCSC1_token}
    ${contract_details}    Collections.Get From Dictionary    ${contract_details}    contractsList
    ${first_record}    Collections.Get From List    ${contract_details}    0
    ${contract_details_keys}    Collections.Get Dictionary Keys    ${first_record}
    Log    ${contract_details}
    Lists Should Be Equal    ${Contract List Fields}    ${contract_details_keys}
    ${ContractID_List}    BuiltIn.Create List
    : FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${contract_details}    ${i}
    \    ${enddate_value}    Collections.Get From Dictionary    ${record}    endDate
    \    ${value}    Evaluate    ${headerend_start_epoch_pst} < ${enddate_value} < ${headerend_end_epoch_pst}
    \    BuiltIn.Should Be Equal    ${value}    ${True}
    \    ${contract_ID}    Collections.Get From Dictionary    ${record}    contractId
    \    Comment    Append To List    ${start_date_value_list}    ${startdate_value}
    \    Append To List    ${ContractID_List}    ${contract_ID}
    \    Comment    Collections.List Should Contain Value    ${ContractID_List}    ${Random Contract ID}
    Collections.List Should Contain Value    ${ContractID_List}    0066022344
    ${External Contracts API}    String.Replace String    ${External API URL}/api1    api1    contract-manager/contracts
    ${contract_details}    Common.Executing API    ${External Contracts API}    ${Contract End Date Filter}    ${NGCSC1_token}
    ${contract_details}    Collections.Get From Dictionary    ${contract_details}    contracts
    ${first_record}    Collections.Get From List    ${contract_details}    0
    ${contract_details_keys}    Collections.Get Dictionary Keys    ${first_record}
    Log    ${contract_details}
    Lists Should Be Equal    ${Contract Fields for External API}    ${contract_details_keys}
    ${ContractID_List}    BuiltIn.Create List
    : FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${contract_details}    ${i}
    \    ${enddate_value}    Collections.Get From Dictionary    ${record}    endDate
    \    ${contract_ID}    Collections.Get From Dictionary    ${record}    contractId
    \    ${value}    Evaluate    ${headerend_start_epoch_pst} < ${enddate_value} < ${headerend_end_epoch_pst}
    \    BuiltIn.Should Be Equal    ${value}    ${True}
    \    Append To List    ${ContractID_List}    ${contract_ID}
    Collections.List Should Contain Value    ${ContractID_List}    ${Random Contract ID}

API to fetch End Customer Accounts
    [Tags]
    ${epoch_time_in_pst}    ngcscCommonMethods.epoch max time in pst
    ${current_Date}    DateTime.Get Current Date
    ${header_end_date}    DateTime.Add Time To Date    ${current_Date}    10 days
    ${header_end_date}    DateTime.Convert Date    ${header_end_date}    result_format=%Y%m%d%H%M%S    date_format=%Y-%m-%d %H:%M:%S.%f
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ${all_accounts_json}    Common.Get All Accounts API    contracts    ${NGCSC9_token}
    ${all_accounts}    Collections.Get From Dictionary    ${all_accounts_json}    accountsList
    ${accountIds}    Common.Getting serial Number from records    ${all_accounts}    accountId
    ${Account ID}    Collections.Get From List    ${accountIds}    1
    ${contractID}    ngcscCommonMethods.random with N digits    7
    ${Random Contract ID}    BuiltIn.Catenate    SEPARATOR=    006    ${contractID}
    ngcscCommonMethods.Send Message    contracts    ${header_end_date}    ${msgRcdTs}    Active    ${Account ID}    00000065
    ...    End Customer    ${Random Contract ID}    ${header_start_date}
    BuiltIn.Sleep    60s
    ${params}    BuiltIn.Set Variable    {"entity": "endCustomer"}
    ${inputData}    json.Loads    ${params}
    ${inputData}    json.Dumps    ${inputData}
    Log    ${inputData}
    ${restIp}    String.Replace String    ${MyJuniper_Segregated_IP}/api1    api1    api/contract-manager/accounts
    ${headers}    Create Dictionary    Authorization=${NGCSC9_token}
    ${response}    requests.Post    ${restIp}    data=${inputData}    headers=${headers}    verify=${FALSE}
    Log    ${response.headers}
    Log    ${response.content}
    Should Be Equal    ${response.status_code}    ${200}
    ${api_output_json}    BuiltIn.Set Variable    ${response.json()}
    ${records}    Collections.Get From Dictionary    ${api_output_json}    accounts
    Log    ${api_output_json}
    ${first_record}    Collections.Get From List    ${records}    0
    ${EndCustomer_Record_keys}    Collections.Get Dictionary Keys    ${first_record}
    Collections.Lists Should Be Equal    ${EndCustomer_Record_keys}    ${EndCustomer_keys}
    ${all_endCustomer_Accounts}    Common.Getting serial Number from records    ${records}    accountId
    Collections.List Should Contain Value    ${all_endCustomer_Accounts}    ${Account ID}
    Collections.List Should Not Contain Duplicates    ${all_endCustomer_Accounts}

API to Fetch Records based on locationAccID Filter
    [Tags]
    ${epoch_time_in_pst}    ngcscCommonMethods.epoch max time in pst
    ${current_Date}    DateTime.Get Current Date
    ${header_end_date}    DateTime.Add Time To Date    ${current_Date}    10 days
    ${header_end_date}    DateTime.Convert Date    ${header_end_date}    result_format=%Y%m%d%H%M%S    date_format=%Y-%m-%d %H:%M:%S.%f
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ${all_accounts_json}    Common.Get All Accounts API    contracts    ${NGCSC1_token}
    ${all_accounts}    Collections.Get From Dictionary    ${all_accounts_json}    accountsList
    ${accountIds}    Common.Getting serial Number from records    ${all_accounts}    accountId
    ${accountName}    Common.Getting serial Number from records    ${all_accounts}    accountName
    ${Account ID}    Collections.Get From List    ${accountIds}    1
    ${Account Name}    Collections.Get From List    ${accountName}    1
    ${contractID}    ngcscCommonMethods.random with N digits    7
    ${Random Contract ID}    BuiltIn.Catenate    SEPARATOR=    006    ${contractID}
    ngcscCommonMethods.Send Message    contracts    ${header_end_date}    ${msgRcdTs}    Active    ${Account ID}    00000065
    ...    End Customer    ${Random Contract ID}    ${header_start_date}
    BuiltIn.Sleep    60s
    ${Contracts Filter End Customer}    BuiltIn.Set Variable    {"pageItems":50,"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"locationAccId":{"type":"2","filter":["${Account ID}"]}}],"firstRecord":null,"lastRecord":null,"searchFor":"Headers"}
    ${Contracts API}    String.Replace String    ${MyJuniper_Segregated_IP}/api1    api1    api/contract-manager/contracts
    ${contract_details}    Common.Executing API    ${Contracts API}    ${Contracts Filter End Customer}    ${NGCSC1_token}
    Log    ${contract_details}
    ${total_records}    Collections.Get From Dictionary    ${contract_details}    totalRecords
    ${Contracts Filter End Customer}    BuiltIn.Set Variable    {"pageItems":${total_records},"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"locationAccId":{"type":"2","filter":["${Account ID}"]}}],"firstRecord":null,"lastRecord":null,"searchFor":"Headers"}
    Comment    Log    ${Contracts Filter End Customer}
    ${External Contracts API}    String.Replace String    ${External API URL}/api1    api1    contract-manager/contracts
    ${contract_details}    Common.Executing API    ${External Contracts API}    ${Contracts Filter End Customer}    ${NGCSC1_token}
    ${contract_details}    Collections.Get From Dictionary    ${contract_details}    contractsList
    ${first_record}    Collections.Get From List    ${contract_details}    0
    ${contract_details_keys}    Collections.Get Dictionary Keys    ${first_record}
    Log    ${contract_details}
    Comment    Lists Should Be Equal    ${contract_details}    ${Contract Fields}
    ${end_customer_value_list}    BuiltIn.Create List
    ${ContractID_List}    BuiltIn.Create List
    Log    ${first_record}
    : FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${contract_details}    ${i}
    \    ${endCustomer_value}    Collections.Get From Dictionary    ${record}    locationAccId
    \    ${contract_ID}    Collections.Get From Dictionary    ${record}    contractId
    \    Append To List    ${end_customer_value_list}    ${endCustomer_value}
    \    Append To List    ${ContractID_List}    ${contract_ID}
    Collections.List Should Contain Value    ${ContractID_List}    ${Random Contract ID}
    Collections.Remove Duplicates    ${end_customer_value_list}
    ${account_id_value_response}    Collections.Get From List    ${end_customer_value_list}    0
    Should Be Equal    ${account_id_value_response}    ${Account ID}
    ${NEW_Account_ID}    Common.Setup for Getting Random Account ID    contracts    ${NGCSC1_token}
    ngcscCommonMethods.Send Message    contracts    ${header_end_date}    ${msgRcdTs}    Active    ${NEW_Account_ID}    00000065
    ...    End Customer    ${Random Contract ID}    ${header_start_date}
    BuiltIn.Sleep    60s
    ${contract_details}    Common.Executing API    ${External Contracts API}    ${Contracts Filter End Customer}    ${NGCSC1_token}
    ${contract_details}    Collections.Get From Dictionary    ${contract_details}    contractsList
    ${contact_details_length}    BuiltIn.Get Length    ${contract_details}
    ${ContractID_List}    BuiltIn.Create List
    Log    ${first_record}
    : FOR    ${i}    IN RANGE    ${contact_details_length}
    \    ${record}    Collections.Get From List    ${contract_details}    ${i}
    \    ${contract_ID}    Collections.Get From Dictionary    ${record}    contractId
    \    Append To List    ${ContractID_List}    ${contract_ID}
    Collections.List Should Not Contain Value    ${ContractID_List}    ${Random Contract ID}
    ${Contracts Filter End Customer}    BuiltIn.Set Variable    {"pageItems":50,"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"locationAccId":{"type":"2","filter":["${NEW_Account_ID}"]}}],"firstRecord":null,"lastRecord":null,"searchFor":"Headers"}
    ${contract_details}    Common.Executing API    ${External Contracts API}    ${Contracts Filter End Customer}    ${NGCSC1_token}
    Log    ${contract_details}
    ${total_records}    Collections.Get From Dictionary    ${contract_details}    totalRecords
    ${Contracts Filter End Customer}    BuiltIn.Set Variable    {"pageItems":${total_records},"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"locationAccId":{"type":"2","filter":["${NEW_Account_ID}"]}}],"firstRecord":null,"lastRecord":null,"searchFor":"Headers"}
    ${contract_details}    Common.Executing API    ${External Contracts API}    ${Contracts Filter End Customer}    ${NGCSC1_token}
    ${contract_details}    Collections.Get From Dictionary    ${contract_details}    contractsList
    ${ContractID_NEW_List}    BuiltIn.Create List
    Log    ${first_record}
    : FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${contract_details}    ${i}
    \    ${endCustomer_value}    Collections.Get From Dictionary    ${record}    locationAccId
    \    ${contract_ID}    Collections.Get From Dictionary    ${record}    contractId
    \    Append To List    ${end_customer_value_list}    ${endCustomer_value}
    \    Append To List    ${ContractID_NEW_List}    ${contract_ID}
    Collections.List Should Contain Value    ${ContractID_NEW_List}    ${Random Contract ID}

Support Coverage
    ${epoch_time_in_pst}    ngcscCommonMethods.epoch max time in pst
    ${current_Date}    DateTime.Get Current Date
    ${header_start_date}    DateTime.Subtract Time From Date    ${current_Date}    30
    ${header_start_date}    DateTime.Convert Date    ${header_start_date}    result_format=%Y%m%d%H%M%S    date_format=%Y-%m-%d %H:%M:%S.%f
    LOg    ${header_start_date}
    ${header_end_date}    DateTime.Subtract Time From Date    ${current_Date}    10 days
    ${header_end_date}    DateTime.Convert Date    ${header_end_date}    result_format=%Y%m%d%H%M%S    date_format=%Y-%m-%d %H:%M:%S.%f
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ${Account ID}    Common.Setup for Getting Random Account ID    contracts    ${NGCSC1_token}
    ${contractID}    ngcscCommonMethods.random with N digits    7
    ${Random Contract ID}    BuiltIn.Catenate    SEPARATOR=    006    ${contractID}
    ngcscCommonMethods.Send Message    contracts    ${header_end_date}    ${msgRcdTs}    Expired    ${Account ID}    00000065
    ...    End Customer    ${Random Contract ID}    ${header_start_date}
    BuiltIn.Sleep    60s
    ${Support Coverage Filter}    BuiltIn.Set Variable    {"pageItems":50,"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"status":{"type":"1","filter":["Expired"],"fieldCase":"UPPER"}},{"supportCoverage":{"type":"1","filter":["SVC-ND-SSG5"],"fieldCase":"UPPER"}}],"firstRecord":null,"lastRecord":null,"searchBy":"user","searchFor":"LineItems"}
    ${Contracts API}    String.Replace String    ${MyJuniper_Segregated_IP}/api1    api1    api/contract-manager/contracts
    ${contract_details}    Common.Executing API    ${Contracts API}    ${Support Coverage Filter}    ${NGCSC1_token}
    Log    ${contract_details}
    ${total_records}    Collections.Get From Dictionary    ${contract_details}    totalRecords
    ${Support Coverage Filter}    BuiltIn.Set Variable    {"pageItems":${totalRecords},"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"status":{"type":"1","filter":["Expired"],"fieldCase":"UPPER"}},{"supportCoverage":{"type":"1","filter":["SVC-ND-SSG5"],"fieldCase":"UPPER"}}],"firstRecord":null,"lastRecord":null,"searchBy":"user","searchFor":"LineItems"}
    ${contract_details}    Common.Executing API    ${Contracts API}    ${Support Coverage Filter}    ${NGCSC1_token}
    ${contract_details}    Collections.Get From Dictionary    ${contract_details}    contractsList
    ${first_record}    Collections.Get From List    ${contract_details}    0
    ${contract_details_keys}    Collections.Get Dictionary Keys    ${first_record}
    Log    ${contract_details}
    Lists Should Be Equal    ${Contract List Fields}    ${contract_details_keys}
    ${support_coverage_value_list}    BuiltIn.Create List
    ${ContractID_List}    BuiltIn.Create List
    : FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${contract_details}    ${i}
    \    ${supportCoverage_value}    Collections.Get From Dictionary    ${record}    supportCoverage
    \    ${contract_ID}    Collections.Get From Dictionary    ${record}    contractId
    \    Append To List    ${support_coverage_value_list}    ${supportCoverage_value}
    \    Append To List    ${ContractID_List}    ${contract_ID}
    \    Comment    Collections.List Should Contain Value    ${ContractID_List}    ${Random Contract ID}
    Collections.Remove Duplicates    ${support_coverage_value_list}
    Collections.List Should Contain Value    ${support_coverage_value_list}    SVC-ND-SSG5
    ${External Contracts API}    String.Replace String    ${External API URL}/api1    api1    contract-manager/contracts
    ${contract_details}    Common.Executing API    ${External Contracts API}    ${Support Coverage Filter}    ${NGCSC1_token}
    Log    ${contract_details}
    ${contract_details}    Collections.Get From Dictionary    ${contract_details}    contracts
    ${first_record}    Collections.Get From List    ${contract_details}    0
    ${contract_details_keys}    Collections.Get Dictionary Keys    ${first_record}
    Log    ${contract_details}
    Lists Should Be Equal    ${Contract Fields for External API}    ${contract_details_keys}
    ${support_coverage_value_list_external}    BuiltIn.Create List
    ${ContractID_List_external}    BuiltIn.Create List
    : FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${contract_details}    ${i}
    \    ${supportCoverage_value}    Collections.Get From Dictionary    ${record}    supportCoverage
    \    ${contract_ID}    Collections.Get From Dictionary    ${record}    contractId
    \    Append To List    ${support_coverage_value_list_external}    ${supportCoverage_value}
    \    Append To List    ${ContractID_List_external}    ${contract_ID}
    \    Comment    Collections.List Should Contain Value    ${ContractID_List}    ${Random Contract ID}
    Collections.Remove Duplicates    ${support_coverage_value_list_external}
    Collections.List Should Contain Value    ${support_coverage_value_list_external}    SVC-ND-SSG5

Serial Number Filter Model
    ${epoch_time_in_pst}    ngcscCommonMethods.epoch max time in pst
    ${current_Date}    DateTime.Get Current Date
    ${header_start_date}    DateTime.Subtract Time From Date    ${current_Date}    30
    ${header_start_date}    DateTime.Convert Date    ${header_start_date}    result_format=%Y%m%d%H%M%S    date_format=%Y-%m-%d %H:%M:%S.%f
    LOg    ${header_start_date}
    ${header_end_date}    DateTime.Subtract Time From Date    ${current_Date}    10 days
    ${header_end_date}    DateTime.Convert Date    ${header_end_date}    result_format=%Y%m%d%H%M%S    date_format=%Y-%m-%d %H:%M:%S.%f
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ${Account ID}    Common.Setup for Getting Random Account ID    contracts    ${NGCSC1_token}
    ${contractID}    ngcscCommonMethods.random with N digits    7
    ${Random Contract ID}    BuiltIn.Catenate    SEPARATOR=    006    ${contractID}
    ngcscCommonMethods.Send Message    contracts    ${header_end_date}    ${msgRcdTs}    Expired    ${Account ID}    00000065
    ...    End Customer    ${Random Contract ID}    ${header_start_date}
    BuiltIn.Sleep    60s
    ${Serial Number Filter}    BuiltIn.Set Variable    {"pageItems":50,"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"status":{"type":"1","filter":["Expired"],"fieldCase":"UPPER"}},{"serialNo":{"type":"1","filter":["CABV4435"],"fieldCase":"UPPER"}}],"firstRecord":null,"lastRecord":null,"searchBy":"user","searchFor":"LineItems"}
    ${Contracts API}    String.Replace String    ${MyJuniper_Segregated_IP}/api1    api1    api/contract-manager/contracts
    ${contract_details}    Common.Executing API    ${Contracts API}    ${Serial Number Filter}    ${NGCSC1_token}
    Log    ${contract_details}
    ${total_records}    Collections.Get From Dictionary    ${contract_details}    totalRecords
    ${Serial Number Filter}    BuiltIn.Set Variable    {"pageItems":${totalRecords},"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"status":{"type":"1","filter":["Expired"],"fieldCase":"UPPER"}},{"serialNo":{"type":"1","filter":["CABV4435"],"fieldCase":"UPPER"}}],"firstRecord":null,"lastRecord":null,"searchBy":"user","searchFor":"LineItems"}
    ${contract_details}    Common.Executing API    ${Contracts API}    ${Serial Number Filter}    ${NGCSC1_token}
    ${contract_details}    Collections.Get From Dictionary    ${contract_details}    contractsList
    ${first_record}    Collections.Get From List    ${contract_details}    0
    ${contract_details_keys}    Collections.Get Dictionary Keys    ${first_record}
    Log    ${contract_details}
    Lists Should Be Equal    ${Contract List Fields}    ${contract_details_keys}
    ${serial_number_value_list}    BuiltIn.Create List
    ${ContractID_List}    BuiltIn.Create List
    : FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${contract_details}    ${i}
    \    ${serialNumber_value}    Collections.Get From Dictionary    ${record}    serialNo
    \    ${contract_ID}    Collections.Get From Dictionary    ${record}    contractId
    \    Append To List    ${serial_number_value_list}    ${serialNumber_value}
    \    Append To List    ${ContractID_List}    ${contract_ID}
    \    Comment    Collections.List Should Contain Value    ${ContractID_List}    ${Random Contract ID}
    Collections.Remove Duplicates    ${serial_number_value_list}
    Collections.List Should Contain Value    ${serial_number_value_list}    CABV4435
    ${Serial Number Filter}    BuiltIn.Set Variable    {"pageItems":50,"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"status":{"type":"1","filter":["Expired"],"fieldCase":"UPPER"}},{"serialNumber":{"type":"1","filter":["CABV4435"],"fieldCase":"UPPER"}}],"firstRecord":null,"lastRecord":null,"searchBy":"user","searchFor":"LineItems"}
    ${External Contracts API}    String.Replace String    ${External API URL}/api1    api1    contract-manager/contracts
    ${contract_details}    Common.Executing API    ${External Contracts API}    ${Serial Number Filter}    ${NGCSC1_token}
    Log    ${contract_details}
    ${total_records}    Collections.Get From Dictionary    ${contract_details}    totalRecords
    ${Serial Number Filter}    BuiltIn.Set Variable    {"pageItems":${totalRecords},"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"status":{"type":"1","filter":["Expired"],"fieldCase":"UPPER"}},{"serialNumber":{"type":"1","filter":["CABV4435"],"fieldCase":"UPPER"}}],"firstRecord":null,"lastRecord":null,"searchBy":"user","searchFor":"LineItems"}
    ${contract_details}    Common.Executing API    ${External Contracts API}    ${Serial Number Filter}    ${NGCSC1_token}
    Log    ${contract_details}
    ${contract_details}    Collections.Get From Dictionary    ${contract_details}    contracts
    ${first_record}    Collections.Get From List    ${contract_details}    0
    ${contract_details_keys}    Collections.Get Dictionary Keys    ${first_record}
    Log    ${contract_details}
    Lists Should Be Equal    ${Contract Fields for External API}    ${contract_details_keys}
    ${serial_value_list_external}    BuiltIn.Create List
    ${ContractID_List_external}    BuiltIn.Create List
    : FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${contract_details}    ${i}
    \    ${serialNumber_value}    Collections.Get From Dictionary    ${record}    serialNumber
    \    ${contract_ID}    Collections.Get From Dictionary    ${record}    contractId
    \    Append To List    ${serial_value_list_external}    ${serialNumber_value}
    \    Append To List    ${ContractID_List_external}    ${contract_ID}
    \    Comment    Collections.List Should Contain Value    ${ContractID_List}    ${Random Contract ID}
    Collections.Remove Duplicates    ${serial_value_list_external}
    Collections.List Should Contain Value    ${serial_value_list_external}    CABV4435

Product Filter Model
    ${epoch_time_in_pst}    ngcscCommonMethods.epoch max time in pst
    ${current_Date}    DateTime.Get Current Date
    ${header_start_date}    DateTime.Subtract Time From Date    ${current_Date}    30
    ${header_start_date}    DateTime.Convert Date    ${header_start_date}    result_format=%Y%m%d%H%M%S    date_format=%Y-%m-%d %H:%M:%S.%f
    LOg    ${header_start_date}
    ${header_end_date}    DateTime.Subtract Time From Date    ${current_Date}    10 days
    ${header_end_date}    DateTime.Convert Date    ${header_end_date}    result_format=%Y%m%d%H%M%S    date_format=%Y-%m-%d %H:%M:%S.%f
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ${Account ID}    Common.Setup for Getting Random Account ID    contracts    ${NGCSC1_token}
    ${contractID}    ngcscCommonMethods.random with N digits    7
    ${Random Contract ID}    BuiltIn.Catenate    SEPARATOR=    006    ${contractID}
    ngcscCommonMethods.Send Message    contracts    ${header_end_date}    ${msgRcdTs}    Expired    ${Account ID}    00000065
    ...    End Customer    ${Random Contract ID}    ${header_start_date}
    BuiltIn.Sleep    60s
    ${products Filter}    BuiltIn.Set Variable    {"pageItems":50,"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"status":{"type":"1","filter":["Expired"],"fieldCase":"UPPER"}},{"product":{"type":"1","filter":["MX-MPC2-3D-EQ"],"fieldCase":"UPPER"}}],"firstRecord":null,"lastRecord":null,"searchBy":"user","searchFor":"LineItems"}
    ${Contracts API}    String.Replace String    ${MyJuniper_Segregated_IP}/api1    api1    api/contract-manager/contracts
    ${contract_details}    Common.Executing API    ${Contracts API}    ${products Filter}    ${NGCSC1_token}
    Log    ${contract_details}
    ${total_records}    Collections.Get From Dictionary    ${contract_details}    totalRecords
    ${products Filter}    BuiltIn.Set Variable    {"pageItems":${totalRecords},"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"status":{"type":"1","filter":["Expired"],"fieldCase":"UPPER"}},{"product":{"type":"1","filter":["MX-MPC2-3D-EQ"],"fieldCase":"UPPER"}}],"firstRecord":null,"lastRecord":null,"searchBy":"user","searchFor":"LineItems"}
    ${contract_details}    Common.Executing API    ${Contracts API}    ${products Filter}    ${NGCSC1_token}
    ${contract_details}    Collections.Get From Dictionary    ${contract_details}    contractsList
    ${first_record}    Collections.Get From List    ${contract_details}    0
    ${contract_details_keys}    Collections.Get Dictionary Keys    ${first_record}
    Log    ${contract_details}
    Lists Should Be Equal    ${Contract List Fields}    ${contract_details_keys}
    ${product_value_list}    BuiltIn.Create List
    ${ContractID_List}    BuiltIn.Create List
    : FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${contract_details}    ${i}
    \    ${product_value}    Collections.Get From Dictionary    ${record}    product
    \    ${contract_ID}    Collections.Get From Dictionary    ${record}    contractId
    \    Append To List    ${product_value_list}    ${product_value}
    Collections.Remove Duplicates    ${product_value_list}
    Collections.List Should Contain Value    ${product_value_list}    MX-MPC2-3D-EQ
    ${products Filter}    BuiltIn.Set Variable    {"pageItems":50,"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"status":{"type":"1","filter":["Expired"],"fieldCase":"UPPER"}},{"product":{"type":"1","filter":["MX-MPC2-3D-EQ"],"fieldCase":"UPPER"}}],"firstRecord":null,"lastRecord":null,"searchBy":"user","searchFor":"LineItems"}
    ${External Contracts API}    String.Replace String    ${External API URL}/api1    api1    contract-manager/contracts
    ${contract_details}    Common.Executing API    ${External Contracts API}    ${products Filter}    ${NGCSC1_token}
    Log    ${contract_details}
    ${total_records}    Collections.Get From Dictionary    ${contract_details}    totalRecords
    ${products Filter}    BuiltIn.Set Variable    {"pageItems":${totalRecords},"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"status":{"type":"1","filter":["Expired"],"fieldCase":"UPPER"}},{"product":{"type":"1","filter":["MX-MPC2-3D-EQ"],"fieldCase":"UPPER"}}],"firstRecord":null,"lastRecord":null,"searchBy":"user","searchFor":"LineItems"}
    ${contract_details}    Common.Executing API    ${External Contracts API}    ${products Filter}    ${NGCSC1_token}
    Log    ${contract_details}
    ${contract_details}    Collections.Get From Dictionary    ${contract_details}    contracts
    ${first_record}    Collections.Get From List    ${contract_details}    0
    ${contract_details_keys}    Collections.Get Dictionary Keys    ${first_record}
    Log    ${contract_details}
    Lists Should Be Equal    ${Contract Fields for External API}    ${contract_details_keys}
    ${product_list_external}    BuiltIn.Create List
    ${ContractID_List_external}    BuiltIn.Create List
    : FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${contract_details}    ${i}
    \    ${product_value}    Collections.Get From Dictionary    ${record}    product
    \    Append To List    ${product_list_external}    ${product_value}
    Collections.Remove Duplicates    ${product_list_external}
    Collections.List Should Contain Value    ${product_list_external}    MX-MPC2-3D-EQ

Ship Date Filter Model
    Comment    ${epoch_time_in_pst}    ngcscCommonMethods.epoch max time in pst
    Comment    ${current_Date}    DateTime.Get Current Date
    Comment    Log    ${current_Date}
    Comment    ${header_start_date}    DateTime.Subtract Time From Date    ${current_Date}    7 days
    Comment    ${header_start_epoch_pst}    ngcscCommonMethods.epoch pst start slice time    ${header_start_date}
    Comment    ${header_end_epoch_pst}    ngcscCommonMethods.epoch pst end slice time    ${header_start_date}
    Comment    Log    ${header_start_epoch_pst}
    Comment    Log    ${header_end_epoch_pst}
    Comment    ${header_start_date}    DateTime.Convert Date    ${header_start_date}    result_format=%Y%m%d%H%M%S    date_format=%Y-%m-%d %H:%M:%S.%f
    Comment    LOg    ${header_start_date}
    Comment    ${header_end_date}    DateTime.Add Time To Date    ${current_Date}    10 days
    Comment    ${header_end_date}    DateTime.Convert Date    ${header_end_date}    result_format=%Y%m%d%H%M%S    date_format=%Y-%m-%d %H:%M:%S.%f
    Comment    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    Comment    ${Account ID}    Common.Setup for Getting Random Account ID    contracts    ${NGCSC1_token}
    Comment    ${contractID}    ngcscCommonMethods.random with N digits    7
    Comment    ${Random Contract ID}    BuiltIn.Catenate    SEPARATOR=    006    ${contractID}
    Comment    ngcscCommonMethods.Send Message    contracts    ${header_end_date}    ${msgRcdTs}    Active    ${Account ID}
    ...    00000065    End Customer    ${Random Contract ID}    ${header_start_date}
    Comment    BuiltIn.Sleep    60s
    Comment    ${Contract ID Filter}    BuiltIn.Set Variable    {"pageItems":50,"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"status":{"type":"1","filter":["Active"],"fieldCase":"UPPER"}},{"supportCoverage":{"type":"1","filter":["svc"],"fieldCase":"UPPER"}},{"shipDate":{"type":"13","filter":["1382601600000 AND 1382687999000"]}}],"firstRecord":null,"lastRecord":null,"searchBy":"user","searchFor":"LineItems"}
    ${Contract Start Date Filter}    BuiltIn.Set Variable    {"pageItems":50,"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"status":{"type":"1","filter":["Active"],"fieldCase":"UPPER"}},{"supportCoverage":{"type":"1","filter":["svc"],"fieldCase":"UPPER"}},{"shipDate":{"type":"13","filter":["1382601600000 AND 1382687999000"]}}],"firstRecord":null,"lastRecord":null,"searchBy":"user","searchFor":"LineItems"}
    ${Contracts API}    String.Replace String    ${MyJuniper_Segregated_IP}/api1    api1    api/contract-manager/contracts
    ${contract_details}    Common.Executing API    ${Contracts API}    ${Contract Start Date Filter}    ${Vidhya_Token}
    Log    ${contract_details}
    ${total_records}    Collections.Get From Dictionary    ${contract_details}    totalRecords
    ${Contract Start Date Filter}    BuiltIn.Set Variable    {"pageItems":${totalRecords},"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"status":{"type":"1","filter":["Active"],"fieldCase":"UPPER"}},{"supportCoverage":{"type":"1","filter":["svc"],"fieldCase":"UPPER"}},{"shipDate":{"type":"13","filter":["1382601600000 AND 1382687999000"]}}],"firstRecord":null,"lastRecord":null,"searchBy":"user","searchFor":"LineItems"}
    ${contract_details}    Common.Executing API    ${Contracts API}    ${Contract Start Date Filter}    ${Vidhya_Token}
    ${contract_details}    Collections.Get From Dictionary    ${contract_details}    contractsList
    ${first_record}    Collections.Get From List    ${contract_details}    0
    ${contract_details_keys}    Collections.Get Dictionary Keys    ${first_record}
    Log    ${contract_details}
    Lists Should Be Equal    ${Contract List Fields}    ${contract_details_keys}
    : FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${contract_details}    ${i}
    \    ${startdate_value}    Collections.Get From Dictionary    ${record}    shipDate
    \    ${value}    Evaluate    1382601600000 \ < ${startdate_value} < 1382687999000
    \    BuiltIn.Should Be Equal    ${value}    ${True}
    ${External Contracts API}    String.Replace String    ${External API URL}/api1    api1    contract-manager/contracts
    ${contract_details}    Common.Executing API    ${External Contracts API}    ${Contract Start Date Filter}    ${Vidhya_Token}
    ${contract_details}    Collections.Get From Dictionary    ${contract_details}    contracts
    ${first_record}    Collections.Get From List    ${contract_details}    0
    ${contract_details_keys}    Collections.Get Dictionary Keys    ${first_record}
    Log    ${contract_details}
    Lists Should Be Equal    ${Contract Fields for External API}    ${contract_details_keys}
    Comment    ${ship_date_value_list}    BuiltIn.Create List
    Comment    ${ContractID_List}    BuiltIn.Create List
    : FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${contract_details}    ${i}
    \    ${startdate_value}    Collections.Get From Dictionary    ${record}    shipDate
    \    ${value}    Evaluate    1382601600000 \ < ${startdate_value} < 1382687999000
    \    BuiltIn.Should Be Equal    ${value}    ${True}

Warranty Date Filter Model
    ${Contract Start Date Filter}    BuiltIn.Set Variable    {"pageItems":50,"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"status":{"type":"1","filter":["Active"],"fieldCase":"UPPER"}},{"warrantyExpDate":{"type":"13","filter":["1444809600000 AND 1444895999000"]}}],"firstRecord":null,"lastRecord":null,"searchBy":"user","searchFor":"LineItems"}
    ${Contracts API}    String.Replace String    ${MyJuniper_Segregated_IP}/api1    api1    api/contract-manager/contracts
    ${contract_details}    Common.Executing API    ${Contracts API}    ${Contract Start Date Filter}    ${Vidhya_Token}
    Log    ${contract_details}
    ${total_records}    Collections.Get From Dictionary    ${contract_details}    totalRecords
    ${Contract Start Date Filter}    BuiltIn.Set Variable    {"pageItems":${totalRecords},"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"status":{"type":"1","filter":["Active"],"fieldCase":"UPPER"}},{"warrantyExpDate":{"type":"13","filter":["1444809600000 AND 1444895999000"]}}],"firstRecord":null,"lastRecord":null,"searchBy":"user","searchFor":"LineItems"}
    ${contract_details}    Common.Executing API    ${Contracts API}    ${Contract Start Date Filter}    ${Vidhya_Token}
    ${contract_details}    Collections.Get From Dictionary    ${contract_details}    contractsList
    ${first_record}    Collections.Get From List    ${contract_details}    0
    ${contract_details_keys}    Collections.Get Dictionary Keys    ${first_record}
    Log    ${contract_details}
    Lists Should Be Equal    ${Contract List Fields}    ${contract_details_keys}
    :FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${contract_details}    ${i}
    \    ${warrantyExpdate_value}    Collections.Get From Dictionary    ${record}    warrantyExpDate
    \    ${value}    Evaluate    1382601600000 \ < ${warrantyExpdate_value} < 1382687999000
    \    BuiltIn.Should Be Equal    ${value}    ${True}
    ${External Contracts API}    String.Replace String    ${External API URL}/api1    api1    contract-manager/contracts
    ${contract_details}    Common.Executing API    ${External Contracts API}    ${Contract Start Date Filter}    ${Vidhya_Token}
    ${contract_details}    Collections.Get From Dictionary    ${contract_details}    contracts
    ${first_record}    Collections.Get From List    ${contract_details}    0
    ${contract_details_keys}    Collections.Get Dictionary Keys    ${first_record}
    Log    ${contract_details}
    Lists Should Be Equal    ${Contract Fields for External API}    ${contract_details_keys}
    :FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${contract_details}    ${i}
    \    ${warrantyExpdate_value}    Collections.Get From Dictionary    ${record}    warrantyExpDate
    \    ${value}    Evaluate    1382601600000 \ < ${warrantyExpdate_value} < 1382687999000
    \    BuiltIn.Should Be Equal    ${value}    ${True}
    ${EMPTY}
    ${EMPTY}
    ${EMPTY}
    ${EMPTY}
    ${EMPTY}
    ${EMPTY}
    ${EMPTY}

City Filter Model
    ${Contract Start Date Filter}    BuiltIn.Set Variable    {"pageItems":50,"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"status":{"type":"1","filter":["Active"],"fieldCase":"UPPER"}},{"city":{"type":"1","filter":["SHINAGAWA-KU"],"fieldCase":"UPPER"}}],"firstRecord":null,"lastRecord":null,"searchBy":"user","searchFor":"LineItems"}
    ${Contracts API}    String.Replace String    ${MyJuniper_Segregated_IP}/api1    api1    api/contract-manager/contracts
    ${contract_details}    Common.Executing API    ${Contracts API}    ${Contract Start Date Filter}    ${Vidhya_Token}
    Log    ${contract_details}
    ${total_records}    Collections.Get From Dictionary    ${contract_details}    totalRecords
    ${Contract Start Date Filter}    BuiltIn.Set Variable    {"pageItems":${totalRecords},"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"status":{"type":"1","filter":["Active"],"fieldCase":"UPPER"}},{"city":{"type":"1","filter":["SHINAGAWA-KU"],"fieldCase":"UPPER"}}],"firstRecord":null,"lastRecord":null,"searchBy":"user","searchFor":"LineItems"}
    ${contract_details}    Common.Executing API    ${Contracts API}    ${Contract Start Date Filter}    ${Vidhya_Token}
    ${contract_details}    Collections.Get From Dictionary    ${contract_details}    contractsList
    ${first_record}    Collections.Get From List    ${contract_details}    0
    ${contract_details_keys}    Collections.Get Dictionary Keys    ${first_record}
    Log    ${contract_details}
    Lists Should Be Equal    ${Contract List Fields}    ${contract_details_keys}
    ${City_Values_List}    BuiltIn.Create List
    :FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${contract_details}    ${i}
    \    ${city_value}    Collections.Get From Dictionary    ${record}    city
    \    Collections.Append To List    ${City_Values_List}    ${city_value}
    Collections.Remove Duplicates    ${City_Values_List}
    Collections.List Should Contain Value    ${City_Values_List}    SHINAGAWA-KU
    ${External Contracts API}    String.Replace String    ${External API URL}/api1    api1    contract-manager/contracts
    ${Contract Start Date Filter}    BuiltIn.Set Variable    {"pageItems":${totalRecords},"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"status":{"type":"1","filter":["Active"],"fieldCase":"UPPER"}},{"locationCity":{"type":"1","filter":["SHINAGAWA-KU"],"fieldCase":"UPPER"}}],"firstRecord":null,"lastRecord":null,"searchBy":"user","searchFor":"LineItems"}
    ${contract_details}    Common.Executing API    ${External Contracts API}    ${Contract Start Date Filter}    ${Vidhya_Token}
    ${contract_details}    Collections.Get From Dictionary    ${contract_details}    contracts
    ${first_record}    Collections.Get From List    ${contract_details}    0
    ${contract_details_keys}    Collections.Get Dictionary Keys    ${first_record}
    Log    ${contract_details}
    Lists Should Be Equal    ${Contract Fields for External API}    ${contract_details_keys}
    ${City_Values_List_External}    BuiltIn.Create List
    :FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${contract_details}    ${i}
    \    ${city_value}    Collections.Get From Dictionary    ${record}    city
    \    Collections.Append To List    ${City_Values_List_External}    ${city_value}
    Collections.Remove Duplicates    ${City_Values_List_External}
    Collections.List Should Contain Value    ${City_Values_List_External}    SHINAGAWA-KU

State Filter Model
    ${Contract Start Date Filter}    BuiltIn.Set Variable    {"pageItems":50,"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"status":{"type":"1","filter":["Active"],"fieldCase":"UPPER"}},{"state":{"type":"1","filter":["Tokyo"],"fieldCase":"UPPER"}}],"firstRecord":null,"lastRecord":null,"searchBy":"user","searchFor":"LineItems"}
    ${Contracts API}    String.Replace String    ${MyJuniper_Segregated_IP}/api1    api1    api/contract-manager/contracts
    ${contract_details}    Common.Executing API    ${Contracts API}    ${Contract Start Date Filter}    ${Vidhya_Token}
    Log    ${contract_details}
    ${total_records}    Collections.Get From Dictionary    ${contract_details}    totalRecords
    ${Contract Start Date Filter}    BuiltIn.Set Variable    {"pageItems":${totalRecords},"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"status":{"type":"1","filter":["Active"],"fieldCase":"UPPER"}},{"state":{"type":"1","filter":["Tokyo"],"fieldCase":"UPPER"}}],"firstRecord":null,"lastRecord":null,"searchBy":"user","searchFor":"LineItems"}
    ${contract_details}    Common.Executing API    ${Contracts API}    ${Contract Start Date Filter}    ${Vidhya_Token}
    ${contract_details}    Collections.Get From Dictionary    ${contract_details}    contractsList
    ${first_record}    Collections.Get From List    ${contract_details}    0
    ${contract_details_keys}    Collections.Get Dictionary Keys    ${first_record}
    Log    ${contract_details}
    Lists Should Be Equal    ${Contract List Fields}    ${contract_details_keys}
    ${State_Values_List}    BuiltIn.Create List
    :FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${contract_details}    ${i}
    \    ${state_value}    Collections.Get From Dictionary    ${record}    state
    \    Collections.Append To List    ${State_Values_List}    ${state_value}
    Collections.Remove Duplicates    ${State_Values_List}
    Collections.List Should Contain Value    ${State_Values_List}    Tokyo
    ${External Contracts API}    String.Replace String    ${External API URL}/api1    api1    contract-manager/contracts
    ${contract_details}    Common.Executing API    ${External Contracts API}    ${Contract Start Date Filter}    ${Vidhya_Token}
    ${contract_details}    Collections.Get From Dictionary    ${contract_details}    contracts
    ${first_record}    Collections.Get From List    ${contract_details}    0
    ${contract_details_keys}    Collections.Get Dictionary Keys    ${first_record}
    Log    ${contract_details}
    Lists Should Be Equal    ${Contract Fields for External API}    ${contract_details_keys}
    ${State_Values_List_External}    BuiltIn.Create List
    :FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${contract_details}    ${i}
    \    ${state_value}    Collections.Get From Dictionary    ${record}    state
    \    Collections.Append To List    ${State_Values_List_External}    ${state_value}
    Collections.Remove Duplicates    ${State_Values_List_External}
    Collections.List Should Contain Value    ${State_Values_List_External}    Tokyo

Country Filter Model
    ${Contract Start Date Filter}    BuiltIn.Set Variable    {"pageItems":50,"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"status":{"type":"1","filter":["Active"],"fieldCase":"UPPER"}},{"country":{"type":"1","filter":["Japan"],"fieldCase":"UPPER"}}],"firstRecord":null,"lastRecord":null,"searchBy":"user","searchFor":"LineItems"}
    ${Contracts API}    String.Replace String    ${MyJuniper_Segregated_IP}/api1    api1    api/contract-manager/contracts
    ${contract_details}    Common.Executing API    ${Contracts API}    ${Contract Start Date Filter}    ${Vidhya_Token}
    Log    ${contract_details}
    ${total_records}    Collections.Get From Dictionary    ${contract_details}    totalRecords
    ${Contract Start Date Filter}    BuiltIn.Set Variable    {"pageItems":${totalRecords},"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"status":{"type":"1","filter":["Active"],"fieldCase":"UPPER"}},{"country":{"type":"1","filter":["Japan"],"fieldCase":"UPPER"}}],"firstRecord":null,"lastRecord":null,"searchBy":"user","searchFor":"LineItems"}
    ${contract_details}    Common.Executing API    ${Contracts API}    ${Contract Start Date Filter}    ${Vidhya_Token}
    ${contract_details}    Collections.Get From Dictionary    ${contract_details}    contractsList
    ${first_record}    Collections.Get From List    ${contract_details}    0
    ${contract_details_keys}    Collections.Get Dictionary Keys    ${first_record}
    Log    ${contract_details}
    Lists Should Be Equal    ${Contract List Fields}    ${contract_details_keys}
    ${Country_Values_List}    BuiltIn.Create List
    :FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${contract_details}    ${i}
    \    ${country_value}    Collections.Get From Dictionary    ${record}    country
    \    Collections.Append To List    ${Country_Values_List}    ${country_value}
    Collections.Remove Duplicates    ${Country_Values_List}
    Collections.List Should Contain Value    ${Country_Values_List}    Japan
    ${External Contracts API}    String.Replace String    ${External API URL}/api1    api1    contract-manager/contracts
    ${contract_details}    Common.Executing API    ${External Contracts API}    ${Contract Start Date Filter}    ${Vidhya_Token}
    ${contract_details}    Collections.Get From Dictionary    ${contract_details}    contracts
    ${first_record}    Collections.Get From List    ${contract_details}    0
    ${contract_details_keys}    Collections.Get Dictionary Keys    ${first_record}
    Log    ${contract_details}
    Lists Should Be Equal    ${Contract Fields for External API}    ${contract_details_keys}
    ${Country_Values_List_External}    BuiltIn.Create List
    :FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${contract_details}    ${i}
    \    ${country_value}    Collections.Get From Dictionary    ${record}    country
    \    Collections.Append To List    ${Country_Values_List_External}    ${country_value}
    Collections.Remove Duplicates    ${Country_Values_List_External}
    Collections.List Should Contain Value    ${Country_Values_List_External}    Japan

SSRN Filter Model
    ${Contract Start Date Filter}    BuiltIn.Set Variable    {"pageItems":50,"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"status":{"type":"1","filter":["Active"],"fieldCase":"UPPER"}},{"softwareSupportReferenceNumber":{"type":"1","filter":["1500"],"fieldCase":"UPPER"}}],"firstRecord":null,"lastRecord":null,"searchBy":"user","searchFor":"LineItems"}
    ${Contracts API}    String.Replace String    ${MyJuniper_Segregated_IP}/api1    api1    api/contract-manager/contracts
    ${contract_details}    Common.Executing API    ${Contracts API}    ${Contract Start Date Filter}    ${Vidhya_Token}
    Log    ${contract_details}
    ${total_records}    Collections.Get From Dictionary    ${contract_details}    totalRecords
    ${Contract Start Date Filter}    BuiltIn.Set Variable    {"pageItems":${totalRecords},"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"status":{"type":"1","filter":["Active"],"fieldCase":"UPPER"}},{"softwareSupportReferenceNumber":{"type":"1","filter":["1500"],"fieldCase":"UPPER"}}],"firstRecord":null,"lastRecord":null,"searchBy":"user","searchFor":"LineItems"}
    ${contract_details}    Common.Executing API    ${Contracts API}    ${Contract Start Date Filter}    ${Vidhya_Token}
    ${contract_details}    Collections.Get From Dictionary    ${contract_details}    contractsList
    ${first_record}    Collections.Get From List    ${contract_details}    0
    ${contract_details_keys}    Collections.Get Dictionary Keys    ${first_record}
    Log    ${contract_details}
    Lists Should Be Equal    ${Contract List Fields}    ${contract_details_keys}
    ${SSRN_Values_List}    BuiltIn.Create List
    :FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${contract_details}    ${i}
    \    ${ssrn_value}    Collections.Get From Dictionary    ${record}    softwareSupportReferenceNumber
    \    Collections.Append To List    ${SSRN_Values_List}    ${ssrn_value}
    Collections.Remove Duplicates    ${SSRN_Values_List}
    Collections.List Should Contain Value    ${SSRN_Values_List}    1500
    ${External Contracts API}    String.Replace String    ${External API URL}/api1    api1    contract-manager/contracts
    ${contract_details}    Common.Executing API    ${External Contracts API}    ${Contract Start Date Filter}    ${Vidhya_Token}
    ${contract_details}    Collections.Get From Dictionary    ${contract_details}    contracts
    ${first_record}    Collections.Get From List    ${contract_details}    0
    ${contract_details_keys}    Collections.Get Dictionary Keys    ${first_record}
    Log    ${contract_details}
    Lists Should Be Equal    ${Contract Fields for External API}    ${contract_details_keys}
    ${SSRN_Values_List_External}    BuiltIn.Create List
    :FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${contract_details}    ${i}
    \    ${ssrn_value}    Collections.Get From Dictionary    ${record}    softwareSupportReferenceNumber
    \    Collections.Append To List    ${SSRN_Values_List_External}    ${ssrn_value}
    Collections.Remove Duplicates    ${SSRN_Values_List_External}
    Collections.List Should Contain Value    ${SSRN_Values_List_External}    1500
