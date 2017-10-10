*** Settings ***
Resource          ../Common.robot
Resource          ../Variables.txt

*** Variables ***
${Search by Accounts and Case ID}    {"pageItems":50,"paginatingForward":true,"sortModel":{"field":"serviceRequestId","sort":"desc"},"filterModel":[{"status":{"type":"1","filter":["Assigned","Awaiting Customer","Dispatch","In Process","Pending Closure","Submitted","Pending Approval"],"fieldCase":"UPPER"}},{"caseType":{"type":"1","filter":["Technical Service Request","Admin Service Request"],"fieldCase":"UPPER"}},{"serviceRequestId":{"type":"1","filter":["2017-0712-T-0959"],"fieldCase":"UPPER"}}],"accountIds":["75bc2d4a-5b40-11e6-946f-005056a947e8","3e1e296d-2681-11e7-a983-005056a947e8","e1f62c60-5b40-11e6-885b-005056a96047","bcfd4c9a-5b40-11e6-9cb3-005056a91276","2f7418f6-182a-11e7-a343-005056a947e8"],"firstRecord":null,"lastRecord":null,"searchBy":"accounts"}
${Search By User}    { \ \ "searchBy": "user", \ \ "sortModel": { \ \ \ \ "field": "lastModifiedDate", \ \ \ \ "sort": "asc" \ \ } }
${Search By headers Contracts}    { \ "searchFor" : "headers", \ "filterModel": [ \ \ { \ \ \ "status": { \ \ \ "type": "1", \ \ \ "filter": [ \ \ \ \ "Expired" \ \ \ \ ] \ \ \ } \ \ } \ ], \ "pageItems":2 }
${External API URL}    https://devapigateway.sndbx.junipercloud.net/myjuniper/api/v1.0
@{Cases Keys}     serviceRequestId    caseType    caseTypeDescription    priorityKey    priority    createDate    lastModifiedDate
...               closedDate    createDateMillis    lastModifiedDateMillis    closedDateMillis    productSeries    platform    description
...               synopsis    status    statusKey    reason    release    reporter    routerName
...               accountId    serialNumber    customerCaseNumber    relatedContent    accountName    softwareSupportReferenceNumber
${Filtering Contracts by Active}    {"filterModel":[{"status":{"type":"1","filter" :["Active"]    }}] } \ \ \ \
${Sample for Logic AND}    {"filterModel": [{"status": {"type": "1","filter": ["Closed"]}},{"priority": {"type": "1","filter": ["P2"]}}]}
${Filter type 2 for Products}    {"filterModel": [{"productName": {"type": "2","filter": ["QFX-JSL-EDGE-ADV1", "MPC-3D-16XGE-SFPP"]}}] }
${Filter Type 3 for products}    { \ "filterModel": [{ \ \ "productName": { \ \ \ "type": "3", \ \ \ "filter": [ \ \ \ \ "SH" \ \ \ ] \ \ } \ }] }
${Contracts Expired Filter}    { \ "searchFor" : "headers", \ "filterModel": [ \ \ { \ \ \ "status": { \ \ \ "type": "1", \ \ \ "filter": [ \ \ \ \ "Expired" \ \ \ \ ] \ \ \ } \ \ } \ ], \ "pageItems":2 }
@{Contract Fields}    contractId    endDate    hasLineItems    location    primaryKey    product    serialNumber
...               shipDate    softwareSupportReferenceNumber    startDate    status    supportCoverage    warrantyExpirationDate
${Contract Details}    { \ \ "contractId": "0060092216" }
${products Filter for Partner Function}    { \ \ \ "sortModel":{ \ \ \ \ \ \ "field":"installedAt", \ \ \ \ \ \ "sort":"asc" \ \ \ }, \ \ \ "pageItems":2 }
@{Products keys}    assemblyHardwareRev    assemblyNumber    assemblyRev    contract    distributor    distributorAccountId    endOfLifeDate
...               endOfServiceDate    endUserAccountId    endUserAccountName    hasChildComponents    ibStatus    installedAt    isIbParent
...               materialItemCategory    parentSerialNumber    primaryKey    productName    productRegistrationDate    reseller    resellerAccountId
...               salesOrderLineItem    salesOrderNumber    serialNumber    serviceDeclined    shipDate    softwareSupportReferenceNumber    warrantyExpirationDate
...               warrantyStartDate    warrantyType
${Product Components}    { \ \ "serialNumber": "0132052013000477" }
@{Product Components Keys}    assemblyHardwareRev    assemblyNumber    assemblyRev    contract    distributor    distributorAccountId    endOfLifeDate
...               endOfServiceDate    endUserAccountId    endUserAccountName    installedAt    materialItemCategory    productName    productRegistrationDate
...               reseller    resellerAccountId    salesOrderLineItem    salesOrderNumber    serialNumber    serviceDeclined    shipDate
...               softwareSupportReferenceNumber    warrantyExpirationDate    warrantyStartDate    warrantyType
${User Token}     { \ \ "userId": " ngcsc1@ngcsc.33mail.com", \ \ "password": "juniper" }
@{User Token keys}    accessToken    expiresIn
@{User Accounts keys}    accountId    accountName
${Filter Type 4 for Products}    { \ "filterModel": [{ \ \ "productName": { \ \ \ "type": "4", \ \ \ "filter": [ \ \ \ \ "MX" \ \ \ ] \ \ } \ }] }
${Filter Type 11}    { \ "filterModel": [{ \ \ "productRegistrationDate": { \ \ \ "type": "11", \ \ \ "filter": [ \ \ \ \ "1457955808000" \ \ \ ] \ \ } \ }] }
${Filter Type 12}    { \ "filterModel": [{ \ \ "productRegistrationDate": { \ \ \ "type": "12", \ \ \ "filter": [ \ \ \ \ "1457955808000" \ \ \ ] \ \ } \ }] }
${Contracts Filter End Customer}    {"pageItems":50,"paginatingForward":true,"sortModel":{"field":"endDate","sort":"asc"},"filterModel":[{"status":{"type":"2","locationAccId":["0100498380"],"fieldCase":"UPPER"}},"fieldCase":"UPPER"}}],"firstRecord":null,"lastRecord":null,"searchFor":"Headers"}
${Create Date Time Filter}    {"pageItems":50,"paginatingForward":true,"sortModel":{"field":"srId","sort":"desc"},"filterModel":[{"status":{"type":"1","filter":["Assigned","Awaiting Customer","Dispatch","In Process","Pending Closure","Submitted","Pending Approval"],"fieldCase":"UPPER"}},{"caseType":{"type":"1","filter":["Technical Service Request","Admin Service Request","ASC Service Request"],"fieldCase":"UPPER"}},{"createDateMillis":{"type":"13","filter":["1504117800000 AND 1504204199000"]}}],"accountIds":["75bc2d4a-5b40-11e6-946f-005056a947e8","3e1e296d-2681-11e7-a983-005056a947e8","e1f62c60-5b40-11e6-885b-005056a96047","bcfd4c9a-5b40-11e6-9cb3-005056a91276","d1faae52-5b40-11e6-803c-005056a94c48","2f7418f6-182a-11e7-a343-005056a947e8"],"firstRecord":null,"lastRecord":null,"searchBy":"accounts"}

