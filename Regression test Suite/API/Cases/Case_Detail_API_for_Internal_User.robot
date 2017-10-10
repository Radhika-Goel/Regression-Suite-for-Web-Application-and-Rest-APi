*** Settings ***
Suite Setup       Common.Suite Setup for Case Details    ${Vidhya_Token}    ${Case ID}
Library           Collections
Resource          ../../Common.robot
Resource          ../../Variables.txt
Library           ngcscCommonMethods

*** Variables ***
${Case Detail API}    api/case-manager/cases
${Case ID}        2017-0705-T-1614
@{Serial/SSRN}    AB3809AA0014    CABV4435
@{System/Router}    Lemon-12b    RN 45
@{Series}         MX-Series    Contrail
@{Platform}       MX2020    Contrail
@{Release}        JUNOS13.3    4.0
${ssrn}           152115129000
@{Case Fields}    categories    closedDate    createDate    customerTrackingNumber    escalation    id    lastModifiedDate
...               owner    priority    reason    status    synopsis    type
@{Product Fields}    platform    release    routerName    serialNumber    series    softwareSupportReferenceNumber    version
@{Account Fields}    id    name
@{Contact Fields}    addInboundEmailIdToEmailRecipients    ccCustomer    ccEngineer    email    followUpMethodPreferrence    name    phone
...               preferredCallBack
@{problem description characters length list}    300    500    1000    1500    2000    4000    13000

*** Test Cases ***
Case ID Doesn't exist
    [Documentation]    Verify Case Detail API response when Case ID doesnt exist
    [Tags]    internal
    ${Case Detail API}    BuiltIn.Catenate    SEPARATOR=/    ${Case Detail API}    2017-0214-T-0001
    ${restIp}    String.Replace String    https://10.85.81.170/api1    api1    ${Case Detail API}
    ${headers}    BuiltIn.Create Dictionary    Authorization=${Vidhya_Token}
    log    ${headers}
    ${headers1}    BuiltIn.Create Dictionary    'content-type'=application/json
    ${response}    requests.Get    ${restIp}    headers=${headers}    verify=${FALSE}
    Log    ${response.content}
    Should Be Equal    ${response.status_code}    ${404}

When Case ID doesn't belong to account associated with user
    [Tags]    internal
    ${Case Detail API}    BuiltIn.Catenate    SEPARATOR=/    ${Case Detail API}    ${Case ID}
    ${restIp}    String.Replace String    https://10.85.81.170/api1    api1    ${Case Detail API}
    ${headers}    BuiltIn.Create Dictionary    Authorization=${erwin_token}
    log    ${headers}
    ${headers1}    BuiltIn.Create Dictionary    'content-type'=application/json
    ${response}    requests.Get    ${restIp}    headers=${headers}    verify=${FALSE}
    Log    ${response.content}
    Should Be Equal    ${response.status_code}    ${403}

Case Detail Fields on Case Detail Screen
    [Tags]    internal
    [Setup]
    Comment    Setup For Case Details API
    ${Case Detail API}    BuiltIn.Catenate    SEPARATOR=/    ${Case Detail API}    ${Case ID}
    BuiltIn.Sleep    60s
    ${case_details}    Common.Case Detail API    ${MyJuniper_Segregated_IP}    ${Case Detail API}    case    ${Vidhya_Token}
    ${case_details_fields}    Collections.Get Dictionary Keys    ${case_details}
    Collections.Lists Should Be Equal    ${case_details_fields}    ${Case Fields}
    ${srId}    Collections.Get From Dictionary    ${case_details}    id
    ${priority}    Collections.Get From Dictionary    ${case_details}    priority
    ${escalation}    Collections.Get From Dictionary    ${case_details}    escalation
    ${categories}    Collections.Get From Dictionary    ${case_details}    categories
    ${customerTrackingNumber}    Collections.Get From Dictionary    ${case_details}    customerTrackingNumber
    ${synopsis}    Collections.Get From Dictionary    ${case_details}    synopsis
    ${status}    Collections.Get From Dictionary    ${case_details}    status
    ${reason}    Collections.Get From Dictionary    ${case_details}    reason
    ${type}    Collections.Get From Dictionary    ${case_details}    type
    ${owner}    Collections.Get From Dictionary    ${case_details}    owner
    ${createDate}    Collections.Get From Dictionary    ${case_details}    createDate
    ${closedDate}    Collections.Get From Dictionary    ${case_details}    closedDate
    ${lastModifiedDate}    Collections.Get From Dictionary    ${case_details}    lastModifiedDate
    ${Case Detail API Response}    BuiltIn.Create List    ${srId}    ${priority}    ${escalation}    ${customerTrackingNumber}    ${synopsis}
    ...    ${status}    ${reason}    ${type}    ${owner}    ${createDate}    ${closedDate}
    ...    ${lastModifiedDate}
    Collections.Lists Should Be Equal    ${case_detail_values}    ${Case Detail API Response}
    ${technical_Category}    Collections.Get From Dictionary    ${categories}    technical
    ${sr_Category}    Collections.Get From Dictionary    ${categories}    sr
    Collections.Dictionaries Should Be Equal    ${technical_Category}    ${tech_Cate_script}
    Collections.Dictionaries Should Be Equal    ${sr_Category}    ${sr_Cate_script}

