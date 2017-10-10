*** Settings ***
Suite Setup       Common.Setup For Case Detail UI    ${My_Juniper_Testing}    ${NGCSC1_token}    ${Case ID}
Suite Teardown    Selenium2Library.Close Browser
Resource          ../../Common.robot
Resource          ../../Variables.txt

*** Variables ***
${Case ID}        2017-0814-T-1709
@{Button_Under_Case_Details}    Escalate    Change Priority    Request Closure    Request A Call
@{Case Details Fields}    Case Details    Case ID:\n2017-0427-T-2170\nType:\nTechnical Service Request    Priority:\nP4 - Low\nCreate Date:\n27-APR-2017 09:36:26 (PST/PDT)    Status:\nDispatch\nLast Modified:\n30-MAY-2017 01:04:54 (PST/PDT)    Owner:\n0000007518\nClosed Date:\n11-FEB-2030 00:00:00 (PST/PDT)    Escalation:\nCategories:\nFirefly,Main    Customer Tracking #:\nfrank test case -- 123
...               Synopsis:\nfrank test case --enjoy your myJ development11 - Thanks! 123
@{Product Details}    Product Details    Serial #/Software Support Ref #:\nhelp_outline\nSUB00019940428/152115129000    System/Router Name:    Series:\nFirefly    Platform:\nHost (formerly vGW)    Release:\n15.1    Version:\nF6
@{Account Details}    Account Details    Account Name - Account ID:\nPALMER TECHNOLOGIES - 0101274682
@{Contact Details}    Contact Detail    Contact Name:\nFelicity Smoak    Contact Email:\nngcsc1@ngcsc.33mail.com    Follow Up Method Preference:\nEmail Secure Web Link    Preferred Call Back/Telephone #:    \    ${EMPTY}
...               Add Inbound Email Address to Email Recipients field:\nhelp_outline\nYes\nNo    Contact Phone:\n+4087474268    Email CC:\nvartulg@juniper.net
@{Cases_Details_Description_left_Side}    Synopsis    Case ID    Created On    Priority    Last Modified    Customer Tracking #    Case Type
...               Status    Product Series    Platform
@{Case Fields}    Priority:    Status:    Escalation:    Case Type:    Categories:    Case Owner:    Customer Tracking #:
...               Created Date:    Closed Date:    Last Modified Date:    Synopsis
@{Product Fields}    Serial #/Software Support Ref #:\nhelp_outline    Series:    Platform:    Release:    Version:    System/Router Name:
@{Contact Details Fields}    Contact Name:    Contact Email:    Contact Phone:    Follow Up Method Preference:    Preferred Call Back/Telephone #:    Add Inbound Email Address to Email Recipients field:\nhelp_outline    Email CC:

*** Test Cases ***
Navigate to Case Details Screen when clicking case ID from Cases grid
    [Tags]    test1
    BuiltIn.Sleep    5s
    Selenium2Library.Mouse Over    //ul[@id='nxcsc-tabbed-table-tabs-main']/li[3]
    Selenium2Library.Click Element    //ul[@id='nxcsc-tabbed-table-tabs-main']/li[3]
    BuiltIn.Sleep    5s
    Selenium2Library.Click Element    //div[@id='cases_tabview_cases_tabbed_table']/div/section/div/div/div/div[1]/button[1]
    BuiltIn.Sleep    5s
    Selenium2Library.Input Text    //input[@id='rc-input-srId']    ${Case ID}
    BuiltIn.Sleep    5s
    Comment    Selenium2Library.Click Element    //div[@id='jnprDataTableContent_cases_ngcsc_subtab_my_reported_cases']/div[2]/div/div[1]/div[3]/div[1]/div/div[1]/div[2]/div/div[1]/div/div/div/div/span
    Selenium2Library.Click Element    //div[@id='jnprDataTableContent_cases_ngcsc_subtab_all_open_cases']/div[2]/div/div[1]/div[3]/div/div/div[1]/div[2]/div/div[1]/div/div/div/div/span
    BuiltIn.Sleep    10s
    ${new_screen_text}    Selenium2Library.Get Text    //div[@id='nxcsc-banner-case-manager-view']/section/div/header/div[1]
    Log    ${new_screen_text}
    ${first}    ${last}    String.Split String    ${new_screen_text}    /    1
    Comment    BuiltIn.Should Be Equal As Strings    ${last}    BACK / CASE ID: ${Case ID}
    Comment    ${all_webelements}    Selenium2Library.Get Webelements    //div[@id='jnprDataTableContent_cases_ngcsc_subtab_my_reported_cases']/div[2]/div/div[1]/div[3]/div/div/div[1]/div[2]/div/div[1]/div/div/div/div
    Comment    ${all_caseid}    Common.getting elements text from allwebelements    ${all_webelements}
    Comment    Log    ${all_caseid}
    log    ${last}
    BuiltIn.Should Be Equal    ${last}    Case ID: ${Case ID}

