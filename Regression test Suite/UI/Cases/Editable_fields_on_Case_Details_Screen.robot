*** Settings ***
Suite Setup       Common.Suite Setup For Edit Case Details    ${My_Juniper_Testing}    ${NGCSC1_token}
Suite Teardown    Selenium2Library.Close Browser
Resource          ../../Common.robot
Resource          ../../Variables.txt

*** Test Cases ***
Customer tracking should be editable
    Selenium2Library.Element Should Be Visible    //input[@id='custTrackingNumber']
    ${customer_tracking}    Generate Random String    40    [NUMBERS]abcdefghi
    Selenium2Library.Input Text    //input[@id='custTrackingNumber']    ${customer_tracking}
    Set Suite Variable    ${customer_tracking}

Synopsis should be editable
    Selenium2Library.Element Should Be Visible    //textarea[@id='caseDescription']
    ${synopsis}    Generate Random String    250    [LETTERS]
    Selenium2Library.Input Text    //textarea[@id='caseDescription']    ${synopsis}
    Set Suite Variable    ${synopsis}

System/Router Name should be editable
    Selenium2Library.Element Should Be Visible    //input[@id='routerName']
    ${router_Name}    Generate Random String    10    [NUMBERS][LETTERS]
    Selenium2Library.Input Text    //input[@id='routerName']    ${router_Name}
    Set Suite Variable    ${router_Name}

FollowUpMethodReferenceNumber should be editable
    Selenium2Library.Element Should Be Visible    //span[@id='spanFollowUpMethodPref']/div/div[1]
    ${follow_method_reference}    Create List    Email Full Text Update    Email Secure Web Link    Phone Call
    ${index}    Generate Random String    1    012
    ${value}    Get From List    ${follow_method_reference}    ${index}
    Comment    Selenium2Library.Select Radio Button    radioBtnGroup    ${value}
    Selenium2Library.Click Element    //span[@id='spanFollowUpMethodPref']/div/div[1]
    Comment    Selenium2Library.Click Element    //span[@id='spanFollowUpMethodPref']/div/div[2]/ul/li/label/input[@value='${value}']
    BuiltIn.Sleep    5s
    Comment    Selenium2Library.Select Radio Button    radioBtnGroup    ${value}
    Comment    BuiltIn.Sleep    5s
    Selenium2Library.Mouse Over    //span[@id='spanFollowUpMethodPref']/div/div[2]/ul/li/label/input[@value='${value}']
    Selenium2Library.Click Element    //span[@id='spanFollowUpMethodPref']/div/div[2]/ul/li[${index}]/label/span[2]
    BuiltIn.Sleep    15s
    Set Suite Variable    ${value}

PhoneCallBack should be editable
    BuiltIn.Sleep    5s
    Selenium2Library.Element Should Be Visible    //span[@id='spanPrfPhoneCountry']/div/div[1]
    Selenium2Library.Element Should Be Visible    //input[@id='prf_phone_no']
    Selenium2Library.Element Should Be Visible    //input[@id='prf_phone_ext']
    ${Preferred Country}    BuiltIn.Create List    AX    BM    DJ    EE    GR
    ${preferredCountryExtension}    BuiltIn.Create List    +358    1-441    +253    +49    +30
    ${PreferredPhoneNumber}    BuiltIn.Create List    34786    8895563    23455432    7756611    23456
    ${index}    Generate Random String    1    01234
    ${prefCountry}    Collections.Get From List    ${Preferred Country}    0
    ${prefExt}    Collections.Get From List    ${preferredCountryExtension}    ${index}
    ${prefPhone}    Collections.Get From List    ${PreferredPhoneNumber}    ${index}
    Comment    Selenium2Library.Click Element    //span[@id='spanPrfPhoneCountry']/div/div[1]
    Comment    Comment    BuiltIn.Sleep    5s
    Comment    Selenium2Library.Select Radio Button    radioBtnGroup    ${prefCountry}
    Comment    BuiltIn.Sleep    5s
    Set Suite Variable    ${prefCountry}
    Selenium2Library.Input Text    //input[@id='prf_phone_no']    ${prefPhone}
    BuiltIn.Sleep    2s
    Selenium2Library.Input Text    //input[@id='prf_phone_ext']    ${prefExt}
    BuiltIn.Sleep    2s
    ${preferredCallBackNUmber}    BuiltIn.Catenate    SEPARATOR=-    ${Preferred Country}    ${PreferredPhoneNumber}    ${preferredCountryExtension}
    Set Suite Variable    ${preferredCallBackNUmber}