*** Test Cases ***
Cases
    ${External Cases API}    String.Replace String    ${External API URL}/api1    api1    case-manager/cases
    Comment    ${External \ Cases API}    Set Variable    https://devapigateway.sndbx.junipercloud.net/myjuniper/api/v1.0/case-manager/cases
    ${params}    Set Variable    { \ \ \ "sortModel":{ \ \ \ \ \ \ "field":"serviceRequestId", \ \ \ \ \ \ "sort":"asc" \ \ \ }, \ \ \ "pageItems":2 }
    ${case_details}    Common.Executing API    ${External Cases API}    ${Search By User}    ${NGCSC9_token}
    Log    ${case_details}
    ${case_details}    Collections.Get From Dictionary    ${case_details}    cases
    ${first_record}    Collections.Get From List    ${case_details}    0
    ${cases_keys}    Collections.Get Dictionary Keys    ${first_record}
    Log    ${cases_keys}
    Lists Should Be Equal    ${cases_keys}    ${Cases Keys}

Contracts Fields Verification
    ${External Contracts API}    String.Replace String    ${External API URL}/api1    api1    contract-manager/contracts
    Comment    ${External \ Cases API}    Set Variable    https://devapigateway.sndbx.junipercloud.net/myjuniper/api/v1.0/case-manager/cases
    ${contract_details}    Common.Executing API    ${External Contracts API}    ${Contracts Expired Filter}    ${NGCSC9_token}
    Log    ${contract_details}
    ${contract_details}    Collections.Get From Dictionary    ${contract_details}    contracts
    ${first_record}    Collections.Get From List    ${contract_details}    0
    ${contract_details}    Collections.Get Dictionary Keys    ${first_record}
    Log    ${contract_details}
    Lists Should Be Equal    ${contract_details}    ${Contract Fields}

Contracts Active Filter
    [Tags]
    ${External Contracts API}    String.Replace String    ${External API URL}/api1    api1    contract-manager/contracts
    Comment    ${External \ Cases API}    Set Variable    https://devapigateway.sndbx.junipercloud.net/myjuniper/api/v1.0/case-manager/cases
    ${contract_details}    Common.Executing API    ${External Contracts API}    ${Filtering Contracts by Active}    ${NGCSC1_token}
    Log    ${contract_details}
    ${total_records}    Collections.Get From Dictionary    ${contract_details}    totalRecords
    ${contract_details}    Common.Executing API    ${External Contracts API}    ${Filtering Contracts by Active}    ${NGCSC1_token}
    ${contract_records}    Collections.Get From Dictionary    ${contract_details}    contracts
    ${first_record}    Collections.Get From List    ${contract_records}    0
    Comment    ${cases_keys}    Collections.Get Dictionary Keys    ${first_record}
    ${Status_value_list}    BuiltIn.Create List
    Log    ${first_record}
    : FOR    ${i}    IN RANGE    ${total_records}
    \    Exit For Loop If    '${i}' == '10'
    \    ${record}    Collections.Get From List    ${contract_records}    ${i}
    \    ${status_value}    Collections.Get From Dictionary    ${record}    status
    \    Collections.Append To List    ${Status_value_list}    ${status_value}
    ${Status_value_list}    Collections.Remove Duplicates    ${Status_value_list}
    Collections.List Should Not Contain Value    ${Status_value_list}    "Expired"