Verify the fields on Header
    [Tags]    test1
    ${header_text}    Selenium2Library.Get Text    //div[@id='nxcsc-banner-case-manager-view']/section/div/header/div[2]/div[1]
    Log    ${header_text}
    ${header_data}    String.Split String    ${header_text}    |
    ${priority_data}    Collections.Get From List    ${header_data}    0
    ${Status_data}    Collections.Get From List    ${header_data}    1
    ${case_type}    Collections.Get From List    ${header_data}    2
    ${priority_api}    Collections.Get From List    ${case_detail_values}    1
    ${status_api}    Collections.Get From List    ${case_detail_values}    5
    ${type_api}    Collections.Get From List    ${case_detail_values}    7
    ${priority_text}    BuiltIn.Catenate    SEPARATOR=:${SPACE}    Priority    ${priority_api}
    ${status_text}    BuiltIn.Catenate    SEPARATOR=:${SPACE}    Status    ${status_api}
    ${type_text}    BuiltIn.Catenate    SEPARATOR=:${SPACE}    Type    ${type_api}
    BuiltIn.Should Be Equal    ${priority_data}    ${priority_text}
    BuiltIn.Should Be Equal    ${Status_data}    ${status_text}
    BuiltIn.Should Be Equal    ${case_type}    ${type_text}

verfiy the button available
    [Tags]    test1
    BuiltIn.sleep    5s
    ${all_button_webElements}    Selenium2Library.Get Webelements    //div[@id='nxcsc-banner-case-manager-view']/section/div/section/section[1]/button
    ${Button_Available_Under_CaseDetails}    Common.getting elements text from allwebelements    ${all_button_webElements}
    Collections.Lists Should Be Equal    ${Button_Available_Under_CaseDetails}    ${Button_Under_Case_Details}

