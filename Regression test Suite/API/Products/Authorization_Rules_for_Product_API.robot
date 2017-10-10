*** Settings ***
Default Tags      test
Library           DateTime
Resource          ../../Common.robot
Resource          ../../Variables.txt
Library           ngcscCommonMethods

*** Variables ***
${Account ID}     0100267501    # 0100071675
@{Serial IDs}     CW2216AF1159    RTU0000000168199    0169032010000876    AB2512AA0037    CU0210515869    AB3213AJ0058    RTU0000000210954
...               4310049704    0250008675    4310049704
${Access Group}    0010005494

*** Test Cases ***
Product Components API with unauthorized token
    [Documentation]    10019718008
    [Tags]    test
    ${current_Date}    DateTime.Get Current Date
    ${eol_date_format}    DateTime.Add Time To Date    ${current_Date}    10 days
    ${eol_date}    DateTime.Convert Date    ${eol_date_format}    result_format=%Y%m%d%H%M    date_format=%Y-%m-%d %H:%M:%S.%f
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ngcscCommonMethods.Send Message    ib    0100514790    End User (IB End Customer)    ZE000001    4019718110    null
    ...    0162052013000660    ${msgRcdTs}
    ngcscCommonMethods.Send Message    pm    ${eol_date}    ${msgRcdTs}
    BuiltIn.Sleep    10s
    ngcscCommonMethods.Send Message    ib    0100514790    End User (IB End Customer)    ZE000001    4019718111    0162052013000660
    ...    RTU00000048140    ${msgRcdTs}
    BuiltIn.Sleep    60s
    ${restIp}    String.Replace String    ${MyJuniper_Segregated_IP}/api1    api1    ${Product Component API}
    ${params}    BuiltIn.Set Variable    {"serialNumber":"0162052013000660"}
    ${params}    json.Loads    ${params}
    log    ${params}
    ${params}    json.Dumps    ${params}
    Log    ${params}
    ${headers}    BuiltIn.Create Dictionary    Authorization=${NGCSC9_token}
    log    ${headers}
    ${headers1}    BuiltIn.Create Dictionary    'content-type'=application/json
    ${response}    requests.Post    ${restIp}    data=${params}    headers=${headers}    verify=${FALSE}
    ${api_output_json}    BuiltIn.Set Variable    ${response.json()}
    ${product_records}    Collections.Get From Dictionary    ${api_output_json}    ibaseProductsList
    ${all_serialNumber_stage_records}    Common.Getting serial Number from records    ${product_records}    serialNumber
    Collections.List Should Contain Value    ${all_serialNumber_stage_records}    RTU00000048140
    ${restIp}    String.Replace String    ${External URl}/api1    api1    ${External products Components URL}
    ${response}    requests.Post    ${restIp}    data=${params}    headers=${headers}    verify=${FALSE}
    ${api_output_json}    BuiltIn.Set Variable    ${response.json()}
    ${product_records}    Collections.Get From Dictionary    ${api_output_json}    productComponents
    ${all_serialNumber_external_records}    Common.Getting serial Number from records    ${product_records}    serialNumber
    Collections.List Should Contain Value    ${all_serialNumber_external_records}    RTU00000048140
    ${restIp}    String.Replace String    ${MyJuniper_Segregated_IP}/api1    api1    ${Product Component API}
    ${headers}    BuiltIn.Create Dictionary    Authorization=${bart_token}
    log    ${headers}
    ${response}    requests.Post    ${restIp}    data=${params}    headers=${headers}    verify=${FALSE}
    ${api_output_json}    BuiltIn.Set Variable    ${response.json()}
    ${product_records}    Collections.Get From Dictionary    ${api_output_json}    ibaseProductsList
    ${all_serialNumber_stage_unauthorized_records}    Common.Getting serial Number from records    ${product_records}    serialNumber
    Collections.List Should Not Contain Value    ${all_serialNumber_stage_unauthorized_records}    RTU00000048140
    ${restIp}    String.Replace String    ${External URl}/api1    api1    ${External products Components URL}
    ${headers}    BuiltIn.Create Dictionary    Authorization=${bart_token}
    log    ${headers}
    ${response}    requests.Post    ${restIp}    data=${params}    headers=${headers}
    ${api_output_json}    BuiltIn.Set Variable    ${response.json()}
    ${product_records}    Collections.Get From Dictionary    ${api_output_json}    productComponents
    ${all_serialNumber_external_unauthorized_records}    Common.Getting serial Number from records    ${product_records}    serialNumber
    Collections.List Should Not Contain Value    ${all_serialNumber_external_unauthorized_records}    RTU00000048140