Contract Details
    [Tags]    end
    ${External Contracts API}    String.Replace String    ${External API URL}/api1    api1    contract-manager/contractDetails
    ${contract_details}    Common.Executing API    ${External Contracts API}    ${Contract Details}    ${NGCSC9_token}
    Log    ${contract_details}
    ${contract_details}    Collections.Get From Dictionary    ${contract_details}    productsInContract
    Log    ${contract_details}
    Comment    ${first_record}    Collections.Get From List    ${contract_details}    0
    Comment    ${cases_keys}    Collections.Get Dictionary Keys    ${first_record}
    Comment    Log    ${cases_keys}
    Comment    Lists Should Be Equal    ${cases_keys}    ${Cases Keys}
    ${total_records}    BuiltIn.Get Length    ${contract_details}
    ${contract Id Records}    BuiltIn.Create List
    : FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${contract_details}    ${i}
    \    ${contract ID }    Collections.Get From Dictionary    ${record}    contractId
    \    Collections.Append To List    ${contract Id Records}    ${contract ID }
    Collections.Remove Duplicates    ${contract Id Records}
    Collections.List Should Contain Value    ${contract Id Records}    0060092216

Products
    ${External Products API}    String.Replace String    ${External API URL}/api1    api1    ibase-manager/products
    ${product records}    Common.Executing API    ${External Products API}    ${products Filter for Partner Function}    ${NGCSC9_token}
    Log    ${product records}
    ${product records}    Collections.Get From Dictionary    ${product records}    products
    ${first_record}    Collections.Get From List    ${product records}    0
    ${product_details}    Collections.Get Dictionary Keys    ${first_record}
    Log    ${product_details}
    Lists Should Be Equal    ${product_details}    ${Products keys}

product Components
    ${External Products API}    String.Replace String    ${External API URL}/api1    api1    ibase-manager/productComponents
    ${product records}    Common.Executing API    ${External Products API}    ${Product Components}    ${NGCSC9_token}
    Log    ${product records}
    ${product records}    Collections.Get From Dictionary    ${product records}    productComponents
    ${first_record}    Collections.Get From List    ${product records}    0
    ${product_details}    Collections.Get Dictionary Keys    ${first_record}
    Log    ${product_details}
    Lists Should Be Equal    ${product_details}    ${Product Components Keys}

User Manager Token
    ${External User manager API}    String.Replace String    ${External API URL}/api1    api1    user-manager/token
    ${user_token}    Common.Executing API    ${External User manager API}    ${User Token}    ${NGCSC9_token}
    Log    ${user_token}
    ${user_token_keys_record}    Collections.Get Dictionary Keys    ${user_token}
    Lists Should Be Equal    ${user_token_keys_record}    ${User Token keys}

User manager Accounts By Entity
    ${External User manager API}    String.Replace String    ${External API URL}/api1    api1    user-manager/accountsByEntity
    ${params}    Set Variable    { \ \ "entity": "Cases" }
    ${user_accounts}    Common.Executing API    ${External User manager API}    ${params}    ${NGCSC9_token}
    Log    ${user_accounts}
    ${account_records}    Collections.Get From Dictionary    ${user_accounts}    accountsList
    ${first_record}    Collections.Get From List    ${account_records}    0
    ${accounts_entity_keys}    Collections.Get Dictionary Keys    ${first_record}
    log    ${accounts_entity_keys}
    Collections.Lists Should Be Equal    ${accounts_entity_keys}    ${User Accounts keys}

