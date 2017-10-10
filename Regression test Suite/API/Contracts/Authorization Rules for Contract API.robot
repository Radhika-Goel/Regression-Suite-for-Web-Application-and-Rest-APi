*** Settings ***
Suite Setup
Library           requests
Resource          ../../Common.robot
Resource          ../../Variables.txt
Library           ngcscCommonMethods

*** Variables ***
@{Contract Ids}    0066022344    0066092441    0060136125    0066022491    0060135607    11479845005    91495093234
...               0066055467    0066029610    0060224111
${Account ID}     0100267501
${Access Group}    0010000423
${Account Id for User Type}    0100000028
${Access group For User type}    0010001126

*** Test Cases ***
Contract LineItem with unauthorized token
    [Tags]    contract
    ${epoch_time_in_pst}    ngcscCommonMethods.epoch max time in pst
    ${current_Date}    DateTime.Get Current Date
    ${header_start_date}    DateTime.Subtract Time From Date    ${current_Date}    7 days
    ${header_start_date}    DateTime.Convert Date    ${header_start_date}    result_format=%Y%m%d%H%M%S    date_format=%Y-%m-%d %H:%M:%S.%f
    ${headerEndDate}    DateTime.Subtract Time From Date    ${current_Date}    10 days
    ${headerEndDate}    DateTime.Convert Date    ${headerEndDate}    result_format=%Y%m%d%H%M%S    date_format=%Y-%m-%d %H:%M:%S.%f
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ngcscCommonMethods.Send Message    contracts    ${headerEndDate}    ${msgRcdTs}    Expired    0100056761    ZRE00001
    ...    Primary Reseller    0066022344    ${header_start_date}
    BuiltIn.Sleep    60s
    ${restIp_stage}    String.Replace String    ${MyJuniper_Segregated_IP}/api1    api1    ${Contract Line Item API}
    ${params}    BuiltIn.Set Variable    {"contractId":"0066022344"}
    ${params}    json.Loads    ${params}
    log    ${params}
    ${params}    json.Dumps    ${params}
    Log    ${params}
    ${headers}    BuiltIn.Create Dictionary    Authorization=${NGCSC1_token}
    log    ${headers}
    ${headers1}    BuiltIn.Create Dictionary    'content-type'=application/json
    ${response}    requests.Post    ${restIp_stage}    data=${params}    headers=${headers}    verify=${FALSE}
    ${api_output_json}    BuiltIn.Set Variable    ${response.json()}
    ${contract_records}    Collections.Get From Dictionary    ${api_output_json}    contractItemsList
    ${all_contractId_stage_records}    Common.Getting serial Number from records    ${contract_records}    contractId
    Collections.List Should Contain Value    ${all_contractId_stage_records}    0066022344
    ${restIp_external}    String.Replace String    ${External URl}/api1    api1    ${External Contract Details API}
    ${response}    requests.Post    ${restIp_external}    data=${params}    headers=${headers}    verify=${FALSE}
    ${api_output_json}    BuiltIn.Set Variable    ${response.json()}
    ${contract_records}    Collections.Get From Dictionary    ${api_output_json}    productsInContract
    ${all_contractId_external_records}    Common.Getting serial Number from records    ${contract_records}    contractId
    Collections.List Should Contain Value    ${all_contractId_external_records}    0066022344
    ${headers}    BuiltIn.Create Dictionary    Authorization=${bart_token}
    log    ${headers}
    ${response}    requests.Post    ${restIp_stage}    data=${params}    headers=${headers}    verify=${FALSE}
    log    ${headers}
    ${headers1}    BuiltIn.Create Dictionary    'content-type'=application/json
    ${response}    requests.Post    ${restIp_stage}    data=${params}    headers=${headers}    verify=${FALSE}
    ${api_output_json}    BuiltIn.Set Variable    ${response.json()}
    ${contract_records}    Collections.Get From Dictionary    ${api_output_json}    contractItemsList
    ${all_contractId_stage_records}    Common.Getting serial Number from records    ${contract_records}    contractId
    Collections.List Should Not Contain Value    ${all_contractId_stage_records}    0066022344
    ${restIp_external}    String.Replace String    ${External URl}/api1    api1    ${External Contract Details API}
    ${response}    requests.Post    ${restIp_external}    data=${params}    headers=${headers}    verify=${FALSE}
    ${api_output_json}    BuiltIn.Set Variable    ${response.json()}
    ${contract_records}    Collections.Get From Dictionary    ${api_output_json}    productsInContract
    ${all_contractId_external_records}    Common.Getting serial Number from records    ${contract_records}    contractId
    Collections.List Should Not Contain Value    ${all_contractId_external_records}    0066022344