Product Component API by Continuously Changing Serial Id
    ${total_length}    BuiltIn.Get Length    ${Serial IDs}
    : FOR    ${i}    IN RANGE    ${total_length}
    \    ${value}    Collections.Get From List    ${Serial IDs}    ${i}
    \    ${restIp}    String.Replace String    ${MyJuniper_Segregated_IP}/api1    api1    ${Product Component API}
    \    ${params}    BuiltIn.Set Variable    {"serialNumber":"${value}"}
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
    \    BuiltIn.Run Keyword If    '${i}' == '1' or '${i}' == '3' or '${i}' == '5' or '${i}' == '7' or '${i}' == '9'    BuiltIn.Should Be Equal As Integers    ${total_records_output}    0
    \    BuiltIn.Run Keyword If    '${i}' == '0' or '${i}' == '2' or '${i}' == '4' or '${i}' == '6' or '${i}' == '8'    BuiltIn.Evaluate    ${total_records_output} > 0
    \    ${restIp}    String.Replace String    ${External URl}/api1    api1    ${External products Components URL}
    \    ${params}    BuiltIn.Set Variable    {"serialNumber":"${value}"}
    \    ${response}    requests.Post    ${restIp}    data=${params}    headers=${headers}
    \    ${api_output_json}    BuiltIn.Set Variable    ${response.json()}
    \    ${total_records_output}    Collections.Get From Dictionary    ${api_output_json}    totalRecords
    \    BuiltIn.Run Keyword If    '${i}' == '1' or '${i}' == '3' or '${i}' == '5' or '${i}' == '7' or '${i}' == '9'    BuiltIn.Should Be Equal As Integers    ${total_records_output}    0
    \    BuiltIn.Run Keyword If    '${i}' == '0' or '${i}' == '2' or '${i}' == '4' or '${i}' == '6' or '${i}' == '8'    BuiltIn.Evaluate    ${total_records_output} > 0

Product Components API for Partner Function As "Installed At"
    [Tags]    test1
    ${epoch_time_in_pst}    ngcscCommonMethods.epoch max time in pst
    ${current_Date}    DateTime.Get Current Date
    ${eol_date_format}    DateTime.Add Time To Date    ${current_Date}    10 days
    ${eol_date}    DateTime.Convert Date    ${eol_date_format}    result_format=%Y%m%d%H%M    date_format=%Y-%m-%d %H:%M:%S.%f
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    Comment    ${all_accounts_json}    Common.Get All Accounts API    ibases    ${NGCSC1_token}
    Comment    ${all_accounts}    Collections.Get From Dictionary    ${all_accounts_json}    accountsList
    Comment    ${accountIds}    Common.Getting serial Number from records    ${all_accounts}    accountId
    Comment    ${Account ID}    Collections.Get From List    ${accountIds}    0
    ${Account ID}    Common.Setup for Getting Random Account ID    ibases    ${NGCSC1_token}
    ngcscCommonMethods.Send Message    ib    ${Account ID}    End User (IB End Customer)    ZE000001    4019718110    null
    ...    0162052013000666    ${msgRcdTs}
    ngcscCommonMethods.Send Message    pm    ${eol_date}    ${msgRcdTs}
    BuiltIn.Sleep    10s
    ngcscCommonMethods.Send Message    ib    ${Account ID}    End User (IB End Customer)    ZE000001    4019718111    0162052013000666
    ...    RTU00000048145    ${msgRcdTs}
    BuiltIn.Sleep    60s
    ${all_serialNumber_stage_records}    Common.Product Component API    ${MyJuniper_Segregated_IP}    ${Product Component API}    ibaseProductsList    0162052013000666
    Collections.List Should Contain Value    ${all_serialNumber_stage_records}    RTU00000048145
    ${all_serialNumber_external_records}    Common.Product Component API    ${External URl}    ${External products Components URL}    productComponents    0162052013000666
    Collections.List Should Contain Value    ${all_serialNumber_external_records}    RTU00000048145
    Comment    ngcscCommonMethods.Send Message    ib    0100519609    ZI000002    Installed At    0162052013000477
    ...    RTU00000048128    ${msgRcdTs}
    Comment    ngcscCommonMethods.Send Message    pm    ${eol_date}    ${msgRcdTs}
    ${time_in_pst}    ngcscCommonMethods.current time for customer master
    ${date_in_pst}    ngcscCommonMethods.current date for customer master
    Comment    ngcscCommonMethods.Send Message    customer_master    ${time_in_pst}    0201034725    D    Has Asset Primary Account
    ...    0100498380    ${date_in_pst}    ${msgRcdTs}    ZBUR09
    ${all_accounts_json}    Common.Get All Accounts API    ibases    ${NGCSC1_token}
    ${all_accounts}    Collections.Get From Dictionary    ${all_accounts_json}    accountsList
    ${accountIds}    Common.Getting serial Number from records    ${all_accounts}    accountId
    Collections.List Should Not Contain Value    ${accountIds}    0101138747
    ngcscCommonMethods.Send Message    ib    0101138747    End User (IB End Customer)    ZE000001    4019718111    0162052013000666
    ...    RTU00000048145    ${msgRcdTs}
    BuiltIn.Sleep    60s
    ${all_serialNumber_stage_records}    Common.Product Component API    ${MyJuniper_Segregated_IP}    ${Product Component API}    ibaseProductsList    0162052013000666
    Collections.List Should Not Contain Value    ${all_serialNumber_stage_records}    RTU00000048145
    ${all_serialNumber_external_records}    Common.Product Component API    ${External URl}    ${External products Components URL}    productComponents    0162052013000666
    Collections.List Should Not Contain Value    ${all_serialNumber_external_records}    RTU00000048145