Cases Create Date Filter
    ${External Cases API}    String.Replace String    ${External API URL}/api1    api1    case-manager/cases
    Comment    ${External \ Cases API}    Set Variable    https://devapigateway.sndbx.junipercloud.net/myjuniper/api/v1.0/case-manager/cases
    ${cases_details}    Common.Executing API    ${External Cases API}    ${Create Date Time Filter}    ${NGCSC1_token}
    ${total_records}    Collections.Get From Dictionary    ${cases_details}    totalRecords
    ${Create Date Time Filter}    Set Variable    {"pageItems":${total_records},"paginatingForward":true,"sortModel":{"field":"srId","sort":"desc"},"filterModel":[{"status":{"type":"1","filter":["Assigned","Awaiting Customer","Dispatch","In Process","Pending Closure","Submitted","Pending Approval"],"fieldCase":"UPPER"}},{"caseType":{"type":"1","filter":["Technical Service Request","Admin Service Request","ASC Service Request"],"fieldCase":"UPPER"}},{"createDateMillis":{"type":"13","filter":["1504117800000 AND 1504204199000"]}}],"accountIds":["75bc2d4a-5b40-11e6-946f-005056a947e8","3e1e296d-2681-11e7-a983-005056a947e8","e1f62c60-5b40-11e6-885b-005056a96047","bcfd4c9a-5b40-11e6-9cb3-005056a91276","d1faae52-5b40-11e6-803c-005056a94c48","2f7418f6-182a-11e7-a343-005056a947e8"],"firstRecord":null,"lastRecord":null,"searchBy":"accounts"}
    ${cases_details}    Common.Executing API    ${External Cases API}    ${Create Date Time Filter}    ${NGCSC1_token}
    Log    ${cases_details}
    ${cases_records}    Collections.Get From Dictionary    ${cases_details}    cases
    ${first_record}    Collections.Get From List    ${cases_records}    0
    ${createDate_Millis}    BuiltIn.Create List
    Log    ${cases_records}
    ${total_records}    Get Length    ${cases_records}
    : FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${cases_records}    ${i}
    \    ${createDate_value}    Collections.Get From Dictionary    ${record}    createDateMillis
    \    ${value}    Evaluate    1504117800000 < ${createDate_value} < 1504204199000
    \    BuiltIn.Should Be Equal    ${value}    ${True}

Cases LastModified Date Filter
    ${External Cases API}    String.Replace String    ${External API URL}/api1    api1    case-manager/cases
    Comment    ${External \ Cases API}    Set Variable    https://devapigateway.sndbx.junipercloud.net/myjuniper/api/v1.0/case-manager/cases
    ${Last Modified Date Filter}    BuiltIn.Set Variable    {"pageItems":50,"paginatingForward":true,"sortModel":{"field":"srId","sort":"desc"},"filterModel":[{"statusReason":{"type":"2","filter":["Open Cases Awaiting Customer Input"],"fieldCase":"UPPER"}},{"caseType":{"type":"1","filter":["Technical Service Request","Admin Service Request","ASC Service Request"],"fieldCase":"UPPER"}},{"lastModifiedDateMillis":{"type":"13","filter":["1504549800000 AND 1504636199000"]}}],"accountIds":["75bc2d4a-5b40-11e6-946f-005056a947e8","3e1e296d-2681-11e7-a983-005056a947e8","e1f62c60-5b40-11e6-885b-005056a96047","bcfd4c9a-5b40-11e6-9cb3-005056a91276","d1faae52-5b40-11e6-803c-005056a94c48","2f7418f6-182a-11e7-a343-005056a947e8"],"firstRecord":null,"lastRecord":null,"searchBy":"accounts"}
    ${cases_details}    Common.Executing API    ${External Cases API}    ${Last Modified Date Filter}    ${NGCSC1_token}
    ${total_records}    Collections.Get From Dictionary    ${cases_details}    totalRecords
    ${Last Modified Date Filter}    Set Variable    {"pageItems":${total_records},"paginatingForward":true,"sortModel":{"field":"srId","sort":"desc"},"filterModel":[{"statusReason":{"type":"2","filter":["Open Cases Awaiting Customer Input"],"fieldCase":"UPPER"}},{"caseType":{"type":"1","filter":["Technical Service Request","Admin Service Request","ASC Service Request"],"fieldCase":"UPPER"}},{"lastModifiedDateMillis":{"type":"13","filter":["1504549800000 AND 1504636199000"]}}],"accountIds":["75bc2d4a-5b40-11e6-946f-005056a947e8","3e1e296d-2681-11e7-a983-005056a947e8","e1f62c60-5b40-11e6-885b-005056a96047","bcfd4c9a-5b40-11e6-9cb3-005056a91276","d1faae52-5b40-11e6-803c-005056a94c48","2f7418f6-182a-11e7-a343-005056a947e8"],"firstRecord":null,"lastRecord":null,"searchBy":"accounts"}
    ${cases_details}    Common.Executing API    ${External Cases API}    ${Last Modified Date Filter}    ${NGCSC1_token}
    Log    ${cases_details}
    ${cases_records}    Collections.Get From Dictionary    ${cases_details}    cases
    ${first_record}    Collections.Get From List    ${cases_records}    0
    Log    ${cases_records}
    ${total_records}    Get Length    ${cases_records}
    : FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${cases_records}    ${i}
    \    ${lastModifiedDate_value}    Collections.Get From Dictionary    ${record}    lastModifiedDateMillis
    \    ${value}    Evaluate    1504549800000 < ${lastModifiedDate_value} < 1504636199000
    \    BuiltIn.Should Be Equal    ${value}    ${True}