Visible Fields Under Case Description
    [Tags]    test1
    ${Case Detail_text}    Selenium2Library.Get Text    //div[@id='case_details']/div/div[2]/div[1]/section[1]/div[1]
    BuiltIn.Should Be Equal    ${Case Detail_text}    Case Details
    BuiltIn.sleep    5s
    ${all_webelements_case_details}    Selenium2Library.Get Webelements    //div[@id='case_details']/div/div[2]/div[1]/section[1]/div
    ${all_text_under_caseDetails}    Common.getting elements text from allwebelements    ${all_webelements_case_details}
    Log    ${all_text_under_caseDetails}
    Comment    Collections.Lists Should Be Equal    ${all_text_under_caseDetails}    ${Case Details Fields}
    ${priority_field}    Selenium2Library.Get Text    //div[@id="case_details"]/div/div[2]/div[1]/section[1]/div[2]/div[1]/div[1]
    ${priority_value}    Selenium2Library.Get Text    //div[@id="case_details"]/div/div[2]/div[1]/section[1]/div[2]/div[1]/div[2]
    ${status_field}    Selenium2Library.Get Text    //div[@id="case_details"]/div/div[2]/div[1]/section[1]/div[2]/div[2]/div[1]
    ${status_Value}    Selenium2Library.Get Text    //div[@id="case_details"]/div/div[2]/div[1]/section[1]/div[2]/div[2]/div[2]
    ${escalation_field}    Selenium2Library.Get Text    //div[@id="case_details"]/div/div[2]/div[1]/section[1]/div[3]/div[1]/div[1]
    ${escalation_value}    Selenium2Library.Get Text    //div[@id="case_details"]/div/div[2]/div[1]/section[1]/div[3]/div[1]/div[2]
    ${escalation_value}    Set Variable If    '${escalation_value}' == '${EMPTY}'    ${None}    ${escalation_value}
    ${case_type_field}    Selenium2Library.Get Text    //div[@id="case_details"]/div/div[2]/div[1]/section[1]/div[3]/div[2]/div[1]
    ${case_type_value}    Selenium2Library.Get Text    //div[@id="case_details"]/div/div[2]/div[1]/section[1]/div[3]/div[2]/div[2]
    ${categories_field}    Selenium2Library.Get Text    //div[@id="case_details"]/div/div[2]/div[1]/section[1]/div[4]/div[1]/div[1]
    ${categories_values}    Selenium2Library.Get Text    //div[@id="case_details"]/div/div[2]/div[1]/section[1]/div[4]/div[1]/div[2]
    ${Case_owner_field}    Selenium2Library.Get Text    //div[@id="case_details"]/div/div[2]/div[1]/section[1]/div[4]/div[2]/div[1]
    ${Case_owner_value}    Selenium2Library.Get Text    //div[@id="case_details"]/div/div[2]/div[1]/section[1]/div[4]/div[2]/div[2]
    ${customer_tracking_field}    Selenium2Library.Get Text    //div[@id="case_details"]/div/div[2]/div[1]/section[1]/div[5]/div[1]/div[1]
    ${customer_tracking_value}    Selenium2Library.Get Text    //div[@id="case_details"]/div/div[2]/div[1]/section[1]/div[5]/div[1]/div[2]
    ${created_date_field}    Selenium2Library.Get Text    //div[@id="case_details"]/div/div[2]/div[1]/section[1]/div[5]/div[2]/div[1]
    ${created_date_value}    Selenium2Library.Get Text    //div[@id="case_details"]/div/div[2]/div[1]/section[1]/div[5]/div[2]/div[2]
    ${case_closed_date_field}    Selenium2Library.Get Text    //div[@id="case_details"]/div/div[2]/div[1]/section[1]/div[6]/div[2]/div[1]
    ${case_closed_date_value}    Selenium2Library.Get Text    //div[@id="case_details"]/div/div[2]/div[1]/section[1]/div[6]/div[2]/div[2]
    ${case_closed_date_value}    Set Variable If    '${case_closed_date_value}' == '${EMPTY}'    ${None}    ${case_closed_date_value}
    ${last_modified_date_field}    Selenium2Library.Get Text    //div[@id="case_details"]/div/div[2]/div[1]/section[1]/div[7]/div[2]/div[1]
    ${last_modified_date_value}    Selenium2Library.Get Text    //div[@id="case_details"]/div/div[2]/div[1]/section[1]/div[7]/div[2]/div[2]
    ${synposis_field}    Selenium2Library.Get Text    //div[@id="case_details"]/div/div[2]/div[1]/section[1]/div[8]/div/div[1]
    ${synopsis_value}    Selenium2Library.Get Text    //div[@id="case_details"]/div/div[2]/div[1]/section[1]/div[8]/div/div[2]
    ${Case_details_Fields}    BuiltIn.Create List    ${priority_field}    ${status_field}    ${escalation_field}    ${case_type_field}    ${categories_field}
    ...    ${Case_owner_field}    ${customer_tracking_field}    ${created_date_field}    ${case_closed_date_field}    ${last_modified_date_field}    ${synposis_field}
    Collections.Lists Should Be Equal    ${Case_details_Fields}    ${Case Fields}
    ${Case Details Values }    BuiltIn.Create List    ${Case ID}    ${priority_value}    ${escalation_value}    ${customer_tracking_value}    ${synopsis_value}
    ...    ${status_Value}    ${reason_sr}    ${case_type_value}    ${Case_owner_value}    ${created_date_value}    ${case_closed_date_value}
    ...    ${last_modified_date_value}
    Log    ${Case Details Values }
    Collections.Lists Should Be Equal    ${Case Details Values }    ${case_detail_values_UI}
    BuiltIn.Should Be Equal    ${categories_values}    ${categories}