Product Component API for partner function as "Managing Reseller"
    ${epoch_time_in_pst}    ngcscCommonMethods.epoch max time in pst
    ${current_Date}    DateTime.Get Current Date
    ${eol_date_format}    DateTime.Add Time To Date    ${current_Date}    10 days
    ${eol_date}    DateTime.Convert Date    ${eol_date_format}    result_format=%Y%m%d%H%M    date_format=%Y-%m-%d %H:%M:%S.%f
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ${Account ID}    Common.Setup for Getting Random Account ID    ibases    ${NGCSC1_token}
    ngcscCommonMethods.Send Message    ib    ${Account ID}    Managing Reseller    ZD000001    4019718112    null
    ...    0162052013000667    ${msgRcdTs}
    ngcscCommonMethods.Send Message    pm    ${eol_date}    ${msgRcdTs}
    ngcscCommonMethods.Send Message    ib    ${Account ID}    Managing Reseller    ZD000001    4019718113    0162052013000667
    ...    RTU00000048167    ${msgRcdTs}
    BuiltIn.Sleep    60s
    ${all_serialNumber_stage_records}    Common.Product Component API    ${MyJuniper_Segregated_IP}    ${Product Component API}    ibaseProductsList    0162052013000667
    Collections.List Should Contain Value    ${all_serialNumber_stage_records}    RTU00000048167
    ${all_serialNumber_external_records}    Common.Product Component API    ${External URl}    ${External products Components URL}    productComponents    0162052013000667
    Collections.List Should Contain Value    ${all_serialNumber_external_records}    RTU00000048167
    Comment    ngcscCommonMethods.Send Message    ib    0100519609    ZD000001    Managing Reseller    ${msgRcdTs}
    Comment    ngcscCommonMethods.Send Message    pm    ${eol_date}    ${msgRcdTs}
    ${time_in_pst}    ngcscCommonMethods.current time for customer master
    ${date_in_pst}    ngcscCommonMethods.current date for customer master
    ngcscCommonMethods.Send Message    customer_master    ${time_in_pst}    0201034504    D    Has Asset Primary Account    0101007434
    ...    ${date_in_pst}    ${msgRcdTs}    ZBUR09
    ${all_accounts_json}    Common.Get All Accounts API    ibases    ${NGCSC9_token}
    ${all_accounts}    Collections.Get From Dictionary    ${all_accounts_json}    accountsList
    ${accountIds}    Common.Getting serial Number from records    ${all_accounts}    accountId
    Collections.List Should Not Contain Value    ${accountIds}    0101007434
    ngcscCommonMethods.Send Message    ib    0101007434    Managing Reseller    ZD000001    4019718113    0162052013000667
    ...    RTU00000048167    ${msgRcdTs}
    BuiltIn.Sleep    60s
    ${all_serialNumber_stage_new_records}    Common.Product Component API    ${MyJuniper_Segregated_IP}    ${Product Component API}    ibaseProductsList    0162052013000667
    Collections.List Should Not Contain Value    ${all_serialNumber_stage_new_records}    RTU00000048167
    ${all_serialNumber_external_new_records}    Common.Product Component API    ${External URl}    ${External products Components URL}    productComponents    0162052013000667
    Collections.List Should Not Contain Value    ${all_serialNumber_external_new_records}    RTU00000048167