Cases API for Logical AND
    [Tags]    external
    ${External Cases API}    String.Replace String    ${External API URL}/api1    api1    case-manager/cases
    Comment    ${External \ Cases API}    Set Variable    https://devapigateway.sndbx.junipercloud.net/myjuniper/api/v1.0/case-manager/cases
    ${cases_details}    Common.Executing API    ${External Cases API}    ${Sample for Logic AND}    ${NGCSC1_token}
    Log    ${cases_details}
    ${total_records}    Collections.Get From Dictionary    ${cases_details}    totalRecords
    ${cases_records}    Collections.Get From Dictionary    ${cases_details}    cases
    ${first_record}    Collections.Get From List    ${cases_records}    0
    ${Status_value_list}    BuiltIn.Create List
    ${priority_list}    BuiltIn.Create List
    Log    ${first_record}
    : FOR    ${i}    IN RANGE    ${total_records}
    \    Exit For Loop If    '${i}' == '10'
    \    ${record}    Collections.Get From List    ${cases_records}    ${i}
    \    ${status_value}    Collections.Get From Dictionary    ${record}    status
    \    ${priority_value}    Collections.Get From Dictionary    ${record}    priorityKey
    \    Collections.Append To List    ${Status_value_list}    ${status_value}
    \    Collections.Append To List    ${priority_list}    ${priority_value}
    ${Status_value_list}    Collections.Remove Duplicates    ${Status_value_list}
    Collections.List Should Not Contain Value    ${Status_value_list}    "Expired"
    ${priority_list}    Collections.Remove Duplicates    ${priority_list}
    Collections.List Should Contain Value    ${priority_list}    02

Products API for Filter Type 2
    [Tags]    external
    ${External Products API}    String.Replace String    ${External API URL}/api1    api1    ibase-manager/products
    Comment    ${External \ Cases API}    Set Variable    https://devapigateway.sndbx.junipercloud.net/myjuniper/api/v1.0/case-manager/cases
    ${product_details}    Common.Executing API    ${External Products API}    ${Filter type 2 for Products}    ${NGCSC1_token}
    Log    ${product_details}
    ${total_records}    Collections.Get From Dictionary    ${product_details}    totalRecords
    ${product_records}    Collections.Get From Dictionary    ${product_details}    products
    ${first_record}    Collections.Get From List    ${product_records}    0
    ${product_value_list}    BuiltIn.Create List
    Log    ${first_record}
    : FOR    ${i}    IN RANGE    ${total_records}
    \    Exit For Loop If    '${i}' == '10'
    \    ${record}    Collections.Get From List    ${product_records}    ${i}
    \    ${product_value}    Collections.Get From Dictionary    ${record}    productName
    \    Collections.Append To List    ${product_value_list}    ${product_value}
    ${product_value_list}    Collections.Remove Duplicates    ${product_value_list}
    Collections.List Should Contain Value    ${product_value_list}    QFX-JSL-EDGE-ADV1

Products API for Filter Type 3
    [Tags]    external
    ${External Products API}    String.Replace String    ${External API URL}/api1    api1    ibase-manager/products
    Comment    ${External \ Cases API}    Set Variable    https://devapigateway.sndbx.junipercloud.net/myjuniper/api/v1.0/case-manager/cases
    ${product_details}    Common.Executing API    ${External Products API}    ${Filter Type 3 for products}    ${NGCSC1_token}
    Log    ${product_details}
    ${total_records}    Collections.Get From Dictionary    ${product_details}    totalRecords
    ${product_records}    Collections.Get From Dictionary    ${product_details}    products
    ${first_record}    Collections.Get From List    ${product_records}    0
    ${product_value_list}    BuiltIn.Create List
    Log    ${first_record}
    : FOR    ${i}    IN RANGE    ${total_records}
    \    Exit For Loop If    '${i}' == '10'
    \    ${record}    Collections.Get From List    ${product_records}    ${i}
    \    ${product_value}    Collections.Get From Dictionary    ${record}    productName
    \    Collections.Append To List    ${product_value_list}    ${product_value}
    ${product_value_list}    Collections.Remove Duplicates    ${product_value_list}
    ${total_records}    BuiltIn.Get Length    ${product_value_list}
    ${product_filter_values}    BuiltIn.Create List
    : FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${product_value_list}    ${i}
    \    @{characters}=    String.Split String To Characters    ${record}
    \    ${first}    Collections.Get From List    ${characters}    -1
    \    ${last}    Collections.Get From List    ${characters}    -2
    \    ${last two values}    Catenate    SEPARATOR=    ${last}    ${first}
    \    Collections.Append To List    ${product_filter_values}    ${last two values}
    ${product_filter_values}    Collections.Remove Duplicates    ${product_filter_values}
    Collections.List Should Contain Value    ${product_filter_values}    SH