Case Detail Problem Description
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ${characters list}    BuiltIn.Get Length    ${problem description characters length list}
    : FOR    ${i}    IN RANGE    ${characters list}
    \    ${length}    Collections.Get From List    ${problem description characters length list}    ${i}
    \    ${tdline1}    Generate Random String    ${length}    [LETTERS]
    \    ${tdline2}    Generate Random String    2000    [LETTERS]
    \    ngcscCommonMethods.send notes message    cases_notes    ${tdline1}    ${tdline2}    ${Case ID}    ${msgRcdTs}
    \    BuiltIn.Sleep    60s
    \    ${Case Detail Problem Description API}    BuiltIn.Catenate    SEPARATOR=/    ${Case Detail API}    ${Case ID}    problemDescription
    \    ${problem_description_details}    Common.Case Detail API    ${MyJuniper_Segregated_IP}    ${Case Detail Problem Description API}    noteLog    ${Vidhya_Token}
    \    ${notelog_script}    BuiltIn.Catenate    SEPARATOR=    ${tdline1}    ${tdline2}
    \    BuiltIn.Should Be Equal    ${notelog_script}    ${problem_description_details}
    \    ${length_of_noteLog}    BuiltIn.Get Length    ${problem_description_details}
    \    ${total_length_problem_description}    Evaluate    ${length} + 2000
    \    BuiltIn.Should Be Equal    ${total_length_problem_description}    ${length_of_noteLog}

Product Fields on Case Details Screen
    ${Case Detail API}    BuiltIn.Catenate    SEPARATOR=/    ${Case Detail API}    ${Case ID}
    BuiltIn.Sleep    60s
    ${product_details}    Common.Case Detail API    ${MyJuniper_Segregated_IP}    ${Case Detail API}    product    ${Vidhya_Token}
    ${product_details_fields}    Collections.Get Dictionary Keys    ${product_details}
    Collections.Lists Should Be Equal    ${product_details_fields}    ${Product Fields}
    Log    ${product detail dict}
    Collections.Dictionaries Should Be Equal    ${product_details}    ${product detail dict}

Account Fields on Case Details Screen
    ${Case Detail API}    BuiltIn.Catenate    SEPARATOR=/    ${Case Detail API}    ${Case ID}
    BuiltIn.Sleep    60s
    ${account_details}    Common.Case Detail API    ${MyJuniper_Segregated_IP}    ${Case Detail API}    account    ${Vidhya_Token}
    ${account_details_fields}    Collections.Get Dictionary Keys    ${account_details}
    Collections.Lists Should Be Equal    ${account_details_fields}    ${Account Fields}
    Log    ${account detail dict}
    Collections.Dictionaries Should Be Equal    ${account_details}    ${account detail dict}

Contact Fields on Case Details Screen
    [Tags]    internal
    ${Case Detail API}    BuiltIn.Catenate    SEPARATOR=/    ${Case Detail API}    ${Case ID}
    BuiltIn.Sleep    60s
    ${contact_details}    Common.Case Detail API    ${MyJuniper_Segregated_IP}    ${Case Detail API}    contact    ${Vidhya_Token}
    ${contact_details_fields}    Collections.Get Dictionary Keys    ${contact_details}
    Collections.Lists Should Be Equal    ${contact_details_fields}    ${Contact Fields}
    Comment    ${contact detail dict}    Collections.Insert Into List    ${contact detail dict}
    log    ${contact detail dict}
    Collections.Append To List    ${contact detail dict}    ${ccEngineer}
    Log    ${contact detail dict}
    Comment    Collections.Dictionaries Should Be Equal    ${contact_details}    ${contact detail dict}
    ${reporter_name}    Collections.Get From Dictionary    ${contact_details}    name
    ${reporter_email}    Collections.Get From Dictionary    ${contact_details}    email
    ${followMethod}    Collections.Get From Dictionary    ${contact_details}    followUpMethodPreferrence
    ${donotCopyCC}    Collections.Get From Dictionary    ${contact_details}    addInboundEmailIdToEmailRecipients
    ${ccCust}    Collections.Get From Dictionary    ${contact_details}    ccCustomer
    ${reporter_phone}    Collections.Get From Dictionary    ${contact_details}    phone
    ${ccEngi}    Collections.Get From Dictionary    ${contact_details}    ccEngineer
    ${contact_api_response}    BuiltIn.Create List    ${reporter_name}    ${reporter_email}    ${followMethod}    ${donotCopyCC}    ${ccCust}
    ...    ${reporter_phone}    ${ccEngi}
    ${preferred_Call_back}    Collections.Get From Dictionary    ${contact_details}    preferredCallBack
    Comment    Collections.Dictionaries Should Be Equal    ${contact_details}    ${contact detail dict}
    Collections.Dictionaries Should Be Equal    ${preferred_Call_back}    ${preferredCallBack}
    Collections.Lists Should Be Equal    ${contact_api_response}    ${contact detail dict}