Contract LineItem API Continuosuly Chaning Contract ID
    [Tags]    contract
    ${total_length}    BuiltIn.Get Length    ${Contract Ids}
    : FOR    ${i}    IN RANGE    ${total_length}
    \    ${value}    Collections.Get From List    ${Contract Ids}    ${i}
    \    ${restIp}    String.Replace String    ${MyJuniper_Segregated_IP}/api1    api1    ${Contract Line Item API}
    \    ${params}    BuiltIn.Set Variable    {"contractId":"${value}"}
    \    ${params}    json.Loads    ${params}
    \    log    ${params}
    \    ${params}    json.Dumps    ${params}
    \    Log    ${params}
    \    ${headers}    BuiltIn.Create Dictionary    Authorization=${NGCSC1_token}
    \    log    ${headers}
    \    ${headers1}    BuiltIn.Create Dictionary    'content-type'=application/json
    \    ${response}    requests.Post    ${restIp}    data=${params}    headers=${headers}    verify=${FALSE}
    \    ${api_output_json}    BuiltIn.Set Variable    ${response.json()}
    \    ${total_records_output}    Collections.Get From Dictionary    ${api_output_json}    totalRecords
    \    ${contract_records}    Collections.Get From Dictionary    ${api_output_json}    contractItemsList
    \    ${all_contractId_stage_records}    Common.Getting serial Number from records    ${contract_records}    contractId
    \    BuiltIn.Run Keyword If    '${i}' == '1' or '${i}' == '7'    BuiltIn.Should Be Equal As Integers    ${total_records_output}    0
    \    ...    ELSE    Collections.List Should Contain Value    ${all_contractId_stage_records}    ${value}
    \    ${restIp}    String.Replace String    ${External URl}/api1    api1    ${External Contract Details API}
    \    ${response}    requests.Post    ${restIp}    data=${params}    headers=${headers}    verify=${FALSE}
    \    ${api_output_json}    BuiltIn.Set Variable    ${response.json()}
    \    ${total_records_output}    Collections.Get From Dictionary    ${api_output_json}    totalRecords
    \    ${contract_records}    Collections.Get From Dictionary    ${api_output_json}    productsInContract
    \    ${all_contractId_external_records}    Common.Getting serial Number from records    ${contract_records}    contractId
    \    BuiltIn.Run Keyword If    '${i}' == '1' or '${i}' == '7'    BuiltIn.Should Be Equal As Integers    ${total_records_output}    0
    \    ...    ELSE    Collections.List Should Contain Value    ${all_contractId_external_records}    ${value}

Contract LineItem API for Partner Function as Primary Reseller
    [Tags]    contract
    ${epoch_time_in_pst}    ngcscCommonMethods.epoch max time in pst
    ${current_Date}    DateTime.Get Current Date
    ${header_end_date}    DateTime.Add Time To Date    ${current_Date}    10 days
    ${header_end_date}    DateTime.Convert Date    ${header_end_date}    result_format=%Y%m%d%H%M%S    date_format=%Y-%m-%d %H:%M:%S.%f
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    Comment    ${Random Contract ID}    Generate Random String    10    00[NUMBERS]
    ${contractID}    ngcscCommonMethods.random with N digits    7
    ${Random Contract ID}    BuiltIn.Catenate    SEPARATOR=    006    ${contractID}
    ${Account ID}    Common.Setup for Getting Random Account ID    contracts    ${NGCSC1_token}
    ngcscCommonMethods.Send Message    contracts    ${header_end_date}    ${msgRcdTs}    Active    ${Account ID}    ZRE00001
    ...    Primary Reseller    ${Random Contract ID}    ${header_start_date}
    BuiltIn.Sleep    60s
    ${all_contractId_records_stage}    Common.Contract Line Item    ${MyJuniper_Segregated_IP}    ${Contract Line Item API}    contractItemsList    ${Random Contract ID}    ${NGCSC9_token}
    Collections.List Should Contain Value    ${all_contractId_records_stage}    ${Random Contract ID}
    ${all_contractId_records_external}    Common.Contract Line Item    ${External URl}    ${External Contract Details API}    productsInContract    ${Random Contract ID}    ${NGCSC9_token}
    Collections.List Should Contain Value    ${all_contractId_records_external}    ${Random Contract ID}
    ngcscCommonMethods.Send Message    contracts    ${header_end_date}    ${msgRcdTs}    Active    0101138747    ZRE00001
    ...    Primary Reseller    ${Random Contract ID}    ${header_start_date}
    BuiltIn.Sleep    60s
    ${all_contractId_records_new_stage}    Common.Contract Line Item    ${MyJuniper_Segregated_IP}    ${Contract Line Item API}    contractItemsList    ${Random Contract ID}    ${NGCSC9_token}
    Collections.List Should Not Contain Value    ${all_contractId_records_new_stage}    ${Random Contract ID}
    ${all_contractId_records_new_external}    Common.Contract Line Item    ${External URl}    ${External Contract Details API}    productsInContract    ${Random Contract ID}    ${NGCSC9_token}
    Collections.List Should Not Contain Value    ${all_contractId_records_new_external}    ${Random Contract ID}

