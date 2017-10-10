*** Settings ***
Resource          ../../Common.robot
Resource          ../../Variables.txt

*** Test Cases ***
Verify the maximum length for Notes
    Comment    Setup For Case Details API
    ${restIp}    String.Replace String    https://10.85.81.170/api1    api1    api/case-manager/cases/2017-0814-T-0669
    log    ${restIp}
    ${string}    Generate Random String    39935    [LETTERS]
    ${params}    BuiltIn.Set Variable    {"action":"escalation","case":{"escalationDesc":"Faster Progress"},"contact":{"ccCustomer":"radhikag@juniper.net","directPhone":"+91-9991002244-23454567890"},"note":"${string}"}
    Comment    ${inputData}    json.Loads    ${params}
    Comment    ${inputData}    json.Dumps    ${inputData}
    Log    ${params}
    ${headers}    BuiltIn.Create Dictionary    Authorization=${NGCSC1_token}
    log    ${headers}
    Comment    ${headers1}    BuiltIn.Create Dictionary    'content-type'=application/json
    ${response}    requests.Put    ${restIp}    data=${params}    headers=${headers}    verify=${FALSE}
    Log    ${response.headers}
    log    ${response.content}
    ${Case Detail API}    BuiltIn.Catenate    SEPARATOR=/    ${Case Detail API}    2017-0814-T-0669
    BuiltIn.Sleep    60s
    ${case_details}    Common.Case Detail API    ${MyJuniper_Segregated_IP}    ${Case Detail API}    case    ${NGCSC1_token}
    log    ${case_details}