Product API associated to account which is part of access Group
    ${epoch_time_in_pst}    ngcscCommonMethods.epoch max time in pst
    ${current_Date}    DateTime.Get Current Date
    ${header_end_date}    DateTime.Convert Date    ${current_Date}    result_format=%Y%m%d%H%M    date_format=%Y-%m-%d %H:%M:%S.%f
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ngcscCommonMethods.Send Message    access_group    ${header_end_date}    ${Account ID}    ${Access Group}    I    ${msgRcdTs}
    BuiltIn.Sleep    60s
    Comment    ${time_in_pst}    ngcscCommonMethods.current time for customer master
    Comment    ${date_in_pst}    ngcscCommonMethods.current date for customer master
    Comment    ngcscCommonMethods.Send Message    customer_master    ${time_in_pst}    0201034504    I    Has Asset Primary Account
    ...    ${Account ID}    ${date_in_pst}    ${msgRcdTs}
    Comment    BuiltIn.Sleep    60s
    ${header_end_date}    DateTime.Add Time To Date    ${current_Date}    10 days
    ${header_end_date}    DateTime.Convert Date    ${header_end_date}    result_format=%Y%m%d%H%M    date_format=%Y-%m-%d %H:%M:%S.%f
    ${start_time_pst_epoch}    ngcscCommonMethods.epoch min time in pst
    ${current_Date}    ngcscCommonMethods.get currentdate pst
    ${eol_date_format}    DateTime.Add Time To Date    ${current_Date}    10 days
    ${eol_date}    DateTime.Convert Date    ${eol_date_format}    result_format=%Y%m%d%H%M    date_format=%Y-%m-%d %H:%M:%S.%f
    ngcscCommonMethods.Send Message    ib    ${Account ID}    End User (IB End Customer)    ZE000001    4019718114    null
    ...    0162052013000668    ${msgRcdTs}
    ngcscCommonMethods.Send Message    pm    ${eol_date}    ${msgRcdTs}
    ngcscCommonMethods.Send Message    ib    ${Account ID}    End User (IB End Customer)    ZE000001    4019718115    0162052013000668
    ...    RTU00000048168    ${msgRcdTs}
    BuiltIn.Sleep    60s
    ${all_serialNumber_stage_records}    Common.Product Component API    ${MyJuniper_Segregated_IP}    ${Product Component API}    ibaseProductsList    0162052013000668
    Collections.List Should Contain Value    ${all_serialNumber_stage_records}    RTU00000048168
    ${all_serialNumber_external_records}    Common.Product Component API    ${External URl}    ${External products Components URL}    productComponents    0162052013000668
    Collections.List Should Contain Value    ${all_serialNumber_external_records}    RTU00000048168
    Comment    ngcscCommonMethods.Send Message    ib    0100498380    ZI000002    Installed At    ${msgRcdTs}
    Comment    ngcscCommonMethods.Send Message    pm    ${eol_date}    ${msgRcdTs}
    ngcscCommonMethods.Send Message    ib    0101138747    End User (IB End Customer)    ZE000001    4019718115    0162052013000668
    ...    RTU00000048168    ${msgRcdTs}
    BuiltIn.Sleep    60s
    ${all_serialNumber_stage_new_records}    Common.Product Component API    ${MyJuniper_Segregated_IP}    ${Product Component API}    ibaseProductsList    0162052013000668
    Collections.List Should Not Contain Value    ${all_serialNumber_stage_new_records}    RTU00000048168
    ${all_serialNumber_external_new_records}    Common.Product Component API    ${External URl}    ${External products Components URL}    productComponents    0162052013000668
    Collections.List Should Not Contain Value    ${all_serialNumber_external_new_records}    RTU00000048168
    ngcscCommonMethods.Send Message    access_group    ${header_end_date}    ${Account ID}    ${Access Group}    D    ${msgRcdTs}
    BuiltIn.Sleep    60s
    ${all_accounts_json}    Common.Get All Accounts API    ibases    ${NGCSC1_token}
    ${all_accounts}    Collections.Get From Dictionary    ${all_accounts_json}    accountsList
    ${accountIds}    Common.Getting serial Number from records    ${all_accounts}    accountId
    Collections.List Should Not Contain Value    ${accountIds}    ${accountIds}    ${Account ID}

