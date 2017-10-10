*** Settings ***
Suite Setup       Common.Open Browser with title Validation    ${My_Juniper_Testing}
Suite Teardown    Common.Logout
Resource          ../../Common.robot
Library           Selenium2Library
Resource          ../../Variables.txt

*** Test Cases ***
Related Content - Cases
    [Tags]    test
    Click Element    xpath=//*[@class='nxcsc-tab-new '][1]
    Click Element    xpath=//*[@id='nxcsc-tab-opt-settings-cases']
    sleep    5s
    Click Element    xpath=//*[@class='headerBlockWrapper'][4]
    sleep    5s
    Element Should Be Visible    xpath=//a[contains(text(),'Go to Case Manager')]
    Element Should Be Visible    xpath=//a[contains(text(),' \ \ \ Open RMAs \ \ \ ')]
    Element Should Be Visible    xpath=//a[contains(text(),'Generate RMA Licenses')]
    Click Button    xpath=//*[@id='nxcsc-widgetdel-cases_related_contents']
    Click Button    xpath=//*[@class='btn-delete']
    sleep    2s

Related Content - Contracts
    [Tags]    test
    Click Element    xpath=//*[@class='nxcsc-tab-new'][3]
    Click Element    xpath=//*[@id='nxcsc-tab-opt-settings-contracts']
    sleep    5s
    Click Element    xpath=//*[@class='headerBlockWrapper'][4]
    sleep    5s
    Element Should Be Visible    xpath=//a[contains(text(),'Serial Number Entitlement')]
    Element Should Be Visible    xpath=//a[contains(text(),' Find License Keys ')]
    Element Should Be Visible    xpath=//a[contains(text(),' Generate Product Licenses ')]
    Element Should Be Visible    xpath=//a[contains(text(),' Generate RMA License ')]
    Click Button    xpath=//*[@id='nxcsc-widgetdel-contracts_related_contents']
    Click Button    xpath=//*[@class='btn-delete']
    Sleep    2s

Related Content - Products
    [Tags]    test
    Click Element    xpath=//*[@class='nxcsc-tab-new'][3]
    Click Element    xpath=//*[@id='nxcsc-tab-opt-settings-installbases']
    sleep    5s
    Click Element    xpath=//*[@class='headerBlockWrapper'][4]
    sleep    5s
    Element Should Be Visible    xpath=//a[contains(text(),' Serial Number Entitlement ')]
    Element Should Be Visible    xpath=//a[contains(text(),' Product & Subscription Registration ')]
    Element Should Be Visible    xpath=//a[contains(text(),' Update Install Base ')]
    Element Should Be Visible    xpath=//a[contains(text(),' Manage License Keys ')]
    Click Button    xpath=//*[@id='nxcsc-widgetdel-installbases_related_contents']
    Click Button    xpath=//*[@class='btn-delete']
