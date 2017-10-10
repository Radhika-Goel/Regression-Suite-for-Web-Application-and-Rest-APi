*** Settings ***
Library           ngcscCommonMethods
Resource          ../../Common.robot
Resource          ../../Variables.txt

*** Test Cases ***
Matching Records for SSRN under Contracts
    ${restIp}    String.Replace String    ${MyJuniper_Segregated_IP}/api1    api1    api/contract-manager/contracts
    ${params}    BuiltIn.Set Variable    ${Global_Search_SSRN_Contracts}
    ${inputData}    json.Loads    ${params}
    ${inputData}    json.Dumps    ${inputData}
    Log    ${inputData}
    ${headers}    Create Dictionary    Authorization=Bearer eyJjdHkiOiJKV1QiLCJlbmMiOiJBMjU2R0NNIiwiYWxnIjoiZGlyIn0..ax3s7gOKcLO36qEl.XV5n8QvidPd7-l6FLXFAOMzpf0xGJRgRfQlh4rz-H7PPwlBDgYOIodXc5saRyYlMaBIv3Vi0k4qYxzeWdgogDOgIgW9mVG3YbCJZ-I8o74ooy86tmW29B0hdlw0aJJFsqaLKhiolcRqpzTsLWfTAD6pp8VY9PXuqE1IyeQ2sEwKNiPYn-2qIiIb8VyBVyIdKrv7A70c7NlOo3c9Vb-Ttz_LQctviR6zJNjPdxcMJHTrS-X4CAGcbKKQme0uiMJAWYCbXcpZXrjrHrJ462o0Dxo3QDbd85dWfkkZrrScUhB1U9hcELXRBza8Sdrws_jDpAWnf0B2Pm9uy2yvibPpNx43ApmhvoautKb4QmxXM4qBr33NTQoA-xiFtLr19ns9bB44Vx3bisdBkCV6NeNq017VAzth7JWqwj3sAQh0kJRL3g9VfpAzgjHc94gAchN1XIsxw1pLoJmX4ZWZ22Qbk2BTOT7bU64_3WFy-7ocMfrRgfxTRLmtkNoqEv_NR1_0FKvndrW8ekla6gyQzxvKn63-sIC4j88iAcOICic9h_dQ9MxV5N8juuSssiV29O8dI9czmnVzkdQ7qYCeg_rePDjPC3MvbNOUwiFRu1nZ4No_x94forUWKI0c7T-qc7nPuwT4kfdm7NADH679KIq6xDW1kAPCxVWMeAcefxw.OFh5IZZtobGgAu5P3PyMuw
    ${headers1}    Create Dictionary    'content-type'=application/json
    ${response}    requests.Post    ${restIp}    data=${inputData}    headers=${headers}    verify=${FALSE}
    ${api_output_json}    BuiltIn.Set Variable    ${response.json()}
    Log    ${api_output_json}
    ${value}    ngcscCommonMethods.Api Response Data Extraction    ${api_output_json}    contractsList
    LOg    ${value}
    ${all_ssrn_no}    Common.Getting serial Number from records    ${value}    softwareSupportReferenceNumber
    ${uniq_serial_No_in_list}    Collections.Remove Duplicates    ${all_ssrn_no}
    ${uniq_serial_No}    Collections.Get From List    ${uniq_serial_No_in_list}    0
    BuiltIn.Should Be Equal As Strings    ${uniq_serial_No}    152005129000