Verify Problem Description
    [Tags]    test1
    BuiltIn.Sleep    5s
    ${Problem_Description_field}    Selenium2Library.Get Text    //div[@id='caseDetailProblemDescription']/div/div[1]/div/div/span[1]
    BuiltIn.Should Be Equal As Strings    ${Problem_Description_field}    Problem Description
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ${tdline1}    Generate Random String    200    [LETTERS]
    ${tdline2}    Generate Random String    2000    [LETTERS]
    ngcscCommonMethods.send notes message    cases_notes    ${tdline1}    ${tdline2}    ${Case ID}    ${msgRcdTs}
    BuiltIn.Sleep    60s
    ${notelog_script}    BuiltIn.Catenate    SEPARATOR=    ${tdline1}    ${tdline2}
    BuiltIn.Sleep    5s
    Selenium2Library.Input Text    //section[@id='nxcsc-global-search-container']/input    ${Case ID}
    Selenium2Library.Press Key    //section[@id='nxcsc-global-search-container']/input    \\13
    Sleep    5s
    Selenium2Library.Click Element    //div[@id='jnprDataTableContent_search_function_tab_cases']/div/div/div[2]/div/div[1]/div[3]/div/div/div[1]/div[2]/div/div[1]/div/div/div/div/span
    Sleep    10s
    ${Problem_Description_text}    Selenium2Library.Get Text    //div[@id='caseDetailProblemDescription']/div/div[2]/div/div[1]
    BuiltIn.Should Be Equal    ${notelog_script}    ${Problem_Description_text}

Visible Fields Under Product details
    [Tags]    test1
    ${Product Detail_text}    Selenium2Library.Get Text    //div[@id='case_details']/div/div[2]/div[2]/section[1]/div[1]
    BuiltIn.Should Be Equal    ${Product Detail_text}    Product Details
    BuiltIn.Sleep    5s
    ${all_webelements_Product_Details}    Selenium2Library.Get Webelements    //div[@id='case_details']/div/div[2]/div[2]/section[1]/div
    ${Product_details_text}    Common.getting elements text from allwebelements    ${all_webelements_Product_Details}
    Log    ${Product_details_text}
    Comment    Collections.Lists Should Be Equal    ${Product_details_text}    ${Product Details}
    ${serial_ssrn_field}    Selenium2Library.Get Text    //div[@id='case_details']/div/div[2]/div[2]/section[1]/div[2]/div/div[1]
    ${serial_ssrn_value}    Selenium2Library.Get Text    //div[@id='case_details']/div/div[2]/div[2]/section[1]/div[2]/div/div[2]
    ${series_field}    Selenium2Library.Get Text    //div[@id='case_details']/div/div[2]/div[2]/section[1]/div[3]/div/div[1]
    ${series_value}    Selenium2Library.Get Text    //div[@id='case_details']/div/div[2]/div[2]/section[1]/div[3]/div/div[2]
    ${product_field}    Selenium2Library.Get Text    //div[@id='case_details']/div/div[2]/div[2]/section[1]/div[4]/div/div[1]
    ${product_value}    Selenium2Library.Get Text    //div[@id='case_details']/div/div[2]/div[2]/section[1]/div[4]/div/div[2]
    ${release_field}    Selenium2Library.Get Text    //div[@id='case_details']/div/div[2]/div[2]/section[1]/div[5]/div/div[1]
    ${release_value}    Selenium2Library.Get Text    //div[@id='case_details']/div/div[2]/div[2]/section[1]/div[5]/div/div[2]
    ${version_field}    Selenium2Library.Get Text    //div[@id='case_details']/div/div[2]/div[2]/section[1]/div[6]/div/div[1]
    ${version_value}    Selenium2Library.Get Text    //div[@id='case_details']/div/div[2]/div[2]/section[1]/div[6]/div/div[2]
    ${system_router_field}    Selenium2Library.Get Text    //div[@id='case_details']/div/div[2]/div[2]/section[1]/div[7]/div/div[1]
    ${system_router_value}    Selenium2Library.Get Text    //div[@id='case_details']/div/div[2]/div[2]/section[1]/div[7]/div/div[2]
    ${product _details_fields}    Create List    ${serial_ssrn_field}    ${series_field}    ${product_field}    ${release_field}    ${version_field}
    ...    ${system_router_field}
    Log    ${product _details_fields}
    Collections.Lists Should Be Equal    ${product _details_fields}    ${Product Fields}
    ${product_details_values}    Create List    ${serial_ssrn_value}    ${series_value}    ${product_value}    ${release_value}    ${version_value}
    ...    ${system_router_value}
    Log    ${product_details_values}
    Collections.Lists Should Be Equal    ${product_details_values}    ${Product Values}