IB partner function associted with HAP relationship
    ${time_in_pst}    ngcscCommonMethods.current time for customer master
    ${date_in_pst}    ngcscCommonMethods.current date for customer master
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ngcscCommonMethods.Send Message    customer_master    ${time_in_pst}    0201034504    I    Has Asset Primary Account    0100516691
    ...    ${date_in_pst}    ${msgRcdTs}    ZBUR09
    BuiltIn.Sleep    60s
    ${current_Date}    DateTime.Get Current Date
    ${header_end_date}    DateTime.Add Time To Date    ${current_Date}    10 days
    ${header_end_date}    DateTime.Convert Date    ${header_end_date}    result_format=%Y%m%d%H%M    date_format=%Y-%m-%d %H:%M:%S.%f
    ${start_time_pst_epoch}    ngcscCommonMethods.epoch min time in pst
    ${current_Date}    ngcscCommonMethods.get currentdate pst
    ${eol_date_format}    DateTime.Add Time To Date    ${current_Date}    10 days
    ${eol_date}    DateTime.Convert Date    ${eol_date_format}    result_format=%Y%m%d%H%M    date_format=%Y-%m-%d %H:%M:%S.%f
    ngcscCommonMethods.Send Message    ib    0100516691    Managing Reseller    ZD000001    4019718114    null
    ...    0162052013000669    ${msgRcdTs}
    ngcscCommonMethods.Send Message    pm    ${eol_date}    ${msgRcdTs}
    ngcscCommonMethods.Send Message    ib    0100516691    Managing Reseller    ZD000001    4019718115    0162052013000669
    ...    RTU00000048169    ${msgRcdTs}
    BuiltIn.Sleep    60s
    ${all_serialNumber_stage_records}    Common.Product Component API    ${MyJuniper_Segregated_IP}    ${Product Component API}    ibaseProductsList    0162052013000669
    Collections.List Should Contain Value    ${all_serialNumber_stage_records}    RTU00000048169
    ${all_serialNumber_external_records}    Common.Product Component API    ${External URl}    ${External products Components URL}    productComponents    0162052013000669
    Collections.List Should Contain Value    ${all_serialNumber_external_records}    RTU00000048169
    ngcscCommonMethods.Send Message    customer_master    ${time_in_pst}    0201034504    D    Has Asset Primary Account    0100516691
    ...    ${date_in_pst}    ${msgRcdTs}    ZBUR09
    BuiltIn.Sleep    60s
    ngcscCommonMethods.Send Message    ib    0101138747    Managing Reseller    ZD000001    4019718115    0162052013000669
    ...    RTU00000048169    ${msgRcdTs}
    BuiltIn.Sleep    60s
    ${all_serialNumber_stage_new_records}    Common.Product Component API    ${MyJuniper_Segregated_IP}    ${Product Component API}    ibaseProductsList    0162052013000669
    Collections.List Should Not Contain Value    ${all_serialNumber_stage_new_records}    RTU00000048169
    ${all_serialNumber_external_new_records}    Common.Product Component API    ${External URl}    ${External products Components URL}    productComponents    0162052013000669
    Collections.List Should Not Contain Value    ${all_serialNumber_external_new_records}    RTU00000048169
    Comment    ngcscCommonMethods.Send Message    customer_master    ${time_in_pst}    0201034504    D    Has Asset Primary Account
    ...    0100516691    ${date_in_pst}    ${msgRcdTs}    ZBUR09
    Comment    BuiltIn.Sleep    60s
    ${all_accounts_json}    Common.Get All Accounts API    ibases    ${NGCSC1_token}
    ${all_accounts}    Collections.Get From Dictionary    ${all_accounts_json}    accountsList
    ${accountIds}    Common.Getting serial Number from records    ${all_accounts}    accountId
    Collections.List Should Not Contain Value    ${accountIds}    ${accountIds}    0100516691