Case Detail Problem Description when Case ID doesnt't belong to user
    ${Case Detail Problem Description API}    BuiltIn.Catenate    SEPARATOR=/    ${Case Detail API}    ${Case ID}    problemDescription
    ${restIp}    String.Replace String    https://10.85.81.170/api1    api1    ${Case Detail Problem Description API}
    ${headers}    BuiltIn.Create Dictionary    Authorization=${erwin_token}
    log    ${headers}
    ${headers1}    BuiltIn.Create Dictionary    'content-type'=application/json
    ${response}    requests.Get    ${restIp}    headers=${headers}    verify=${FALSE}
    Log    ${response.content}
    Should Be Equal    ${response.status_code}    ${403}

Case Detail Problem Descritpion when Case Id doesn't exist
    ${Case Detail Problem Description API}    BuiltIn.Catenate    SEPARATOR=/    ${Case Detail API}    2017-0214-T-0001    problemDescription
    ${restIp}    String.Replace String    https://10.85.81.170/api1    api1    ${Case Detail Problem Description API}
    ${headers}    BuiltIn.Create Dictionary    Authorization=${Vidhya_Token}
    log    ${headers}
    ${headers1}    BuiltIn.Create Dictionary    'content-type'=application/json
    ${response}    requests.Get    ${restIp}    headers=${headers}    verify=${FALSE}
    Log    ${response.content}
    Should Be Equal    ${response.status_code}    ${404}

*** Keywords ***
Setup For Case Details API
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ${Type_value}    Generate Random String    1    01
    ${Type_value}    BuiltIn.Convert To Integer    ${Type_value}
    ${type}    Collections.Get From List    ${Type}    ${Type_value}
    ${type code}    Collections.Get From List    ${Type Code}    ${Type_value}
    ${priority_value}    Generate Random String    1    0123
    ${priority}    Collections.Get From List    ${Priority}    ${priority_value}
    ${priorty key}    Collections.Get From List    ${Priority key}    ${priority_value}
    ${status_value}    Generate Random String    1    012345
    ${status}    Collections.Get From List    ${Status}    ${status_value}
    ${current_Date}    ngcscCommonMethods.get currentdate pst
    ${create_date}    DateTime.Subtract Time From Date    ${current_Date}    10 days
    ${created_date_time}    DateTime.Convert Date    ${create_date}    result_format=%Y%m%d%H%M%S    date_format=%Y-%m-%d %H:%M:%S.%f
    Log    ${created_date_time}
    ${last_modified_date}    DateTime.Subtract Time From Date    ${current_Date}    1 day
    ${last modified time}    DateTime.Convert Date    ${last_modified_date}    result_format=%Y%m%d%H%M%S    date_format=%Y-%m-%d %H:%M:%S.%f
    ${all_cases_accounts}    Common.Get All Accounts API    cases
    ${all_accounts}    Collections.Get From Dictionary    ${all_cases_accounts}    accountsList
    ${accountIds}    Common.Getting serial Number from records    ${all_accounts}    accountId
    ${accountName}    Common.Getting serial Number from records    ${all_accounts}    accountName
    ${total_records}    BuiltIn.Get Length    ${accountIds}
    ${index}    ngcscCommonMethods.getting randomNo fromlist    ${total_records}
    ${Account ID }    Collections.Get From List    ${accountIds}    ${index}
    ${account Name}    Collections.Get From List    ${accountName}    ${index}
    ${follow_up_index}    Generate Random String    1    012
    ${followUpMethod}    Collections.Get From List    ${Follow UP method Preference}    ${follow_up_index}
    ${synopsis}    Generate Random String    250    [LETTERS]
    ${customer_tracking}    Generate Random String    250    [LETTERS]
    ${platform_details_index}    Generate Random String    1    01
    ${serial/ssrn}    Collections.Get From List    ${Serial/SSRN}    ${platform_details_index}
    ${system/router}    Collections.Get From List    ${System/Router}    ${platform_details_index}
    ${series}    Collections.Get From List    ${Series}    ${platform_details_index}
    ${platform}    Collections.Get From List    ${Platform}    ${platform_details_index}
    ${release}    Collections.Get From List    ${Release}    ${platform_details_index}
    ngcscCommonMethods.send message    casemanager_case    ${account Name}    ${Account ID }    ${followUpMethod}    ${type}    ${priority}
    ...    ${status}    ${type code}    ${created_date_time}    ${last modified time}    ${priorty key}    ${msgRcdTs}
    ...    ${synopsis}    ${customer_tracking}    ${release}    ${serial/ssrn}    ${system/router}    ${series}
    ...    ${platform}    ${ssrn}
    BuiltIn.Sleep    5s