Products API for Filter Type 4
    ${External Products API}    String.Replace String    ${External API URL}/api1    api1    ibase-manager/products
    Comment    ${External \ Cases API}    Set Variable    https://devapigateway.sndbx.junipercloud.net/myjuniper/api/v1.0/case-manager/cases
    ${product_details}    Common.Executing API    ${External Products API}    ${Filter Type 4 for Products}    ${NGCSC1_token}
    Log    ${product_details}
    ${total_records}    Collections.Get From Dictionary    ${product_details}    totalRecords
    ${product_records}    Collections.Get From Dictionary    ${product_details}    products
    ${first_record}    Collections.Get From List    ${product_records}    0
    ${product_value_list}    BuiltIn.Create List
    Log    ${first_record}
    : FOR    ${i}    IN RANGE    ${total_records}
    \    Exit For Loop If    '${i}' == '10'
    \    ${record}    Collections.Get From List    ${product_records}    ${i}
    \    ${product_value}    Collections.Get From Dictionary    ${record}    productName
    \    Collections.Append To List    ${product_value_list}    ${product_value}
    ${product_value_list}    Collections.Remove Duplicates    ${product_value_list}
    ${total_records}    BuiltIn.Get Length    ${product_value_list}
    ${product_filter_values}    BuiltIn.Create List
    : FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${product_value_list}    ${i}
    \    @{characters}=    String.Split String To Characters    ${record}
    \    ${first}    Collections.Get From List    ${characters}    0
    \    ${last}    Collections.Get From List    ${characters}    1
    \    ${last two values}    Catenate    SEPARATOR=    ${first}    ${last}
    \    Collections.Append To List    ${product_filter_values}    ${last two values}
    ${product_filter_values}    Collections.Remove Duplicates    ${product_filter_values}
    Collections.List Should Contain Value    ${product_filter_values}    MX

Products API for Filter Type 11
    [Tags]
    ${External Products API}    String.Replace String    ${External API URL}/api1    api1    ibase-manager/products
    ${product_details}    Common.Executing API    ${External Products API}    ${Filter Type 11}    ${NGCSC1_token}
    Log    ${product_details}
    ${total_records}    Collections.Get From Dictionary    ${product_details}    totalRecords
    ${product_records}    Collections.Get From Dictionary    ${product_details}    products
    ${first_record}    Collections.Get From List    ${product_records}    0
    ${product_value_list}    BuiltIn.Create List
    Log    ${first_record}
    : FOR    ${i}    IN RANGE    ${total_records}
    \    Exit For Loop If    '${i}' == '10'
    \    ${record}    Collections.Get From List    ${product_records}    ${i}
    \    ${product_value}    Collections.Get From Dictionary    ${record}    productRegistrationDate
    \    Collections.Append To List    ${product_value_list}    ${product_value}
    Log    ${product_value_list}
    ${total_records}    BuiltIn.Get Length    ${product_value_list}
    ${product_filter_values}    BuiltIn.Create List
    : FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${product_value_list}    ${i}
    \    ${value}    Evaluate    ${record} < 1457955808000
    \    Should Be Equal    ${value}    ${True}

Products API for Filter 12
    [Tags]
    ${External Products API}    String.Replace String    ${External API URL}/api1    api1    ibase-manager/products
    ${product_details}    Common.Executing API    ${External Products API}    ${Filter Type 12}    ${NGCSC1_token}
    Log    ${product_details}
    ${total_records}    Collections.Get From Dictionary    ${product_details}    totalRecords
    ${product_records}    Collections.Get From Dictionary    ${product_details}    products
    ${first_record}    Collections.Get From List    ${product_records}    0
    ${product_value_list}    BuiltIn.Create List
    Log    ${first_record}
    : FOR    ${i}    IN RANGE    ${total_records}
    \    Exit For Loop If    '${i}' == '10'
    \    ${record}    Collections.Get From List    ${product_records}    ${i}
    \    ${product_value}    Collections.Get From Dictionary    ${record}    productRegistrationDate
    \    Collections.Append To List    ${product_value_list}    ${product_value}
    Log    ${product_value_list}
    ${total_records}    BuiltIn.Get Length    ${product_value_list}
    ${product_filter_values}    BuiltIn.Create List
    : FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${product_value_list}    ${i}
    \    ${value}    Evaluate    ${record} > 1457955808000
    \    Should Be Equal    ${value}    ${True}