Contract LineItem API for Partner Function as Distributor
    [Tags]    contract
    ${epoch_time_in_pst}    ngcscCommonMethods.epoch max time in pst
    ${current_Date}    DateTime.Get Current Date
    ${header_end_date}    DateTime.Add Time To Date    ${current_Date}    10 days
    ${header_end_date}    DateTime.Convert Date    ${header_end_date}    result_format=%Y%m%d%H%M%S    date_format=%Y-%m-%d %H:%M:%S.%f
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ${contractID}    ngcscCommonMethods.random with N digits    7
    ${Random Contract ID}    BuiltIn.Catenate    SEPARATOR=    006    ${contractID}
    ${Account ID}    Common.Setup for Getting Random Account ID    contracts    ${NGCSC1_token}
    ngcscCommonMethods.Send Message    contracts    ${header_end_date}    ${msgRcdTs}    Active    ${Account ID}    ZR000001
    ...    Distributor    ${Random Contract ID}    ${header_start_date}
    BuiltIn.Sleep    60s
    ${all_contractId_records_stage}    Common.Contract Line Item    ${MyJuniper_Segregated_IP}    ${Contract Line Item API}    contractItemsList    ${Random Contract ID}    ${NGCSC9_token}
    Collections.List Should Contain Value    ${all_contractId_records_stage}    ${Random Contract ID}
    ${all_contractId_records_external}    Common.Contract Line Item    ${External URl}    ${External Contract Details API}    productsInContract    ${Random Contract ID}    ${NGCSC9_token}
    Collections.List Should Contain Value    ${all_contractId_records_external}    ${Random Contract ID}
    ${time_in_pst}    ngcscCommonMethods.current time for customer master
    ${date_in_pst}    ngcscCommonMethods.current date for customer master
    ngcscCommonMethods.Send Message    customer_master    ${time_in_pst}    0201034725    D    Has Asset Primary Account    0101164337
    ...    ${date_in_pst}    ${msgRcdTs}    ZBUR09
    BuiltIn.Sleep    60s
    ${all_accounts_json}    Common.Get All Accounts API    contracts    ${NGCSC9_token}
    ${all_accounts}    Collections.Get From Dictionary    ${all_accounts_json}    accountsList
    ${accountIds}    Common.Getting serial Number from records    ${all_accounts}    accountId
    Collections.List Should Not Contain Value    ${accountIds}    0101164337
    ngcscCommonMethods.Send Message    contracts    ${header_end_date}    ${msgRcdTs}    Active    0101164337    ZR000001
    ...    Distributor    ${Random Contract ID}    ${header_start_date}
    BuiltIn.Sleep    60s
    ${all_contractId_records_new_stage}    Common.Contract Line Item    ${MyJuniper_Segregated_IP}    ${Contract Line Item API}    contractItemsList    ${Random Contract ID}    ${NGCSC9_token}
    Collections.List Should Not Contain Value    ${all_contractId_records_new_stage}    ${Random Contract ID}
    ${all_contractId_records_new_external}    Common.Contract Line Item    ${External URl}    ${External Contract Details API}    productsInContract    ${Random Contract ID}    ${NGCSC9_token}
    Collections.List Should Not Contain Value    ${all_contractId_records_new_external}    ${Random Contract ID}