IB partner function associated with HAS relationship
    ${time_in_pst}    ngcscCommonMethods.current time for customer master
    ${date_in_pst}    ngcscCommonMethods.current date for customer master
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ngcscCommonMethods.Send Message    customer_master    ${time_in_pst}    0201034504    I    Has Asset Secondary Account    0100850943
    ...    ${date_in_pst}    ${msgRcdTs}    ZBUR10
    BuiltIn.Sleep    60s
    ${current_Date}    DateTime.Get Current Date
    ${header_end_date}    DateTime.Add Time To Date    ${current_Date}    10 days
    ${header_end_date}    DateTime.Convert Date    ${header_end_date}    result_format=%Y%m%d%H%M    date_format=%Y-%m-%d %H:%M:%S.%f
    ${start_time_pst_epoch}    ngcscCommonMethods.epoch min time in pst
    ${current_Date}    ngcscCommonMethods.get currentdate pst
    ${eol_date_format}    DateTime.Add Time To Date    ${current_Date}    10 days
    ${eol_date}    DateTime.Convert Date    ${eol_date_format}    result_format=%Y%m%d%H%M    date_format=%Y-%m-%d %H:%M:%S.%f
    ngcscCommonMethods.Send Message    ib    0100850943    Managing Reseller    ZD000001    4019718116    null
    ...    0162052013000670    ${msgRcdTs}
    ngcscCommonMethods.Send Message    pm    ${eol_date}    ${msgRcdTs}
    ngcscCommonMethods.Send Message    ib    0100850943    Managing Reseller    ZD000001    4019718117    0162052013000670
    ...    RTU00000048170    ${msgRcdTs}
    BuiltIn.Sleep    60s
    ${all_serialNumber_stage_records}    Common.Product Component API    ${MyJuniper_Segregated_IP}    ${Product Component API}    ibaseProductsList    0162052013000670
    Collections.List Should Contain Value    ${all_serialNumber_stage_records}    RTU00000048170
    ${all_serialNumber_external_records}    Common.Product Component API    ${External URl}    ${External products Components URL}    productComponents    0162052013000670
    Collections.List Should Contain Value    ${all_serialNumber_external_records}    RTU00000048170
    ngcscCommonMethods.Send Message    ib    0101138747    Managing Reseller    ZD000001    4019718117    0162052013000670
    ...    RTU00000048170    ${msgRcdTs}
    BuiltIn.Sleep    60s
    ${all_serialNumber_stage_new_records}    Common.Product Component API    ${MyJuniper_Segregated_IP}    ${Product Component API}    ibaseProductsList    0162052013000670
    Collections.List Should Not Contain Value    ${all_serialNumber_stage_new_records}    RTU00000048170
    ${all_serialNumber_external_new_records}    Common.Product Component API    ${External URl}    ${External products Components URL}    productComponents    0162052013000670
    Collections.List Should Not Contain Value    ${all_serialNumber_external_new_records}    RTU00000048170
    ngcscCommonMethods.Send Message    customer_master    ${time_in_pst}    0201034504    D    Has Asset Secondary Account    0100850943
    ...    ${date_in_pst}    ${msgRcdTs}    ZBUR10
    BuiltIn.Sleep    60s
    ${all_accounts_json}    Common.Get All Accounts API    ibases    ${NGCSC1_token}
    ${all_accounts}    Collections.Get From Dictionary    ${all_accounts_json}    accountsList
    ${accountIds}    Common.Getting serial Number from records    ${all_accounts}    accountId
    Collections.List Should Not Contain Value    ${accountIds}    ${accountIds}    0100850943