Filter Type 13
    [Tags]    external1
    Comment    Filter 13 for Cases
    ${cases_filter_type_13}    Set Variable    { \ "filterModel": [{ \ "createDate": { \ \ "type": "13", \ \ "filter": ["2016-10-20 00:00:00 AND 2017-04-20 23:59:59"] \ } }] }
    ${External Cases API}    String.Replace String    ${External API URL}/api1    api1    case-manager/cases
    ${cases_details}    Common.Executing API    ${External Cases API}    ${cases_filter_type_13}    ${NGCSC1_token}
    Log    ${cases_details}
    ${total_records}    Collections.Get From Dictionary    ${cases_details}    totalRecords
    ${cases_records}    Collections.Get From Dictionary    ${cases_details}    cases
    ${cases_value_list}    BuiltIn.Create List
    : FOR    ${i}    IN RANGE    ${total_records}
    \    Exit For Loop If    '${i}' == '10'
    \    ${record}    Collections.Get From List    ${cases_records}    ${i}
    \    ${product_value}    Collections.Get From Dictionary    ${record}    createDateMillis
    \    Collections.Append To List    ${cases_value_list}    ${product_value}
    Log    ${cases_value_list}
    ${total_records}    BuiltIn.Get Length    ${cases_value_list}
    ${product_filter_values}    BuiltIn.Create List
    : FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${cases_value_list}    ${i}
    \    ${value}    Evaluate    1476921600000 < ${record} < \ 1492646400000
    \    Should Be Equal    ${value}    ${True}
    Comment    Filter type 13 for Products
    ${products_filter_type_13}    Set Variable    { \ "filterModel": [{ \ "endOfServiceDate": { \ \ "type": "13", \ \ "filter": ["1433055600000 AND 1433141999000"] \ } }] }
    ${External Products API}    String.Replace String    ${External API URL}/api1    api1    ibase-manager/products
    ${product_details}    Common.Executing API    ${External Products API}    ${products_filter_type_13}    ${NGCSC1_token}
    Log    ${product_details}
    ${total_records}    Collections.Get From Dictionary    ${product_details}    totalRecords
    ${product_records}    Collections.Get From Dictionary    ${product_details}    products
    ${product_value_list}    BuiltIn.Create List
    : FOR    ${i}    IN RANGE    ${total_records}
    \    Exit For Loop If    '${i}' == '10'
    \    ${record}    Collections.Get From List    ${product_records}    ${i}
    \    ${product_value}    Collections.Get From Dictionary    ${record}    createDateMillis
    \    Collections.Append To List    ${cases_value_list}    ${product_value}
    Log    ${cases_value_list}
    ${total_records}    BuiltIn.Get Length    ${cases_value_list}
    ${product_filter_values}    BuiltIn.Create List
    : FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${cases_value_list}    ${i}
    \    ${value}    Evaluate    1476921600000 < ${record} < \ 1492646400000
    \    Should Be Equal    ${value}    ${True}
    Comment    Contracts Filter Type 13
    ${contracts_filter_type_13}    Set Variable    { \ "filterModel": [{ \ "startDate": { \ \ "type": "13", \ \ "filter": ["1390291200000 AND 1390377599000"] \ } } ] }
    ${External Contracts API}    String.Replace String    ${External API URL}/api1    api1    contract-manager/contratcs
    ${contact_details}    Common.Executing API    ${External Contracts API}    ${contracts_filter_type_13}    ${NGCSC1_token}
    Log    ${contact_details}
    ${total_records}    Collections.Get From Dictionary    ${contact_details}    totalRecords
    ${contact_records}    Collections.Get From Dictionary    ${contact_details}    contacts
    ${contact_value_list}    BuiltIn.Create List
    : FOR    ${i}    IN RANGE    ${total_records}
    \    Exit For Loop If    '${i}' == '10'
    \    ${record}    Collections.Get From List    ${contact_records}    ${i}
    \    ${product_value}    Collections.Get From Dictionary    ${record}    createDateMillis
    \    Collections.Append To List    ${cases_value_list}    ${product_value}
    Log    ${cases_value_list}
    ${total_records}    BuiltIn.Get Length    ${cases_value_list}
    ${product_filter_values}    BuiltIn.Create List
    : FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${cases_value_list}    ${i}
    \    ${value}    Evaluate    1476921600000 < ${record} < \ 1492646400000
    \    Should Be Equal    ${value}    ${True}

Contracts API Filter for End Customer
    [Tags]    end
    ${epoch_time_in_pst}    ngcscCommonMethods.epoch max time in pst
    ${current_Date}    DateTime.Get Current Date
    ${header_end_date}    DateTime.Add Time To Date    ${current_Date}    10 days
    ${header_end_date}    DateTime.Convert Date    ${header_end_date}    result_format=%Y%m%d%H%M%S    date_format=%Y-%m-%d %H:%M:%S.%f
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ${Account ID}    Common.Setup for Getting Random Account ID    contracts    ${NGCSC1_token}
    Comment    ${Account Name}    Collections.Get From List    ${accountName}    1
    ${contractID}    ngcscCommonMethods.random with N digits    7
    ${Random Contract ID}    BuiltIn.Catenate    SEPARATOR=    006    ${contractID}
    ngcscCommonMethods.Send Message    contracts    ${header_end_date}    ${msgRcdTs}    Active    ${Account ID}    00000065
    ...    End Customer    ${Random Contract ID}
    BuiltIn.Sleep    60s
    ${Contracts Filter End Customer}    BuiltIn.Set Variable    {"pageItems":50,"paginatingForward":true,"sortModel":{"field":"contractId","sort":"asc"},"filterModel":[{"locationAccountId":{"type":"2","filter":["${Account ID}"]}}],"firstRecord":null,"lastRecord":null,"searchFor":"Headers"}
    ${External Contracts API}    String.Replace String    ${External API URL}/api1    api1    contract-manager/contracts
    ${contract_details}    Common.Executing API    ${External Contracts API}    ${Contracts Filter End Customer}    ${NGCSC1_token}
    Log    ${contract_details}
    ${total_records}    Collections.Get From Dictionary    ${contract_details}    totalRecords
    ${Contracts Filter End Customer}    BuiltIn.Set Variable    {"pageItems":${total_records},"paginatingForward":true,"sortModel":{"field":"contractId","sort":"asc"},"filterModel":[{"locationAccountId":{"type":"2","filter":["${Account ID}"]}}],"firstRecord":null,"lastRecord":null,"searchFor":"Headers"}
    ${contract_details}    Common.Executing API    ${External Contracts API}    ${Contracts Filter End Customer}    ${NGCSC1_token}
    ${contract_details}    Collections.Get From Dictionary    ${contract_details}    contracts
    ${first_record}    Collections.Get From List    ${contract_details}    0
    ${contract_details_keys}    Collections.Get Dictionary Keys    ${first_record}
    Log    ${contract_details}
    Lists Should Be Equal    ${contract_details_keys}    ${Contract Fields}
    ${end_customer_value_list}    BuiltIn.Create List
    ${ContractID_List}    BuiltIn.Create List
    Log    ${first_record}
    : FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${contract_details}    ${i}
    \    ${endCustomer_value}    Collections.Get From Dictionary    ${record}    location
    \    ${location_id}    Collections.Get From Dictionary    ${endCustomer_value}    id
    \    ${contract_ID}    Collections.Get From Dictionary    ${record}    contractId
    \    Append To List    ${end_customer_value_list}    ${location_id}
    \    Append To List    ${ContractID_List}    ${contract_ID}
    Collections.List Should Contain Value    ${ContractID_List}    ${Random Contract ID}
    Collections.Remove Duplicates    ${end_customer_value_list}
    ${account_id_value_response}    Collections.Get From List    ${end_customer_value_list}    0
    Should Be Equal    ${account_id_value_response}    ${Account ID}