Contract LineItem API for Partner Function as End Customer
    [Tags]    contract
    ${epoch_time_in_pst}    ngcscCommonMethods.epoch max time in pst
    ${current_Date}    DateTime.Get Current Date
    ${header_end_date}    DateTime.Add Time To Date    ${current_Date}    10 days
    ${header_end_date}    DateTime.Convert Date    ${header_end_date}    result_format=%Y%m%d%H%M%S    date_format=%Y-%m-%d %H:%M:%S.%f
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ${contractID}    ngcscCommonMethods.random with N digits    7
    ${Random Contract ID}    BuiltIn.Catenate    SEPARATOR=    006    ${contractID}
    ${Account ID}    Common.Setup for Getting Random Account ID    contracts    ${NGCSC1_token}
    ngcscCommonMethods.Send Message    contracts    ${header_end_date}    ${msgRcdTs}    Active    ${Account ID}    00000065
    ...    End Customer    ${Random Contract ID}    ${header_start_date}
    BuiltIn.Sleep    60s
    ${all_contractId_records_stage}    Common.Contract Line Item    ${MyJuniper_Segregated_IP}    ${Contract Line Item API}    contractItemsList    ${Random Contract ID}    ${NGCSC9_token}
    Collections.List Should Contain Value    ${all_contractId_records_stage}    ${Random Contract ID}
    ${all_contractId_records_external}    Common.Contract Line Item    ${External URl}    ${External Contract Details API}    productsInContract    ${Random Contract ID}    ${NGCSC9_token}
    Collections.List Should Contain Value    ${all_contractId_records_external}    ${Random Contract ID}
    ${time_in_pst}    ngcscCommonMethods.current time for customer master
    ${date_in_pst}    ngcscCommonMethods.current date for customer master
    ngcscCommonMethods.Send Message    customer_master    ${time_in_pst}    0201034725    D    Has Asset Secondary Account    0100522228
    ...    ${date_in_pst}    ${msgRcdTs}    ZBUR10
    BuiltIn.Sleep    60s
    ${all_accounts_json}    Common.Get All Accounts API    contracts    ${NGCSC9_token}
    ${all_accounts}    Collections.Get From Dictionary    ${all_accounts_json}    accountsList
    ${accountIds}    Common.Getting serial Number from records    ${all_accounts}    accountId
    Collections.List Should Not Contain Value    ${accountIds}    0100522228
    ngcscCommonMethods.Send Message    contracts    ${header_end_date}    ${msgRcdTs}    Active    0100522228    00000065
    ...    End Customer    ${Random Contract ID}    ${header_start_date}
    BuiltIn.Sleep    60s
    ${all_contractId_records_new_stage}    Common.Contract Line Item    ${MyJuniper_Segregated_IP}    ${Contract Line Item API}    contractItemsList    ${Random Contract ID}    ${NGCSC9_token}
    Collections.List Should Not Contain Value    ${all_contractId_records_new_stage}    ${Random Contract ID}
    ${all_contractId_records_new_external}    Common.Contract Line Item    ${External URl}    ${External Contract Details API}    productsInContract    ${Random Contract ID}    ${NGCSC9_token}
    Collections.List Should Not Contain Value    ${all_contractId_records_new_external}    ${Random Contract ID}