Verify help outline under product description
    [Tags]    test1
    ${help_text}    Selenium2Library.Get Text    //i[@id='help-icon'][1]
    Log    ${help_text}
    BuiltIn.Should Be Equal As Strings    ${help_text}    help_outline

Visible fields Under Account Details
    [Tags]    test1
    ${Product Detail_text}    Selenium2Library.Get Text    //div[@id='case_details']/div/div[2]/div[2]/section[2]/div[1]
    BuiltIn.Should Be Equal    ${Product Detail_text}    Account Details
    BuiltIn.Sleep    5s
    ${all_webelements_Account_Details}    Selenium2Library.Get Webelements    //div[@id='case_details']/div/div[2]/div[2]/section[2]/div
    ${Account_Details_text}    Common.getting elements text from allwebelements    ${all_webelements_Account_Details}
    Log    ${Account_Details_text}
    Comment    Collections.Lists Should Be Equal    ${Account_Details_text}    ${Account Details}
    ${account Field}    Selenium2Library.Get Text    //div[@id='case_details']/div/div[2]/div[2]/section[2]/div[2]/div/div[1]
    BuiltIn.Should Be Equal    ${account Field}    Account:
    ${account detail value}    Selenium2Library.Get Text    //div[@id='case_details']/div/div[2]/div[2]/section[2]/div[2]/div/div[2]
    log    ${Account Value}
    log    ${account detail value}
    BuiltIn.Should Be Equal    ${account detail value}    ${Account Value}

Visible fields Under Contact details
    [Tags]    test1
    ${Contact Detail_text}    Selenium2Library.Get Text    //div[@id='case_details']/div/div[2]/div[2]/section[3]/div[1]
    BuiltIn.Should Be Equal    ${Contact Detail_text}    Contact Details
    BuiltIn.Sleep    5s
    ${all_webelements_Contact_Details}    Selenium2Library.Get Webelements    //div[@id='case_details']/div/div[2]/div[2]/section[3]/div
    ${Contact_Details_text}    Common.getting elements text from allwebelements    ${all_webelements_Contact_Details}
    Log    ${Contact_Details_text}
    Comment    Collections.Lists Should Be Equal    ${Contact_Details_text}    ${Contact Details}
    ${Name Field}    Selenium2Library.Get Text    //div[@id='case_details']/div/div[2]/div[2]/section[3]/div[2]/div/div[1]
    ${name value}    Selenium2Library.Get Text    //div[@id='case_details']/div/div[2]/div[2]/section[3]/div[2]/div/div[2]
    ${Email Field}    Selenium2Library.Get Text    //div[@id='case_details']/div/div[2]/div[2]/section[3]/div[3]/div/div[1]
    ${email value}    Selenium2Library.Get Text    //div[@id='case_details']/div/div[2]/div[2]/section[3]/div[3]/div/div[2]
    ${phone field}    Selenium2Library.Get Text    //div[@id='case_details']/div/div[2]/div[2]/section[3]/div[4]/div/div[1]
    ${phone value}    Selenium2Library.Get Text    //div[@id='case_details']/div/div[2]/div[2]/section[3]/div[4]/div/div[2]
    ${follow method field}    Selenium2Library.Get Text    //div[@id='case_details']/div/div[2]/div[2]/section[3]/div[5]/div/div[1]
    ${follow method value}    Selenium2Library.Get Text    //div[@id='case_details']/div/div[2]/div[2]/section[3]/div[5]/div/div[2]
    ${preferred call back field}    Selenium2Library.Get Text    //div[@id='case_details']/div/div[2]/div[2]/section[3]/div[6]/div/div[1]
    ${preferred call back value}    Selenium2Library.Get Text    //div[@id='case_details']/div/div[2]/div[2]/section[3]/div[6]/div/div[2]
    ${add inbound field}    Selenium2Library.Get Text    //div[@id='case_details']/div/div[2]/div[2]/section[3]/div[8]/div/div[1]
    ${add inbound value}    Selenium2Library.Radio Button Should Be Set To    do_not_copy_cc    yes
    ${email cc field}    Selenium2Library.Get Text    //div[@id='case_details']/div/div[2]/div[2]/section[3]/div[9]/div/div[1]
    ${email cc value}    Selenium2Library.Get Text    //div[@id='case_details']/div/div[2]/div[2]/section[3]/div[9]/div/div[2]
    ${Contact Fields}    BuiltIn.Create List    ${Name Field}    ${Email Field}    ${follow method field}    ${preferred call back field}    ${add inbound field}
    ...    ${email cc field}    ${phone field}
    Collections.Lists Should Be Equal    ${Contact Fields}    ${Contact Details Fields}
    ${Contact values}    BuiltIn.Create List    ${name value}    ${email value}    ${follow method value}    ${preferred call back value}    ${None}
    ...    ${email cc value}    ${phone value}
    Log    ${Contact values}
    Collections.Insert Into List    ${contact detail dict}    3    ${preferred_call_back_ui}
    Collections.Lists Should Be Equal    ${Contact values}    ${contact detail dict}