Product Components where Child doesnt belong to Authorized Account
    ${start_time_pst_epoch}    ngcscCommonMethods.epoch min time in pst
    ${current_Date}    ngcscCommonMethods.get currentdate pst
    ${slice_date}    DateTime.Add Time To Date    ${current_Date}    89 days
    ${endDate_pst_epoch}    ngcscCommonMethods.epoch pst end slice time    ${slice_date}
    ${eol_date_format}    DateTime.Add Time To Date    ${current_Date}    10 days
    ${eol_date}    DateTime.Convert Date    ${eol_date_format}    result_format=%Y%m%d%H%M    date_format=%Y-%m-%d %H:%M:%S.%f
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ngcscCommonMethods.Send Message    ib    0100510468    End User (IB End Customer)    ZE000001    4019718118    null
    ...    0162052013000671    ${msgRcdTs}
    ngcscCommonMethods.Send Message    pm    ${eol_date}    ${msgRcdTs}
    ngcscCommonMethods.Send Message    ib    0100510468    End User (IB End Customer)    ZE000001    4019718119    0162052013000671
    ...    RTU0000000169571    ${msgRcdTs}
    ngcscCommonMethods.Send Message    ib    0100510468    End User (IB End Customer)    ZE000001    4019718120    0162052013000671
    ...    RTU0000000167246    ${msgRcdTs}
    BuiltIn.Sleep    60s
    ${all_serialNumber_stage_records}    Common.Product Component API    ${MyJuniper_Segregated_IP}    ${Product Component API}    ibaseProductsList    0162052013000671
    Collections.List Should Contain Value    ${all_serialNumber_stage_records}    RTU0000000169571
    Collections.List Should Contain Value    ${all_serialNumber_stage_records}    RTU0000000167246
    ${all_serialNumber_external_records}    Common.Product Component API    ${External URl}    ${External products Components URL}    productComponents    0162052013000671
    Collections.List Should Contain Value    ${all_serialNumber_external_records}    RTU0000000169571
    Collections.List Should Contain Value    ${all_serialNumber_external_records}    RTU0000000167246
    Comment    ngcscCommonMethods.Send Message    pm    ${eol_date}    ${msgRcdTs}
    ngcscCommonMethods.Send Message    ib    0100141931    End User (IB End Customer)    ZE000001    4019718119    0162052013000671
    ...    RTU0000000169571    ${msgRcdTs}
    BuiltIn.Sleep    60s
    ${all_serialNumber_stage_new_records}    Common.Product Component API    ${MyJuniper_Segregated_IP}    ${Product Component API}    ibaseProductsList    0162052013000671
    Collections.List Should Not Contain Value    ${all_serialNumber_stage_new_records}    RTU0000000169571
    Collections.List Should Contain Value    ${all_serialNumber_stage_new_records}    RTU0000000167246
    ${all_serialNumber_external_new_records}    Common.Product Component API    ${External URl}    ${External products Components URL}    productComponents    0162052013000671
    Collections.List Should Not Contain Value    ${all_serialNumber_external_new_records}    RTU0000000169571
    Collections.List Should Contain Value    ${all_serialNumber_external_new_records}    RTU0000000167246

Product Component where Parent doesnt belong to Authorized Account
    ${start_time_pst_epoch}    ngcscCommonMethods.epoch min time in pst
    ${current_Date}    ngcscCommonMethods.get currentdate pst
    ${slice_date}    DateTime.Add Time To Date    ${current_Date}    89 days
    ${endDate_pst_epoch}    ngcscCommonMethods.epoch pst end slice time    ${slice_date}
    ${eol_date_format}    DateTime.Add Time To Date    ${current_Date}    10 days
    ${eol_date}    DateTime.Convert Date    ${eol_date_format}    result_format=%Y%m%d%H%M    date_format=%Y-%m-%d %H:%M:%S.%f
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ngcscCommonMethods.Send Message    ib    0100457997    Managing Reseller    ZD000001    4019718121    null
    ...    0162052013000672    ${msgRcdTs}
    ngcscCommonMethods.Send Message    pm    ${eol_date}    ${msgRcdTs}
    ngcscCommonMethods.Send Message    ib    0100457997    Managing Reseller    ZI000002    4019718122    0162052013000672
    ...    RTU0000000169572    ${msgRcdTs}
    ngcscCommonMethods.Send Message    ib    0100457997    Managing Reseller    ZI000002    4019718123    0162052013000672
    ...    RTU0000000167247    ${msgRcdTs}
    BuiltIn.Sleep    60s
    ${all_serialNumber_stage_records}    Common.Product Component API    ${MyJuniper_Segregated_IP}    ${Product Component API}    ibaseProductsList    0162052013000672
    Collections.List Should Contain Value    ${all_serialNumber_stage_records}    RTU0000000169572
    Collections.List Should Contain Value    ${all_serialNumber_stage_records}    RTU0000000167247
    ${all_serialNumber_external_records}    Common.Product Component API    ${External URl}    ${External products Components URL}    productComponents    0162052013000672
    Collections.List Should Contain Value    ${all_serialNumber_external_records}    RTU0000000169572
    Collections.List Should Contain Value    ${all_serialNumber_stage_records}    RTU0000000167247
    Comment    ngcscCommonMethods.Send Message    pm    ${eol_date}    ${msgRcdTs}
    ngcscCommonMethods.Send Message    ib    0100141931    Managing Reseller    ZI000002    4019718121    null
    ...    0162052013000672    ${msgRcdTs}
    BuiltIn.Sleep    60s
    ${all_serialNumber_stage_new_records}    Common.Product Component API    ${MyJuniper_Segregated_IP}    ${Product Component API}    ibaseProductsList    0162052013000672
    ${length_null_productComponents}    BuiltIn.Get Length    ${all_serialNumber_stage_new_records}
    BuiltIn.Should Be Equal As Integers    ${length_null_productComponents}    0
    ${all_serialNumber_external_new_records}    Common.Product Component API    ${External URl}    ${External products Components URL}    productComponents    0162052013000672
    ${length_null_productComponents}    BuiltIn.Get Length    ${all_serialNumber_external_new_records}
    BuiltIn.Should Be Equal As Integers    ${length_null_productComponents}    0