Add Inbound Email Address to Email Recipients should be editable
    Selenium2Library.Element Should Be Enabled    //div[@id="case_details"]/div/div[2]/div[2]/section[3]/div[8]/div/div[2]/label[1]/span[4]
    Selenium2Library.Element Should Be Enabled    //div[@id="case_details"]/div/div[2]/div[2]/section[3]/div[8]/div/div[2]/label[2]/span[4]
    Sleep    2s

Contact Email should be editable
    Selenium2Library.Element Should Be Visible    //div[@id='divCCList']/div/div[2]/input
    ${ccCustomer}    Create List    mabbas@brightroll.com    jalissoutin@expertsystechnologies.com    rda@rincon.com    jake@sonicequipment.com    jarroded@icloud.com
    ${index}    Generate Random String    1    01234
    ${ccCustomer_value}    Get From List    ${ccCustomer}    ${index}
    Selenium2Library.Input Text    //div[@id='divCCList']/div/div[2]/input    ${ccCustomer_value}
    Sleep    10s
    Selenium2Library.Press Key    //div[@id='divCCList']/div/div[2]/input    \\13
    Sleep    10s
    Set Suite Variable    ${ccCustomer_value}

Verify the Case Edit Changes
    Selenium2Library.Click Button    //input[@id='btnSave']
    Sleep    5s
    Comment    Selenium2Library.Close Browser
    Comment    Common.Open Browser with title Validation    ${My_Juniper_Testing}
    Comment    Sleep    5s
    Selenium2Library.Click Element    //div[@id='nxcsc-banner-case-manager-view']/section/div/header/div[1]/span/i
    Sleep    5s
    Comment    Common.Click On Cases
    Comment    Sleep    5s
    Comment    Selenium2Library.Click Element    //ul[@id='nxcsc-tabbed-table-tabs-main']/li[3]    #Click on Open Tab
    Comment    Sleep    5s
    Comment    Selenium2Library.Click Button    //div[@id='cases_tabview_cases_tabbed_table']/div/section/div/div/div/div[1]/button[1]    #Click on Filter Options
    Comment    Sleep    5s
    Comment    Selenium2Library.Input Text    //input[@id='rc-input-srId']    2017-0906-T-1125
    Sleep    5s
    Selenium2Library.Click Element    //div[@id='jnprDataTableContent_cases_ngcsc_subtab_all_open_cases']/div[2]/div/div[1]/div[3]/div[1]/div/div[1]/div[2]/div/div[1]/div/div/div/div/span
    BuiltIn.sleep    10s
    ${customer_tracking_text}    Selenium2Library.Get Text    //div[@id='case_details']/div/div[2]/div[1]/section[1]/div[5]/div[1]/div[2]
    Should Be Equal As Strings    ${customer_tracking_text}    ${customer_tracking}
    ${synopsis_text}    Selenium2Library.Get Text    //div[@id="case_details"]/div/div[2]/div[1]/section[1]/div[8]/div/div[2]
    Should Be Equal As Strings    ${synopsis_text}    ${synopsis}
    ${router_text}    Selenium2Library.Get Text    //div[@id="case_details"]/div/div[2]/div[2]/section[1]/div[7]/div/div[2]
    Should Be Equal As Strings    ${router_text}    ${router_Name}
    Comment    ${follow_method_text}    Selenium2Library.Get Text    //div[@id='case_details']/div/div[2]/div[2]/section[3]/div[5]/div/div[2]
    Comment    Should Be Equal As Strings    ${follow_method_text}    ${value}
    Comment    ${preferred_Call_Back_text}    Selenium2Library.Get Text    //div[@id='case_details']/div/div[2]/div[2]/section[3]/div[6]/div/div[2]
    Comment    Should Be Equal As Strings    ${preferred_Call_Back_text}    ${preferredCallBackNUmber}
    Comment    ${Add_Inbound_text}    Selenium2Library.Get Text
    Comment    Should Be Equal As Strings    ${Add_Inbound_text}
    ${emailCC_text}    Selenium2Library.Get Text    //div[@id='case_details']/div/div[2]/div[2]/section[3]/div[9]/div/div[2]
    List Should Contain Value    ${emailCC_text}    ${ccCustomer_value}