Default value of Problem Description text box should be 1500
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    ${tdline1}    Generate Random String    700    [LETTERS]
    ${tdline2}    Generate Random String    800    [LETTERS]
    ngcscCommonMethods.send notes message    cases_notes    ${tdline1}    ${tdline2}    ${Case ID}    ${msgRcdTs}
    BuiltIn.Sleep    60s
    ${notelog_script}    BuiltIn.Catenate    SEPARATOR=    ${tdline1}    ${tdline2}
    ${Problem_Description_text}    Selenium2Library.Get Text    //div[@id='caseDetailProblemDescription']/div/div[2]/div/div[1]
    BuiltIn.Should Be Equal    ${notelog_script}    ${Problem_Description_text}
    ${text_shown_below_textbox}    Selenium2Library.Get Text    //div[@id='caseDetailProblemDescription']/div/div[2]/div/div[2]
    Log    ${text_shown_below_textbox}
    BuiltIn.Should Be Equal As Strings    ${text_shown_below_textbox}    1500 of 2000
    ${msgRcdTs}    ngcscCommonMethods.current date in epoch
    Comment    Send the message with 1000 chararacters problem descritpion
    ${tdline1}    Generate Random String    600    [LETTERS]
    ${tdline2}    Generate Random String    400    [LETTERS]
    ngcscCommonMethods.send notes message    cases_notes    ${tdline1}    ${tdline2}    ${Case ID}    ${msgRcdTs}
    BuiltIn.Sleep    60s
    ${notelog_script}    BuiltIn.Catenate    SEPARATOR=    ${tdline1}    ${tdline2}
    ${Problem_Description_text}    Selenium2Library.Get Text    //div[@id='caseDetailProblemDescription']/div/div[2]/div/div[1]
    BuiltIn.Should Be Equal    ${notelog_script}    ${Problem_Description_text}
    ${text_shown_below_textbox}    Selenium2Library.Get Text    //div[@id='caseDetailProblemDescription']/div/div[2]/div/div[2]
    Log    ${text_shown_below_textbox}
    ${text_shown_below_textbox}    Selenium2Library.Get Text    //div[@id='caseDetailProblemDescription']/div/div[2]/div/div[2]
    BuiltIn.Should Be Equal As Strings    ${text_shown_below_textbox}    1000 of 2000
    Selenium2Library.Element Should Not Be Visible    //div[@id='caseDetailProblemDescription']/div/div[1]/div/div/span[2]/i
    Comment    Send the message with 2000 chararacters problem descritpion
    ${tdline1}    Generate Random String    1500    [LETTERS]
    ${tdline2}    Generate Random String    500    [LETTERS]
    ngcscCommonMethods.send notes message    cases_notes    ${tdline1}    ${tdline2}    ${Case ID}    ${msgRcdTs}
    BuiltIn.Sleep    60s
    ${notelog_script}    BuiltIn.Catenate    SEPARATOR=    ${tdline1}    ${tdline2}
    Selenium2Library.Element Should Be Visible    //div[@id='caseDetailProblemDescription']/div/div[1]/div/div/span[2]/i
    Selenium2Library.Click Element    //div[@id='caseDetailProblemDescription']/div/div[1]/div/div/span[2]/i
    ${Problem_Description_text}    Selenium2Library.Get Text    //div[@id='caseDetailProblemDescription']/div/div[2]/div/div[1]
    BuiltIn.Should Be Equal    ${notelog_script}    ${Problem_Description_text}
    ${text_shown_below_textbox}    Selenium2Library.Get Text    //div[@id='caseDetailProblemDescription']/div/div[2]/div/div[2]
    Log    ${text_shown_below_textbox}
    BuiltIn.Should Be Equal As Strings    ${text_shown_below_textbox}    2000 of 2750
    Comment    Send the message with 300 chararacters problem descritpion
    ${tdline1}    Generate Random String    100    [LETTERS]
    ${tdline2}    Generate Random String    200    [LETTERS]
    ngcscCommonMethods.send notes message    cases_notes    ${tdline1}    ${tdline2}    ${Case ID}    ${msgRcdTs}
    BuiltIn.Sleep    60s
    ${notelog_script}    BuiltIn.Catenate    SEPARATOR=    ${tdline1}    ${tdline2}
    Selenium2Library.Element Should Not Be Visible    //div[@id='caseDetailProblemDescription']/div/div[1]/div/div/span[2]/i
    Comment    Selenium2Library.Click Element    //div[@id='caseDetailProblemDescription']/div/div[1]/div/div/span[2]/i
    ${Problem_Description_text}    Selenium2Library.Get Text    //div[@id='caseDetailProblemDescription']/div/div[2]/div/div[1]
    BuiltIn.Should Be Equal    ${notelog_script}    ${Problem_Description_text}
    ${text_shown_below_textbox}    Selenium2Library.Get Text    //div[@id='caseDetailProblemDescription']/div/div[2]/div/div[2]
    Log    ${text_shown_below_textbox}
    BuiltIn.Should Be Equal As Strings    ${text_shown_below_textbox}    300 of 300
    Comment    Send the message with 4000 chararacters problem descritpion
    ${tdline1}    Generate Random String    2000    [LETTERS]
    ${tdline2}    Generate Random String    2000    [LETTERS]
    ngcscCommonMethods.send notes message    cases_notes    ${tdline1}    ${tdline2}    ${Case ID}    ${msgRcdTs}
    BuiltIn.Sleep    60s
    ${notelog_script}    BuiltIn.Catenate    SEPARATOR=    ${tdline1}    ${tdline2}
    Selenium2Library.Element Should Be Visible    //div[@id='caseDetailProblemDescription']/div/div[1]/div/div/span[2]/i
    Selenium2Library.Click Element    //div[@id='caseDetailProblemDescription']/div/div[1]/div/div/span[2]/i
    ${Problem_Description_text}    Selenium2Library.Get Text    //div[@id='caseDetailProblemDescription']/div/div[2]/div/div[1]
    BuiltIn.Should Be Equal    ${notelog_script}    ${Problem_Description_text}
    ${text_shown_below_textbox}    Selenium2Library.Get Text    //div[@id='caseDetailProblemDescription']/div/div[2]/div/div[2]
    Log    ${text_shown_below_textbox}
    BuiltIn.Should Be Equal As Strings    ${text_shown_below_textbox}    4000 of 4000
    Comment    Send the message with 15000 chararacters problem descritpion
    ${tdline1}    Generate Random String    2000    [LETTERS]
    ${tdline2}    Generate Random String    13000    [LETTERS]
    ngcscCommonMethods.send notes message    cases_notes    ${tdline1}    ${tdline2}    ${Case ID}    ${msgRcdTs}
    BuiltIn.Sleep    60s
    ${notelog_script}    BuiltIn.Catenate    SEPARATOR=    ${tdline1}    ${tdline2}
    Selenium2Library.Element Should Be Visible    //div[@id='caseDetailProblemDescription']/div/div[1]/div/div/span[2]/i
    Selenium2Library.Click Element    //div[@id='caseDetailProblemDescription']/div/div[1]/div/div/span[2]/i
    ${Problem_Description_text}    Selenium2Library.Get Text    //div[@id='caseDetailProblemDescription']/div/div[2]/div/div[1]
    BuiltIn.Should Be Equal    ${notelog_script}    ${Problem_Description_text}
    ${text_shown_below_textbox}    Selenium2Library.Get Text    //div[@id='caseDetailProblemDescription']/div/div[2]/div/div[2]
    Log    ${text_shown_below_textbox}
    BuiltIn.Should Be Equal As Strings    ${text_shown_below_textbox}    15000 of 15000
    Comment    Send the message with 15001 chararacters problem descritpion
    ${tdline1}    Generate Random String    2000    [LETTERS]
    ${tdline2}    Generate Random String    13001    [LETTERS]
    ngcscCommonMethods.send notes message    cases_notes    ${tdline1}    ${tdline2}    ${Case ID}    ${msgRcdTs}
    BuiltIn.Sleep    60s
    ${notelog_script}    BuiltIn.Catenate    SEPARATOR=    ${tdline1}    ${tdline2}
    Selenium2Library.Element Should Be Visible    //div[@id='caseDetailProblemDescription']/div/div[1]/div/div/span[2]/i
    Selenium2Library.Click Element    //div[@id='caseDetailProblemDescription']/div/div[1]/div/div/span[2]/i
    ${Problem_Description_text}    Selenium2Library.Get Text    //div[@id='caseDetailProblemDescription']/div/div[2]/div/div[1]
    BuiltIn.Should Be Equal    ${notelog_script}    ${Problem_Description_text}
    ${text_shown_below_textbox}    Selenium2Library.Get Text    //div[@id='caseDetailProblemDescription']/div/div[2]/div/div[2]
    Log    ${text_shown_below_textbox}
    BuiltIn.Should Be Equal As Strings    ${text_shown_below_textbox}    15000 of 15000

