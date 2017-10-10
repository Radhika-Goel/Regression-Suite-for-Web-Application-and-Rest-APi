*** Settings ***
Library           ngcscCommonMethods
Resource          ../../Common.robot

*** Variables ***
@{Contract Items API Fields}    status    startDate    endDate    contractItemsList    totalRecords    locationAccId    locationName
...               contractId
@{ContractItems List Fields}    contractId    startDate    endDate    status    locationName    locationAccId    supportCoverage
...               serialNo    product    shipDate    warrantyExpDate    city    state    country
...               softwareSupportReferenceNumber
@{Contract Items External API Fields}    totalRecords    contractId    startDate    endDate    status    location    productsInContract
@{ProductsInContracts API Fields}    contractId    startDate    endDate    status    supportCoverage    serialNumber    product
...               shipDate    warrantyExpirationDate    softwareSupportReferenceNumber    location

*** Test Cases ***
Contract Line Items API
    ${epoch_time_in_pst}    ngcscCommonMethods.epoch max time in pst
    ${current_Date}    DateTime.Get Current Date
    ${header_start_date}    DateTime.Subtract Time From Date    ${current_Date}    7 days
    ${header_start_epoch_pst}    ngcscCommonMethods.epoch pst start slice time    ${header_start_date}
    ${header_end_epoch_pst}    ngcscCommonMethods.epoch pst end slice time    ${header_start_date}
    ${header_start_date}    DateTime.Convert Date    ${header_start_date}    result_format=%Y%m%d%H%M%S    date_format=%Y-%m-%d %H:%M:%S.%f
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
    ${restIp}    String.Replace String    ${MyJuniper_Segregated_IP}/api1    api1    api/contract-manager/contracts
    ${params}    BuiltIn.Set Variable    {"contractId":"${Random Contract ID}"}
    ${params}    json.Loads    ${params}
    log    ${params}
    ${params}    json.Dumps    ${params}
    Log    ${params}
    ${headers}    BuiltIn.Create Dictionary    Authorization=${NGCSC1_token}
    log    ${headers}
    ${headers1}    BuiltIn.Create Dictionary    'content-type'=application/json
    ${response}    requests.Post    ${restIp}    data=${params}    headers=${headers}    verify=${FALSE}
    ${api_output_json}    BuiltIn.Set Variable    ${response.json()}
    ${ContractItems Fields}    Collections.Get Dictionary Keys    ${api_output_json}
    Collections.Lists Should Be Equal    ${ContractItems Fields}    ${Contract Items API Fields}
    ${ContractItems List }    Collections.Get From Dictionary    ${ContractItems Fields}    contractItemsList
    Collections.Lists Should Be Equal    ${ContractItems List }    ${ContractItems List Fields}
    ${total_records_output}    Collections.Get From Dictionary    ${api_output_json}    totalRecords
    ${contract_records}    Collections.Get From Dictionary    ${api_output_json}    ${field}
    ${all_contractId_records}    Common.Getting serial Number from records    ${contract_records}    contractId
    ${External Contracts API}    String.Replace String    ${External API URL}/api1    api1    contract-manager/contracts
    ${response}    requests.Post    ${External Contracts API}    data=${params}    headers=${headers}    verify=${FALSE}
    ${api_output_json}    BuiltIn.Set Variable    ${response.json()}
    ${ContractItems Fields}    Collections.Get Dictionary Keys    ${api_output_json}
    Collections.Lists Should Be Equal    ${ContractItems Fields}    ${Contract Items API Fields}
    ${ContractItems List }    Collections.Get From Dictionary    ${ContractItems Fields}    contractItemsList
    Collections.Lists Should Be Equal    ${ContractItems List }    ${ContractItems List Fields}
    ${total_records_output}    Collections.Get From Dictionary    ${api_output_json}    totalRecords
    ${contract_records}    Collections.Get From Dictionary    ${api_output_json}    ${field}
    ${all_contractId_records}    Common.Getting serial Number from records    ${contract_records}    contractId