Contract ID associated to account which is part of access group
    [Tags]    contract
    ${epoch_time_in_pst}    ngcscCommonMethods.epoch max time in pst
    ${current_Date}    DateTime.Get Current Date
    ${headerEndDate}    DateTime.Subtract Time From Date    ${current_Date}    10 days
    ${header_end_date}    DateTime.Convert Date    ${headerEndDate}    result_format=%Y%m%d%H%M%S    date_format=%Y-%m-%d %H:%M:%S.%f
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ngcscCommonMethods.Send Message    access_group    ${header_end_date}    ${Account ID}    ${Access Group}    I    ${msgRcdTs}
    BuiltIn.Sleep    60s
    ${time_in_pst}    ngcscCommonMethods.current time for customer master
    ${date_in_pst}    ngcscCommonMethods.current date for customer master
    Comment    ngcscCommonMethods.Send Message    customer_master    ${time_in_pst}    0201034504    I    Has Asset Primary Account
    ...    ${Account ID}    ${date_in_pst}    ${msgRcdTs}
    Comment    BuiltIn.Sleep    60s
    ${header_end_date}    DateTime.Add Time To Date    ${current_Date}    10 days
    ${header_end_date}    DateTime.Convert Date    ${header_end_date}    result_format=%Y%m%d%H%M%S    date_format=%Y-%m-%d %H:%M:%S.%f
    ${contractID}    ngcscCommonMethods.random with N digits    7
    ${Random Contract ID}    BuiltIn.Catenate    SEPARATOR=    006    ${contractID}
    ngcscCommonMethods.Send Message    contracts    ${header_end_date}    ${msgRcdTs}    Active    ${Account ID}    ZRE00001
    ...    Primary Reseller    ${Random Contract ID}    ${header_start_date}
    BuiltIn.Sleep    60s
    ${all_contractId_records_stage}    Common.Contract Line Item    ${MyJuniper_Segregated_IP}    ${Contract Line Item API}    contractItemsList    ${Random Contract ID}    ${NGCSC9_token}
    Collections.List Should Contain Value    ${all_contractId_records_stage}    ${Random Contract ID}
    ${all_contractId_records_external}    Common.Contract Line Item    ${External URl}    ${External Contract Details API}    productsInContract    ${Random Contract ID}    ${NGCSC9_token}
    Collections.List Should Contain Value    ${all_contractId_records_external}    ${Random Contract ID}
    ngcscCommonMethods.Send Message    contracts    ${header_end_date}    ${msgRcdTs}    Active    0101025190    ZRE00001
    ...    Primary Reseller    ${Random Contract ID}    ${header_start_date}
    BuiltIn.Sleep    60s
    ${all_contractId_records_new_stage}    Common.Contract Line Item    ${MyJuniper_Segregated_IP}    ${Contract Line Item API}    contractItemsList    ${Random Contract ID}    ${NGCSC9_token}
    Collections.List Should Not Contain Value    ${all_contractId_records_new_stage}    ${Random Contract ID}
    ${all_contractId_records_new_external}    Common.Contract Line Item    ${External URl}    ${External Contract Details API}    productsInContract    ${Random Contract ID}    ${NGCSC9_token}
    Collections.List Should Not Contain Value    ${all_contractId_records_new_external}    ${Random Contract ID}
    ngcscCommonMethods.Send Message    access_group    ${header_end_date}    ${Account ID}    ${Access Group}    D    ${msgRcdTs}
    BuiltIn.Sleep    60s
    ${all_accounts_json}    Common.Get All Accounts API    contracts    ${NGCSC9_token}
    ${all_accounts}    Collections.Get From Dictionary    ${all_accounts_json}    accountsList
    ${accountIds}    Common.Getting serial Number from records    ${all_accounts}    accountId
    Collections.List Should Not Contain Value    ${accountIds}    ${accountIds}    ${Account ID}

Contract ID having HAP relationship
    [Tags]    contract
    ${time_in_pst}    ngcscCommonMethods.current time for customer master
    ${date_in_pst}    ngcscCommonMethods.current date for customer master
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ngcscCommonMethods.Send Message    customer_master    ${time_in_pst}    0201034725    I    Has Asset Primary Account    0100516691
    ...    ${date_in_pst}    ${msgRcdTs}    ZBUR09
    BuiltIn.Sleep    60s
    ${epoch_time_in_pst}    ngcscCommonMethods.epoch max time in pst
    ${current_Date}    DateTime.Get Current Date
    ${header_end_date}    DateTime.Add Time To Date    ${current_Date}    10 days
    ${header_end_date}    DateTime.Convert Date    ${header_end_date}    result_format=%Y%m%d%H%M%S    date_format=%Y-%m-%d %H:%M:%S.%f
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ${contractID}    ngcscCommonMethods.random with N digits    7
    ${Random Contract ID}    BuiltIn.Catenate    SEPARATOR=    006    ${contractID}
    ngcscCommonMethods.Send Message    contracts    ${header_end_date}    ${msgRcdTs}    Active    0100516691    ZRE00001
    ...    Primary Reseller    ${Random Contract ID}    ${header_start_date}
    BuiltIn.Sleep    60s
    ${all_contractId_records_stage}    Common.Contract Line Item    ${MyJuniper_Segregated_IP}    ${Contract Line Item API}    contractItemsList    ${Random Contract ID}    ${NGCSC9_token}
    Collections.List Should Contain Value    ${all_contractId_records_stage}    ${Random Contract ID}
    ${all_contractId_records_external}    Common.Contract Line Item    ${External URl}    ${External Contract Details API}    productsInContract    ${Random Contract ID}    ${NGCSC9_token}
    Collections.List Should Contain Value    ${all_contractId_records_external}    ${Random Contract ID}
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ngcscCommonMethods.Send Message    contracts    ${header_end_date}    ${msgRcdTs}    Active    0100498380    ZRE00001
    ...    Primary Reseller    ${Random Contract ID}    ${header_start_date}
    BuiltIn.Sleep    60s
    ${all_contractId_records_new_stage}    Common.Contract Line Item    ${MyJuniper_Segregated_IP}    ${Contract Line Item API}    contractItemsList    ${Random Contract ID}    ${NGCSC9_token}
    Collections.List Should Not Contain Value    ${all_contractId_records_new_stage}    ${Random Contract ID}
    ${all_contractId_records_new_external}    Common.Contract Line Item    ${External URl}    ${External Contract Details API}    productsInContract    ${Random Contract ID}    ${NGCSC9_token}
    Collections.List Should Not Contain Value    ${all_contractId_records_new_external}    ${Random Contract ID}
    ngcscCommonMethods.Send Message    customer_master    ${time_in_pst}    0201034725    D    Has Asset Primary Account    0100516691
    ...    ${date_in_pst}    ${msgRcdTs}    ZBUR09
    BuiltIn.Sleep    60s
    ${all_accounts_json}    Common.Get All Accounts API    contracts    ${NGCSC9_token}
    ${all_accounts}    Collections.Get From Dictionary    ${all_accounts_json}    accountsList
    ${accountIds}    Common.Getting serial Number from records    ${all_accounts}    accountId
    Collections.List Should Not Contain Value    ${accountIds}    ${accountIds}    ${Account ID}