Case Detail Screen should come from Global Search
    BuiltIn.Sleep    5s
    Selenium2Library.Input Text    //section[@id='nxcsc-global-search-container']/input    ${Case ID}
    Selenium2Library.Press Key    //section[@id='nxcsc-global-search-container']/input    \\13
    Sleep    5s
    Selenium2Library.Click Element    //div[@id='jnprDataTableContent_search_function_tab_cases']/div/div/div[2]/div/div[1]/div[3]/div/div/div[1]/div[2]/div/div[1]/div/div/div/div/span
    BuiltIn.Sleep    10s
    ${new_screen_text}    Selenium2Library.Get Text    //div[@id='nxcsc-banner-case-manager-view']/section/div/header/div[1]
    Log    ${new_screen_text}
    ${first}    ${last}    String.Split String    ${new_screen_text}    /    1
    log    ${last}
    BuiltIn.Should Be Equal    ${last}    Case ID: ${Case ID}

Buttons should not be visible in case of "Read only" permissions
    Selenium2Library.Close Browser
    Selenium2Library.Open Browser    https://${My_Juniper_Testing}    Chrome
    ${title}    Selenium2Library.Get Title
    #Selenium2Library.Title Should Be    MyJuniper
    sleep    5s
    Selenium2Library.Input Text    //input[@id='userid']    ngcsc2@ngcsc.33mail.com
    Selenium2Library.Input Password    //input[@id='password']    juniper
    Selenium2Library.Click Button    //input[@value=' Login ']
    Selenium2Library.Maximize Browser Window
    BuiltIn.Sleep    5s
    Selenium2Library.Title Should Be    MyJuniper
    Common.Click On Cases
    BuiltIn.Sleep    5s
    Selenium2Library.Click Element    //div[@id='jnprDataTableContent_cases_ngcsc_subtab_my_reported_cases']/div[2]/div/div[1]/div[3]/div[1]/div/div[1]/div[2]/div/div[1]/div/div/div/div/span
    BuiltIn.Sleep    5s
    Selenium2Library.Element Should Not Be Visible    //div[@id='nxcsc-banner-case-manager-view']/section/div/section/section[1]/button
