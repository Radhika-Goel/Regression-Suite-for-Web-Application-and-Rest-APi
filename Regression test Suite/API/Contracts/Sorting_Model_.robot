*** Settings ***
Library           ngcscCommonMethods
Resource          ../../Common.robot

*** Variables ***
@{EndCustomer_keys}    accountId    accountName    uuid
@{Contract List Fields}    city    contractId    contractType    country    endDate    hasLineItems    locationAccId
...               locationName    primaryKey    product    serialNo    shipDate    softwareSupportReferenceNumber    startDate
...               state    status    supportCoverage    warrantyExpDate
@{Contract Fields for External API}    contractId    endDate    hasLineItems    location    primaryKey    product    serialNumber
...               shipDate    softwareSupportReferenceNumber    startDate    status    supportCoverage    warrantyExpirationDate

*** Test Cases ***
Contract ID Sorting
    ${Contract Start Date Filter}    BuiltIn.Set Variable    {"pageItems":50,"paginatingForward":true,"sortModel":{"field":"contractId","sort":"asc"},"filterModel":[{"status":{"type":"1","filter":["Active"],"fieldCase":"UPPER"}}],"firstRecord":null,"lastRecord":null,"searchBy":"user","searchFor":"Headers"}
    ${Contracts API}    String.Replace String    ${MyJuniper_Segregated_IP}/api1    api1    api/contract-manager/contracts
    ${contract_details}    Common.Executing API    ${Contracts API}    ${Contract Start Date Filter}    ${Vidhya_Token}
    Log    ${contract_details}
    ${total_records}    Collections.Get From Dictionary    ${contract_details}    totalRecords
    ${Contract Start Date Filter}    BuiltIn.Set Variable    {"pageItems":${totalRecords},"paginatingForward":true,"sortModel":{"field":"contractId","sort":"asc"},"filterModel":[{"status":{"type":"1","filter":["Active"],"fieldCase":"UPPER"}}],"firstRecord":null,"lastRecord":null,"searchBy":"user","searchFor":"Headers"}
    ${contract_details}    Common.Executing API    ${Contracts API}    ${Contract Start Date Filter}    ${Vidhya_Token}
    ${contract_details}    Collections.Get From Dictionary    ${contract_details}    contractsList
    ${first_record}    Collections.Get From List    ${contract_details}    0
    ${contract_details_keys}    Collections.Get Dictionary Keys    ${first_record}
    Log    ${contract_details}
    Lists Should Be Equal    ${Contract List Fields}    ${contract_details_keys}
    ${Contract_ID_List}    BuiltIn.Create List
    ${total_records}    BuiltIn.Set Variable    10
    : FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${contract_details}    ${i}
    \    ${contractID_value}    Collections.Get From Dictionary    ${record}    contractId
    \    Collections.Append To List    ${Contract_ID_List}    ${contractID_value}
    ${original_contract_Ids}    Collections.Copy List    ${Contract_ID_List}
    Log    ${original_contract_Ids}
    Comment    Collections.Sort List    ${Contract_ID_List}
    Comment    Collections.Lists Should Be Equal    ${Contract_ID_List}    ${original_contract_Ids}
    Comment    ${External Contracts API}    String.Replace String    ${External API URL}/api1    api1    contract-manager/contracts
    Comment    ${contract_details}    Common.Executing API    ${External Contracts API}    ${Contract Start Date Filter}    ${Vidhya_Token}
    Comment    ${contract_details}    Collections.Get From Dictionary    ${contract_details}    contracts
    Comment    ${first_record}    Collections.Get From List    ${contract_details}    0
    Comment    ${contract_details_keys}    Collections.Get Dictionary Keys    ${first_record}
    Comment    Log    ${contract_details}
    Comment    Lists Should Be Equal    ${Contract Fields for External API}    ${contract_details_keys}
    Comment    ${City_Values_List_External}    BuiltIn.Create List
    Comment    :FOR    ${i}    IN RANGE    ${total_records}
    Comment    \    ${record}    Collections.Get From List    ${contract_details}    ${i}
    Comment    \    ${city_value}    Collections.Get From Dictionary    ${record}    city
    Comment    \    Collections.Append To List    ${City_Values_List_External}    ${city_value}
    Comment    Collections.Remove Duplicates    ${City_Values_List_External}
    Comment    Collections.List Should Contain Value    ${City_Values_List_External}    SHINAGAWA-KU