Contract ID having HAS relationship
    [Tags]    contract
    [Timeout]
    ${time_in_pst}    ngcscCommonMethods.current time for customer master
    ${date_in_pst}    ngcscCommonMethods.current date for customer master
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ngcscCommonMethods.Send Message    customer_master    ${time_in_pst}    0201034504    I    Has Asset Secondary Account    0100850943
    ...    ${date_in_pst}    ${msgRcdTs}    ZBUR10
    BuiltIn.Sleep    60s
    ${epoch_time_in_pst}    ngcscCommonMethods.epoch max time in pst
    ${current_Date}    DateTime.Get Current Date
    ${header_end_date}    DateTime.Add Time To Date    ${current_Date}    10 days
    ${header_end_date}    DateTime.Convert Date    ${header_end_date}    result_format=%Y%m%d%H%M%S    date_format=%Y-%m-%d %H:%M:%S.%f
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ${contractID}    ngcscCommonMethods.random with N digits    7
    ${Random Contract ID}    BuiltIn.Catenate    SEPARATOR=    006    ${contractID}
    ngcscCommonMethods.Send Message    contracts    ${header_end_date}    ${msgRcdTs}    Active    0100850943    ZRE00001
    ...    Primary Reseller    ${Random Contract ID}    ${header_start_date}
    BuiltIn.Sleep    60s
    ${all_contractId_records_stage}    Common.Contract Line Item    ${MyJuniper_Segregated_IP}    ${Contract Line Item API}    contractItemsList    ${Random Contract ID}    ${NGCSC9_token}
    Collections.List Should Contain Value    ${all_contractId_records_stage}    ${Random Contract ID}
    ${all_contractId_records_external}    Common.Contract Line Item    ${External URl}    ${External Contract Details API}    productsInContract    ${Random Contract ID}    ${NGCSC9_token}
    Collections.List Should Contain Value    ${all_contractId_records_external}    ${Random Contract ID}
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ngcscCommonMethods.Send Message    contracts    ${header_end_date}    ${msgRcdTs}    Active    0100498380    ZRE00001
    ...    Primary Reseller    ${Random Contract ID}    ${header_start_date}
    BuiltIn.Sleep    60s
    ${all_contractId_records_new_stage}    Common.Contract Line Item    ${MyJuniper_Segregated_IP}    ${Contract Line Item API}    contractItemsList    ${Random Contract ID}    ${NGCSC9_token}
    Collections.List Should Not Contain Value    ${all_contractId_records_new_stage}    ${Random Contract ID}
    ${all_contractId_records_new_external}    Common.Contract Line Item    ${External URl}    ${External Contract Details API}    productsInContract    ${Random Contract ID}    ${NGCSC9_token}
    Collections.List Should Not Contain Value    ${all_contractId_records_new_external}    ${Random Contract ID}
    ngcscCommonMethods.Send Message    customer_master    ${time_in_pst}    0201034504    D    Has Asset Secondary Account    0100850943
    ...    ${date_in_pst}    ${msgRcdTs}    ZBUR10
    BuiltIn.Sleep    60s
    ${all_accounts_json}    Common.Get All Accounts API    contracts    ${NGCSC9_token}
    ${all_accounts}    Collections.Get From Dictionary    ${all_accounts_json}    accountsList
    ${accountIds}    Common.Getting serial Number from records    ${all_accounts}    accountId
    Collections.List Should Not Contain Value    ${accountIds}    ${accountIds}    ${Account ID}