Product Component API where user associated with account with Has Service Contact RelationShip
    ${time_in_pst}    ngcscCommonMethods.current time for customer master
    ${date_in_pst}    ngcscCommonMethods.current date for customer master
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ngcscCommonMethods.Send Message    customer_master    ${time_in_pst}    0201034725    I    Has Service Contact    0100850943
    ...    ${date_in_pst}    ${msgRcdTs}    ZBUR02
    BuiltIn.Sleep    60s
    ${current_Date}    DateTime.Get Current Date
    ${header_end_date}    DateTime.Add Time To Date    ${current_Date}    10 days
    ${header_end_date}    DateTime.Convert Date    ${header_end_date}    result_format=%Y%m%d%H%M    date_format=%Y-%m-%d %H:%M:%S.%f
    ${start_time_pst_epoch}    ngcscCommonMethods.epoch min time in pst
    ${current_Date}    ngcscCommonMethods.get currentdate pst
    ${eol_date_format}    DateTime.Add Time To Date    ${current_Date}    10 days
    ${eol_date}    DateTime.Convert Date    ${eol_date_format}    result_format=%Y%m%d%H%M    date_format=%Y-%m-%d %H:%M:%S.%f
    ngcscCommonMethods.Send Message    ib    0100850943    ZD000001    Managing Reseller    0162052013000477    RTU0000000168202
    ...    ${msgRcdTs}
    ngcscCommonMethods.Send Message    pm    ${eol_date}    ${msgRcdTs}
    ngcscCommonMethods.Send Message    ib    0100850943    ZD000001    Managing Reseller    0162052013000477    RTU0000000168202
    ...    ${msgRcdTs}
    BuiltIn.Sleep    60s
    ${all_serialNumber_stage_records}    Common.Product Component API    ${MyJuniper_Segregated_IP}    ${Product Component API}    ibaseProductsList    0162052013000477
    Collections.List Should Not Contain Value    ${all_serialNumber_stage_records}    RTU0000000168202
    ${all_serialNumber_external_records}    Common.Product Component API    ${External URl}    ${External products Components URL}    productComponents    0162052013000477
    Collections.List Should Not Contain Value    ${all_serialNumber_external_records}    RTU0000000168202
    ngcscCommonMethods.Send Message    ib    0100498380    ZD000001    Managing Reseller    0162052013000477    RTU0000000168202
    ...    ${msgRcdTs}
    BuiltIn.Sleep    60s
    ${all_serialNumber_stage_new_records}    Common.Product Component API    ${MyJuniper_Segregated_IP}    ${Product Component API}    ibaseProductsList    0162052013000477
    Collections.List Should Not Contain Value    ${all_serialNumber_stage_new_records}    RTU0000000168202
    ${all_serialNumber_external_new_records}    Common.Product Component API    ${External URl}    ${External products Components URL}    productComponents    0162052013000477
    Collections.List Should Not Contain Value    ${all_serialNumber_external_new_records}    RTU0000000168202
    ngcscCommonMethods.Send Message    customer_master    ${time_in_pst}    0201034725    D    Has Service Contact    0100850943
    ...    ${date_in_pst}    ${msgRcdTs}    ZBUR02
    BuiltIn.Sleep    60s
    ${all_accounts_json}    Common.Get All Accounts API    ibases    ${NGCSC9_token}
    ${all_accounts}    Collections.Get From Dictionary    ${all_accounts_json}    accountsList
    ${accountIds}    Common.Getting serial Number from records    ${all_accounts}    accountId
    Collections.List Should Not Contain Value    ${accountIds}    ${accountIds}    0100850943