Cases Create Date Sorting
    ${External Cases API}    String.Replace String    ${External API URL}/api1    api1    case-manager/cases
    Comment    ${External \ Cases API}    Set Variable    https://devapigateway.sndbx.junipercloud.net/myjuniper/api/v1.0/case-manager/cases
    ${Create Date Sorting}    Set Variable    {"pageItems":50,"paginatingForward":true,"sortModel":{"field":"createDateMillis","sort":"desc"},"filterModel":[{"statusReason":{"type":"2","filter":["Open Cases Awaiting Customer Input"],"fieldCase":"UPPER"}},{"caseType":{"type":"1","filter":["Technical Service Request","Admin Service Request","ASC Service Request"],"fieldCase":"UPPER"}},{"lastModifiedDateMillis":{"type":"13","filter":["1504549800000 AND 1504636199000"]}}],"accountIds":["75bc2d4a-5b40-11e6-946f-005056a947e8","3e1e296d-2681-11e7-a983-005056a947e8","e1f62c60-5b40-11e6-885b-005056a96047","bcfd4c9a-5b40-11e6-9cb3-005056a91276","d1faae52-5b40-11e6-803c-005056a94c48","2f7418f6-182a-11e7-a343-005056a947e8"],"firstRecord":null,"lastRecord":null,"searchBy":"accounts"}
    ${cases_details}    Common.Executing API    ${External Cases API}    ${Create Date Sorting}    ${NGCSC1_token}
    ${total_records}    Collections.Get From Dictionary    ${cases_details}    totalRecords
    ${Create Date Sorting}    Set Variable    {"pageItems":${total_records},"paginatingForward":true,"sortModel":{"field":"createDateMillis","sort":"desc"},"filterModel":[{"statusReason":{"type":"2","filter":["Open Cases Awaiting Customer Input"],"fieldCase":"UPPER"}},{"caseType":{"type":"1","filter":["Technical Service Request","Admin Service Request","ASC Service Request"],"fieldCase":"UPPER"}},{"lastModifiedDateMillis":{"type":"13","filter":["1504549800000 AND 1504636199000"]}}],"accountIds":["75bc2d4a-5b40-11e6-946f-005056a947e8","3e1e296d-2681-11e7-a983-005056a947e8","e1f62c60-5b40-11e6-885b-005056a96047","bcfd4c9a-5b40-11e6-9cb3-005056a91276","d1faae52-5b40-11e6-803c-005056a94c48","2f7418f6-182a-11e7-a343-005056a947e8"],"firstRecord":null,"lastRecord":null,"searchBy":"accounts"}
    ${cases_details}    Common.Executing API    ${External Cases API}    ${Create Date Sorting}    ${NGCSC1_token}
    Log    ${cases_details}
    ${cases_records}    Collections.Get From Dictionary    ${cases_details}    cases
    ${createDate_Millis}    BuiltIn.Create List
    Log    ${cases_records}
    ${total_records}    Get Length    ${cases_records}
    : FOR    ${i}    IN RANGE    ${total_records}
    \    ${record}    Collections.Get From List    ${cases_records}    ${i}
    \    ${createDate_value}    Collections.Get From Dictionary    ${record}    createDateMillis
    \    Append To List    ${createDate_Millis}    ${createDate_value}
    \    ${value}    Run Keyword If    '${i}' != '0'    ${createDate_Millis}[${i}] > ${createDate_Millis}[${i}-1]
    \    Log    ${value}