Contract ID having Service Contact relationship
    [Tags]    contract
    ${time_in_pst}    ngcscCommonMethods.current time for customer master
    ${date_in_pst}    ngcscCommonMethods.current date for customer master
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ngcscCommonMethods.Send Message    customer_master    ${time_in_pst}    0201034504    I    Has Service Contact    0100510467
    ...    ${date_in_pst}    ${msgRcdTs}    ZBUR02
    BuiltIn.Sleep    60s
    ${epoch_time_in_pst}    ngcscCommonMethods.epoch max time in pst
    ${current_Date}    DateTime.Get Current Date
    ${header_end_date}    DateTime.Add Time To Date    ${current_Date}    10 days
    ${header_end_date}    DateTime.Convert Date    ${header_end_date}    result_format=%Y%m%d%H%M%S    date_format=%Y-%m-%d %H:%M:%S.%f
    ${contractID}    ngcscCommonMethods.random with N digits    7
    ${Random Contract ID}    BuiltIn.Catenate    SEPARATOR=    006    ${contractID}
    ngcscCommonMethods.Send Message    contracts    ${header_end_date}    ${msgRcdTs}    Active    0100510467    ZRE00001
    ...    Primary Reseller    ${Random Contract ID}    ${header_start_date}
    BuiltIn.Sleep    60s
    ${all_contractId_records_stage}    Common.Contract Line Item    ${MyJuniper_Segregated_IP}    ${Contract Line Item API}    contractItemsList    ${Random Contract ID}    ${NGCSC9_token}
    Collections.List Should Not Contain Value    ${all_contractId_records_stage}    ${Random Contract ID}
    ${all_contractId_records_external}    Common.Contract Line Item    ${External URl}    ${External Contract Details API}    productsInContract    ${Random Contract ID}    ${NGCSC9_token}
    Collections.List Should Not Contain Value    ${all_contractId_records_external}    ${Random Contract ID}
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ngcscCommonMethods.Send Message    contracts    ${header_end_date}    ${msgRcdTs}    Active    0100498380    ZRE00001
    ...    Primary Reseller    ${Random Contract ID}    ${header_start_date}
    BuiltIn.Sleep    60s
    ${all_contractId_records_new_stage}    Common.Contract Line Item    ${MyJuniper_Segregated_IP}    ${Contract Line Item API}    contractItemsList    ${Random Contract ID}    ${NGCSC9_token}
    Collections.List Should Not Contain Value    ${all_contractId_records_new_stage}    ${Random Contract ID}
    ${all_contractId_records_new_external}    Common.Contract Line Item    ${External URl}    ${External Contract Details API}    productsInContract    ${Random Contract ID}    ${NGCSC9_token}
    Collections.List Should Not Contain Value    ${all_contractId_records_new_external}    ${Random Contract ID}
    ngcscCommonMethods.Send Message    customer_master    ${time_in_pst}    0201034504    D    Has Service Contact    0100510467
    ...    ${date_in_pst}    ${msgRcdTs}    ZBUR02
    BuiltIn.Sleep    60s
    ${all_accounts_json}    Common.Get All Accounts API    contracts    ${NGCSC9_token}
    ${all_accounts}    Collections.Get From Dictionary    ${all_accounts_json}    accountsList
    ${accountIds}    Common.Getting serial Number from records    ${all_accounts}    accountId
    Collections.List Should Not Contain Value    ${accountIds}    ${accountIds}    ${Account ID}

UserTypeVerification_EndUser
    ${time_in_pst}    ngcscCommonMethods.current time for customer master
    ${date_in_pst}    ngcscCommonMethods.current date for customer master
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ngcscCommonMethods.Send Message    customer_master    ${time_in_pst}    0201034725    I    Has Asset Primary Account    0100457997
    ...    ${date_in_pst}    ${msgRcdTs}    ZBUR09
    BuiltIn.Sleep    60s
    ${epoch_time_in_pst}    ngcscCommonMethods.epoch max time in pst
    ${current_Date}    DateTime.Get Current Date
    ${header_end_date}    DateTime.Convert Date    ${current_Date}    result_format=%Y%m%d%H%M    date_format=%Y-%m-%d %H:%M:%S.%f
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ngcscCommonMethods.Send Message    access_group    ${header_end_date}    ${Account Id for User Type}    ${Access group For User type}    I    ${msgRcdTs}
    BuiltIn.Sleep    60s
    ${epoch_time_in_pst}    ngcscCommonMethods.epoch max time in pst
    ${current_Date}    DateTime.Get Current Date
    ${headerEndDate}    DateTime.Subtract Time From Date    ${current_Date}    10 days
    ${headerEndDate}    DateTime.Convert Date    ${headerEndDate}    result_format=%Y%m%d%H%M    date_format=%Y-%m-%d %H:%M:%S.%f
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ngcscCommonMethods.Send Message    contracts    ${header_end_date}    ${msgRcdTs}    Active    0100457997    ZRE00001
    ...    Primary Reseller    ${header_start_date}
    BuiltIn.Sleep    60s
    ${all_contractId_records_stage}    Common.Contract Line Item    ${MyJuniper_Segregated_IP}    ${Contracts_API}    contractsList
    Collections.List Should Contain Value    ${all_contractId_records_stage}    ${Contract ID}
    BuiltIn.Sleep    40s
    ${epoch_time_in_pst}    ngcscCommonMethods.epoch max time in pst
    ${current_Date}    DateTime.Get Current Date
    ${headerEndDate}    DateTime.Subtract Time From Date    ${current_Date}    10 days
    ${headerEndDate}    DateTime.Convert Date    ${headerEndDate}    result_format=%Y%m%d%H%M    date_format=%Y-%m-%d %H:%M:%S.%f
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ngcscCommonMethods.Send Message    contractsdifferentid    ${headerEndDate}    ${msgRcdTs}    Active    0100000028    ZRE00001
    ...    Primary Reseller    ${header_start_date}
    BuiltIn.Sleep    60s
    ${all_contractId_records_stage}    Common.Contract Line Item    ${MyJuniper_Segregated_IP}    ${Contracts_API}    contractsList
    Collections.List Should Not Contain Value    ${all_contractId_records_stage}    ${Contract ID}

UserTypeVerification_JPartner_Type
    ${time_in_pst}    ngcscCommonMethods.current time for customer master
    ${date_in_pst}    ngcscCommonMethods.current date for customer master
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ngcscCommonMethods.Send Message    customer_master    ${time_in_pst}    0200982868    I    Has Asset Primary Account    0100172865
    ...    ${date_in_pst}    ${msgRcdTs}    ZBUR09
    BuiltIn.Sleep    60s
    ${epoch_time_in_pst}    ngcscCommonMethods.epoch max time in pst
    ${current_Date}    DateTime.Get Current Date
    ${header_end_date}    DateTime.Convert Date    ${current_Date}    result_format=%Y%m%d%H%M    date_format=%Y-%m-%d %H:%M:%S.%f
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ngcscCommonMethods.Send Message    access_group    ${header_end_date}    0100002129    0010007227    I    ${msgRcdTs}
    BuiltIn.Sleep    60s
    ${epoch_time_in_pst}    ngcscCommonMethods.epoch max time in pst
    ${current_Date}    DateTime.Get Current Date
    ${headerEndDate}    DateTime.Subtract Time From Date    ${current_Date}    10 days
    ${headerEndDate}    DateTime.Convert Date    ${headerEndDate}    result_format=%Y%m%d%H%M    date_format=%Y-%m-%d %H:%M:%S.%f
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ngcscCommonMethods.Send Message    contracts    ${header_end_date}    ${msgRcdTs}    Active    0100172865    ZRE00001
    ...    Primary Reseller    ${header_start_date}
    BuiltIn.Sleep    60s
    ${all_contractId_records_stage}    Common.Contract Line Item    ${MyJuniper_Segregated_IP}    ${Contracts_API}    contractsList
    Collections.List Should Contain Value    ${all_contractId_records_stage}    ${Contract ID}
    BuiltIn.Sleep    40s
    ${epoch_time_in_pst}    ngcscCommonMethods.epoch max time in pst
    ${current_Date}    DateTime.Get Current Date
    ${headerEndDate}    DateTime.Subtract Time From Date    ${current_Date}    10 days
    ${headerEndDate}    DateTime.Convert Date    ${headerEndDate}    result_format=%Y%m%d%H%M    date_format=%Y-%m-%d %H:%M:%S.%f
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ngcscCommonMethods.Send Message    contractsdifferentid    ${headerEndDate}    ${msgRcdTs}    Active    0100002129    ZRE00001
    ...    Primary Reseller
    BuiltIn.Sleep    60s
    ${all_contractId_records_stage}    Common.Contract Line Item    ${MyJuniper_Segregated_IP}    ${Contracts_API}    contractsList
    Collections.List Should Contain Value    ${all_contractId_records_stage}    ${Contract ID}
