*** Settings ***
Suite Setup       Common.Suite Setup For Products UI    ${My_Juniper_Testing}    ${NGCSC1_token}
Library           Selenium2Library
Library           Process
Library           Collections
Resource          ../../Common.robot
Resource          ../../Variables.txt

*** Variables ***
${username}       ngcsc1@ngcsc.33mail.com
${password}       juniper
${URL}            http://staging-myjuniper/
${Click_Login_Link}    xpath=//div[@id='horz-menu-login']/i
${Click_Login_button}    xpath=//input[@value='Login']
${Create_User_Account}    xpath=//a[contains(@href, 'https://www.juniper.net/entitlement/setupAccountInfo.do')]
${Reset_Password}    xpath=//a[contains(@href, 'https://www.juniper.net/entitlement/changePassword.do')]
${Login_Assistance}    xpath=//a[contains(@href, 'https://www.juniper.net/entitlement/loginAssistance.do')]
${Click_HELP_Link}    xpath=//div[@id='horz-menu-help']/span[2]
${Contact_Support}    xpath=(//a[@href='http://www.juniper.net/support/requesting-support.html'])[2]
${Getting_Started_Support}    xpath=//a[@href='http://kb.juniper.net/InfoCenter/index?page=content&id=KB10910']
${Guidelines_Policies}    xpath=(//a[@href='http://www.juniper.net/support/guidelines.html'])[2]
${Customer_Care_Guide}    xpath=//a[contains(@href, 'https://www.juniper.net/customers/support/downloads/7100156-001-EN.pdf')]
${JTAC_User_Guide}    xpath=//a[@href='http://www.juniper.net/us/en/local/pdf/resource-guides/7100059-en.pdf']
${JTAC_Fact_Sheet}    xpath=//a[contains(@href, 'https://www.juniper.net/customers/support/downloads/3000050-EN.pdf')]
${UserName_Input}    xpath=//form[@id='Login']/div/input
${UserName_Password}    xpath=//input[@id='password']
${Click_Logout_link}    xpath=//div/div/div/div/div/div/span[2]
${Click_Logout_button}    xpath=.//*[@id='btnLogout']
${submit_login}    xpath=//input[@value=' Login ']
${Click_Login_Menu_Link}    xpath=//div[@id='horz-menu-profile']/i
${Add_button}     xpath=.//*[@id='supertab-add-icon']
${Add_Custom_Tab_Window}    xpath=//input[@id='nxcsc-addtab-name']
${Save_Custom_tab_Window}    xpath=//div[@id='nxcsc-add-tab-custom-wrapper']/section/div/button[2]
${Click_Custom_Super_tab}    xpath=//div[@id='nxcsc-tab-opt-drag-ABDCE']
${Text_Super_tab_2}    ABDCE
${Click_Widget_Selector}    //*[@id='nxcsc-tab-opt-settings-abdce']
${Click_Table_Option}    xpath=//div[@id='cases_tabview_cases_tabbed_table']/div/section/div/div/div[1]/section/aside/div[1]/div[1]/i
${Click_Clear_Filters}    xpath=//div[@id='installbases_tabview_installbase_tabbed_table']/div/section/div/div/div[1]/section/aside/div[2]/div[3]/section/div[1]/span[2]
${x_location}     0
${y_location}     600
${x_inside_location}    0
${y_inside_location}    100
${Inside_Window_Size}    xpath=//input[@class='rc-filter-view']
${Scroll_Down_Inside_View_Filter}    xpath=//div[14]
${x_horizontalcases_location}    900
${y_horizontalcases_location}    0
${Cases_Horizontal_Scroll}    xpath=//section/div/div/section/div/div
${Cases_Vertical_Scroll}    xpath=//section/div/div/section/div/div
${Login_Assistance_link}    xpath=//a[contains(@href, 'https://www.juniper.net/entitlement/loginAssistance.do')]
${Edit_Account}    xpath=//a[contains(@href, 'https://www.juniper.net/entitlement/editAcctInfo.do')]
${System_Default_View}    xpath=//button[2]
${Save_View_Name}    xpath=//li/div/input
${Add_Button_Save_View}    xpath=//div/ul/li/div/div
${Cancel_Button_Add_Tab}    //*[@id='nxcsc-add-tab-custom-wrapper']/section/div/button[1]
${Global_Search_Input}    xpath=//section[@id='nxcsc-global-search-container']/input
${Cancel_Add_button}    xpath=//div[@id='nxcsc-add-tab-custom-wrapper']/section/div/button
${Click_Ascend_Case_Type}    xpath=//div[@id='jnprDataTableContent_cases_ngcsc_subtab_my_reported_cases']/div[2]/div/div/div[2]/div/div/div[2]/div/div[3]/div[2]/div/span[2]
${Get_Text_Ascend_Case_Type}    xpath=//div[@id='jnprDataTableContent_cases_ngcsc_subtab_all_open_cases']/div[2]/div/div/div[3]/div/div/div/div[2]/div/div[3]/div/div/div/div/span
${Account_Selection_ID}    xpath=//aside/nav/ul/li
${DeSelect_All}    //*[@id='nxcsc-table-view290']/div/div/div[1]/section/aside/div[2]/div[1]/section/div[1]/div[1]/label
${Get_Text_No_Record_Found}    //*[@id='jnprDataTableContent_cases_ngcsc_subtab_my_reported_cases']/div[1]/span
${Column_Tab_Selection}    xpath=//aside/nav/ul/li[2]
${Deselect_All_Columns}    //*[@id='nxcsc-table-view290']/div/div/div[1]/section/aside/div[2]/div[2]/section/div[1]/div[1]/label
${Click_Add_Chart}    xpath=//div[@id='nxcsc-widget-chooser-inner']/div/div/span/ul/li/span/div
${Open_Cases_By_Series_Product_Priority}    xpath=//div[@id='nxcsc-widget-chooser-inner']/div/div/div[2]/div/div/div/span
${Click_Widget_Selector_Cases}    xpath=//button[@id='nxcsc-tab-opt-settings-cases']
${Open_Cases_Created_To_Closed}    xpath=//div[@id='nxcsc-widget-chooser-inner']/div/div/div[2]/div/div/div[2]/span
${Click_Add_Product}    xpath=//div[@id='nxcsc-widget-chooser-inner']/div/div/span[2]/ul/li/span/div[2]
${Product_Announced_EOL_Summary}    xpath=//div[@id='nxcsc-widget-chooser-inner']/div/div/div[2]/div/div/div/span
${Registration_Summary}    xpath=//div[@id='nxcsc-widget-chooser-inner']/div/div/div[2]/div/div/div[2]/span
${Distribution_Products_Country}    xpath=//div[@id='nxcsc-widget-chooser-inner']/div/div/div[2]/div/div/div[3]/span
${Click_Add_Contract}    xpath=//div[@id='nxcsc-widget-chooser-inner']/div/div/span[3]/ul/li/span/div[2]
${Username1}      jarroded@icloud.com
${Password1}      juniper
${Get_Text_Value_Series_Product_Priority}    xpath=//*[@id='OpenCases by Product Series/Priority']
${Click_Series_Product_Priority_Value_first_graph}    //*[@id='cases_cur_open_cases_by_prodseries_priority']
${Click_P1_Graph}    xpath=//*[@id='cases_cur_open_cases_by_prodseries_priority']/header/section/ul/li[1]
${Click_Filter_Products}    xpath=//div[@id='installbases_tabview_installbase_tabbed_table']/div/section/div/div/div/div[1]/button[1]
${UserName2}      ngcsc2@ngcsc.33mail.com
${Password2}      juniper
${SerialNumber_Id_Filter}    xpath=//div[@id='rc-filter-section-serialNumber']/div/input
${Click_Product_Serial_Number}    xpath=//div[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base']/div[2]/div/div/div[3]/div/div/div/div[2]/div/div[2]/div/div/div/div/span
${ProductName_Id_Filter}    xpath=//div[@id='rc-filter-section-productName']/div/input
${Get_Cell_Value_Product_Name}    //div[@id='jnprDataTableContent_installbases_ngcsc_subtab_eol_eos']/div[2]/div/div[1]/div[3]/div/div/div[1]/div[2]/div/div[6]/div/div/div/div/span    # //div[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base']/div[2]/div/div/div[3]/div/div/div/div[2]/div/div[4]/div/div/div/div/span
${MaterialItemCategory_Filter}    //*[@id='rc-input-materialItemCategory']
${Get_Cell_Value_MaterialItemCategory}    //div[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base']/div[2]/div/div/div[3]/div/div/div/div[2]/div/div[5]/div/div/div/div/span    # //div[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base']/div[2]/div/div/div[3]/div/div/div/div[2]/div/div[5]/div/div/div/div/span
${Get_Cell_Value_AssemblyNumber}    //*[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base']/div[1]/span
${AssemblyNumber_Filter}    //*[@id='rc-input-assemblyNumber']
${AssemblyRev}    //*[@id='rc-input-assemblyRev']
${Get_Cell_Value_Rev}    //*[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base']/div[1]/span
${AssemblyHardwareRev}    //div[@id='rc-filter-section-assemblyHardwareRev']/div/input
${Get_Cell_Value_AssemblyHardwareRev}    //*[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base']/div[2]/div/div[1]/div[3]/div/div/div[1]/div[2]/div/div[7]/div/div/div/div/span
${Inner_Scroll}    //div[19]
${SalesOrderNumber}    //*[@id='rc-input-salesOrderNumber']
${Get_Cell_Value_SalesOrderNumber}    //*[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base']/div[2]/div/div[1]/div[3]/div/div/div[1]/div[2]/div/div[8]/div/div/div/div/span    # .//*[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base']/div[2]/div/div[1]/div[3]/div/div/div[1]/div[2]/div/div[8]/div/div/div/div/span
${Horizontal_location}    200
${Vertical_location}    0
${Inner_Horizontal_Scroll}    //*[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base']/div[2]/div/div[2]/div/div
${Get_Cell_Text_Value_Sales_Order_Number}    //div[3]/div/div/div/div/span    # //div[3]/div/div/div/div/span
${Filter_Products_Click}    //aside/div/div/i
${Contract_Id_Filter}    //*[@id='rc-input-contractId']
${Get_Cell_Value_Contract_ID}    //div[3]/div/div/div/div[2]/div/div/div/div/div/div/span
${Contract_Start_Date_Filter}    //div[@id='rc-custom-datepickerstartDate']/div/div[2]/div/input
${Get_Cell_Value_Start_Date}    //div[2]/div/div[2]/div/div/div/div/span
${Click_Month_Contract_DropDown}    //div[@id='ui-datepicker-div']/div/div/select
${Click_Month_Contract}    //div[@id='ui-datepicker-div']/div/div/select/option[12]
${Click_Year_Contract_DropDown}    //div[@id='ui-datepicker-div']/div/div/select[2]
${Click_Year_Contract}    //div[@id='ui-datepicker-div']/div/div/select[2]/option[18]    # //div[@id='ui-datepicker-div']/div/div/select[2]/option[18]
${Click_Date}     //div[@id='ui-datepicker-div']/table/tbody/tr[4]/td[4]/a    # //div[@id='ui-datepicker-div']/table/tbody/tr[4]/td[4]/a
${Click_Start_Date_Contract}    //div[@id='rc-custom-datepickerstartDate']/div/div[2]/div/input
${Click_End_Date_Contract}    //div[@id='rc-custom-datepickerendDate']/div/div[2]/div/input
${Click_Month_Contract_DropDown_End_Date}    //div[@id='rc-custom-datepickerendDate']/div/div[2]/div/input
${Click_Month_Contract_End_Date}    //div/select/option[7]
${Click_Year_Contract_DropDown_End_Date}    //div[@id='ui-datepicker-div']/div/div/select[2]
${Click_Year_Contract_End_Date}    //div[@id='ui-datepicker-div']/div/div/select[2]/option[21]
${Click_End_Date}    //div[@id='ui-datepicker-div']/table/tbody/tr[6]/td/a
${Support_Coverage_Filter}    //*[@id='rc-input-supportCoverage']
${SalesOrderLineItem}    //*[@id='rc-input-salesOrderLineItem']
${Get_Cell_Value_SalesOrderLineItem}    //div[3]/div/div/div/div/span    # //div[3]/div/div/div/div/span
${Product_City}    //*[@id='rc-input-city']
${Get_Cell_Value_Product_City}    //div[3]/div/div/div/div/span    # //div[3]/div/div/div/div/span
${Inner_Small_Horizontal_Scroll}    //*[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base']/div[2]/div/div[2]/div/div/div
${Product_Country}    //*[@id='rc-input-country']
${Get_Cell_Value_Product_Country}    //div[4]/div/div/div/div/span
${Click_PR_Date_Product}    //div[@id='rc-custom-datepickerproductRegistrationDate']/div/div[2]/div/input    # //div[@id='rc-custom-datepickerproductRegistrationDate']/div/div[2]/div/input
${Click_Month_Product_DropDown_PR_Date}    //div/select    # .//*[@id='ui-datepicker-div']/div/div/select[1]
${Click_Month_Product_PR_Date}    //div[@id='ui-datepicker-div']/div/div/select/option[8]    # //div[@id='ui-datepicker-div']/div/div/select/option[8]
${Click_Year_Product_DropDown_PR_Date}    //div[@id='ui-datepicker-div']/div/div/select[2]
${Click_Year_Product_PR_Date}    //div[@id='ui-datepicker-div']/div/div/select[2]/option[21]
${Click_PR_Date}    //td[2]/a
${Get_Cell_Value_PR_Date}    //*[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base']/div[2]/div/div[1]/div[3]/div/div/div[1]/div[2]/div/div[6]/div/div/div/div/span    # .//*[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base']/div[2]/div/div[1]/div[3]/div/div/div[1]/div[2]/div/div[6]/div/div/div/div/span
${Inner_Deep_Vertical_Scroll}    //*[@class='ps-scrollbar-y']
${Get_Filter_Value_PR_Date}    //*[@id='rc-custom-datepickerproductRegistrationDate']/label
${Global_Search_Enter_Input_button}    //*[@id='nxcsc-global-search-container']/input    # .//*[@id='nxcsc-global-search-container']/input
${Click_Column_Tab}    //aside/nav/ul/li[2]
${Click_Select_All}    //div[2]/section/div/div/label
${Click_Suuport_Coverage_Column}    //div[2]/section/div[2]/ul/li[6]    # //div[2]/section/div[2]/ul/li[6]
${Serial_Filter}    //*[@id='rc-input-serialNo']
${Click_Serial_Column}    //div[2]/section/div[2]/ul/li[7]    # //div[2]/section/div[2]/ul/li[7]
${Product_Filter}    //*[@id='rc-input-product']
${Click_Product_Column}    //div[2]/section/div[2]/ul/li[9]
${ShipDate_Filter}    //div[@id='rc-custom-datepickershipDate']/div/div[2]/div/input
${City_Filter}    //*[@id='rc-input-city']
${Click_City_Column}    //div[2]/section/div[2]/ul/li[12]    # //div[2]/section/div[2]/ul/li[12]
${Get_Cell_Value_City_Contract}    //div[4]/div/div/div/div/span    # //div[4]/div/div/div/div/span
${ll}             //div[2]/section/div[2]/div[2]
${Click_Start}    //div[2]/section/div[2]/ul/li[2]/span
${Click_End}      //div[2]/div[2]/section/div[2]/ul/li[3]
${Contract_id_column}    //div[2]/div[2]/section/div[2]/ul/li[1]
${State_Filter}    //*[@id='rc-input-state']
${Click_State_Column}    //div[2]/section/div[2]/ul/li[12]/span
${Country_Filter}    //*[@id='rc-input-country']
${Click_Country_Column}    //div[2]/section/div[2]/ul/li[13]/span
${Get_Cell_Value_Ship_Date}    //div[4]/div/div/div/div/span
${Click_Ship_Date_Product}    //div[@id='rc-custom-datepickershipDate']/div/div[2]/div/input
${Horizontal_Scroll_Product}    //*[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base']/div[2]/div/div[2]/div/div/div    # .//*[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base']/div[2]/div/div[2]/div/div/div
${Click_Product_Name_Column}    //div[2]/section/div[2]/ul/li[3]
${Click_Warranty_Date_Column}    //div[2]/section/div[2]/ul/li[20]/span
${Get_Cell_Value_Warranty_Date}    //*[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base']/div[2]/div/div/div[3]/div/div/div/div[2]/div/div[4]/div/div/div/div/span
${Click_Select_All_Cases}    //input[@id='cases_ngcsc_subtab_my_reported_casesaccountIdmultiselect-all']
${Click_Priority}    //div[2]/section/div[2]/ul/li[2]    # //div[2]/section/div[2]/ul/li[2]
${Click_Serial_Case_Column}    //li[10]
${Get_Cell_Value_Serial_Number_Cases}    //div[6]/div/div/div/div/span    # //div[2]/div/div[2]/div/div/div/div/span
${Get_Cell_Value_Router_Name_Cases}    //*[@id='jnprDataTableContent_cases_ngcsc_subtab_my_reported_cases']/div[1]/span    # .//*[@id='jnprDataTableContent_cases_ngcsc_subtab_my_reported_cases']/div[1]/span
${Click_City_Case_Column}    //div[2]/section/div[2]/ul/li[9]/span
${Get_Cell_Value_EOL_Date}    //*[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base']/div[1]/span
${Click_Month_Cases_CreatedOn_Date}    //div[@id='ui-datepicker-div']/div/div/select/option[6]
${Click_Year_Cases_CreatedOn_Date}    //div[@id='ui-datepicker-div']/div/div/select[2]/option[22]
${Click_Cases_Created_On_Date}    //tr[5]/td[3]/a
${Click_Priority_Column}    //div[2]/section/div[2]/ul/li[2]/span
${Click_CreatedOn_Case_Column}    //li[14]    # //li[14]
${Get_Cell_Value_CreatedOn_Cases}    //div[6]/div/div/div/div/span    # //div[2]/div/div[2]/div/div/div/div/span
${Click_Case_Admin_Tech}    //*[@id='rc-filter-section-caseType']/div/div[2]/ul/li[2]
${Get_Cell_Value_Admin_Tech}    //*[@id='jnprDataTableContent_cases_ngcsc_subtab_all_open_cases']/div[2]/div/div[1]/div[3]/div/div/div[1]/div[2]/div/div[3]/div/div/div/div/span
${Firefox}        firefox
${Google_Chrome}    Google Chrome
${SSRN_Filter}    //*[@id='rc-input-softwareSupportReferenceNumber']
${Sales_Order_Column_Select}    //div[2]/section/div[2]/ul/li[8]
${Sales_Order_Line_Item_Column_Select}    //div[2]/section/div[2]/ul/li[9]
${Click_Start_Date_Column}    //div[2]/section/div[2]/ul/li[2]/span[2]
${Click_End_Date_Column}    //div[2]/section/div[2]/ul/li[3]/span[2]
${Click_Status_Column}    //div[2]/section/div[2]/ul/li[4]/span[2]
${Click_Location_Column}    //div[2]/section/div[2]/ul/li[5]/span[2]
${Click_Support_Coverage_Column}    //div[2]/section/div[2]/ul/li[6]/span[2]
${Click_Serial_No_Column}    //div[2]/section/div[2]/ul/li[7]/span[2]
${Click_SSRN_Column}    //div[2]/section/div[2]/ul/li[8]/span[2]
${Click_Product_Names_Column}    //div[2]/section/div[2]/ul/li[9]/span[2]
${Click_SSRN_IB}    //div[2]/section/div[2]/ul/li[2]/span[2]
${Click_MaterialCategory_IB}    //div[2]/section/div[2]/ul/li[4]/span[2]
${Click_AssemblyNumber_IB}    //div[2]/section/div[2]/ul/li[5]/span[2]
${Click_AssemblyRev_IB}    //div[2]/section/div[2]/ul/li[6]/span[2]
${Click_AssemblyHardwareRev_IB}    //div[2]/section/div[2]/ul/li[7]/span[2]
${Click_SalesOrderNumber_IB}    //div[2]/section/div[2]/ul/li[8]/span[2]
${Click_SalesOrderLineItem_IB}    //div[2]/section/div[2]/ul/li[9]/span[2]
${Get_Cell_Value_Product_State}    //div[5]/div/div/div/div/span
${Click_City_IB}    //div[2]/section/div[2]/ul/li[10]/span[3]
${Click_State_IB}    //div[2]/section/div[2]/ul/li[11]/span[2]
${Click_Country_IB}    //div[2]/section/div[2]/ul/li[12]/span[2]
${Click_Address_IB}    //div[2]/section/div[2]/ul/li[13]/span[2]
${Click_InstalledAt_IB}    //div[2]/section/div[2]/ul/li[14]/span[2]
${Click_Reseller_IB}    //div[2]/section/div[2]/ul/li[15]/span[2]
${Click_Distributor_IB}    //div[2]/section/div[2]/ul/li[16]/span[2]
${Get_Cell_Value_Global_Search_Product_Text}    //div[@id='jnprDataTableContent_search_function_tab_products']/div/div/div[2]/div/div/div[3]/div/div/div/div[2]/div/div/div/div/div/div/span    # //div[@id='jnprDataTableContent_search_function_tab_products']/div/div/div[2]/div/div/div[3]/div/div/div/div[2]/div/div/div/div/div/div/span
${Inner_Vertical_Scroll_Column_Contract}    //div[2]/section/div[2]/div[2]/div    # //div[2]/section/div[2]/div[2]/div
${Click_PRDate_IB}    //div[2]/section/div[2]/ul/li[17]/span[2]

*** Test Cases ***
Filter_Products_SerialNo_Validation
    [Tags]    products
    [Setup]    Common.Click on Products
    [Timeout]
    Click Element    //ul[@id='nxcsc-tabbed-table-tabs-main']/li[4]
    Sleep    5
    Click Element    ${Click_Filter_Products}
    Sleep    5
    Click Element    ${Click_Clear_Filters}
    Sleep    5
    Input Text    ${SerialNumber_Id_Filter}    0162052013000477
    Sleep    8
    Click Element    //div[@id='jnprDataTableContent_installbases_ngcsc_subtab_eol_eos']/div[2]/div/div[1]/div[3]/div/div/div[1]/div[2]/div/div[2]/div/div/div/div/span[1]
    Sleep    5
    ${serial_number_parent}    Selenium2Library.Get Text    //div[@id='jnprDataTableContent_installbases_ngcsc_subtab_eol_eos_detail_view']/div[2]/div/div[1]/div[2]/div/div[1]/div[2]/div/div[1]/div[2]/div[3]/span[2]
    Should Be Equal    ${serial_number_parent}    0162052013000477
    Sleep    5
    Click Element    //div[@id='detailview-installbases_ngcsc_subtab_eol_eos_detail_view']/section/div/header/div/span/i

SaveViewProducts
    [Tags]    products
    Comment    Sleep    5
    Comment    Click Element    ${Click_Table_Option}
    Sleep    3
    Click Element    ${Click_Clear_Filters}
    Sleep    3
    Input Text    ${SerialNumber_Id_Filter}    CABV4435
    Sleep    5
    Comment    Click Element    ${Cancel_Button_Add_Tab}
    Comment    Sleep    5
    Click Element    ${System_Default_View}
    Sleep    3
    Input Text    ${Save_View_Name}    abc
    Sleep    3
    Click Element    ${Add_Button_Save_View}
    Sleep    3
    ${Get_text_save_view}    Get Text    //div[@id='installbases_tabview_installbase_tabbed_table']/div/section//div/div/div[2]/div[1]/ul/li/div[2]/ul/li[2]/div
    Should Be Equal    ${Get_text_save_view}    abc

Global_Search_Products
    [Tags]    products
    Sleep    10
    Input Text    ${Global_Search_Input}    JN11AB220AFA
    Sleep    5
    Press Key    ${Global_Search_Enter_Input_button}    \\13
    Sleep    5
    ${Get_Global_Search_Product_Text}    Get Text    ${Get_Cell_Value_Global_Search_Product_Text}
    Log    ${Get_Global_Search_Product_Text}
    Should Be Equal    ${Get_Global_Search_Product_Text}    JN11AB220AFA
    Sleep    3
    Click Element    //span[@id='nxcsc-globalsearch-btn-close']/i

Filter_Products_ProductName_Validation
    [Tags]    products
    Comment    Sleep    5
    Comment    Click Element    ${Click_Filter_Products}
    Sleep    5
    Click Element    ${Click_Clear_Filters}
    Sleep    8
    Input Text    ${SerialNumber_Id_Filter}    0241072008000127
    Sleep    8
    Input Text    ${ProductName_Id_Filter}    SA6500
    Sleep    5
    Comment    Click Element    ${Cancel_Button_Add_Tab}
    Comment    Sleep    5
    ${Get_Text_ProductName}    Get Text    ${Get_Cell_Value_Product_Name}
    Sleep    5
    Should Be Equal    ${Get_Text_ProductName}    SA6500

Filter_Products_MaterialItemCategory_Validation
    [Tags]    products
    Click Element    //ul[@id='nxcsc-tabbed-table-tabs-main']/li[2]
    Sleep    5
    Click Element    ${Click_Filter_Products}
    Sleep    5
    Click Element    ${Click_Clear_Filters}
    Sleep    8
    Input Text    ${SerialNumber_Id_Filter}    JN11AB220AFA
    Sleep    8
    Input Text    ${ProductName_Id_Filter}    MX960BASE-AC
    Sleep    5
    Comment    Click Element    ${Cancel_Button_Add_Tab}
    Comment    Sleep    5
    Input Text    ${MaterialItemCategory_Filter}    Configurable System
    Sleep    5
    ${Get_Text_MaterialItemCategory}    Get Text    ${Get_Cell_Value_MaterialItemCategory}
    Sleep    5
    Should Be Equal    ${Get_Text_MaterialItemCategory}    Configurable System

Filter_Products_AssemblyNumber_Validation
    [Tags]    products
    Comment    Sleep    5
    Comment    Click Element    ${ClickToProductsTab}
    Comment    Sleep    5
    Comment    Click Element    ${Click_Filter_Products}
    Sleep    5
    Click Element    ${Click_Clear_Filters}
    Sleep    8
    Input Text    ${SerialNumber_Id_Filter}    113363A00092
    Sleep    8
    Input Text    ${ProductName_Id_Filter}    SFPP-10GE-SR
    Sleep    5
    Input Text    ${MaterialItemCategory_Filter}    Standalone Fixed SYS/FRU
    Sleep    5
    Selenium2Library.Press Key    ${MaterialItemCategory_Filter}    \\9
    Sleep    5
    Input Text    ${AssemblyNumber_Filter}    740-031980
    Sleep    8
    ${Get_Text_AssemblyNumber}    Get Text    //div[@id="jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base"]/div[2]/div/div[1]/div[3]/div/div/div[1]/div[2]/div/div[6]/div/div/div/div/span    #${Get_Cell_Value_AssemblyNumber}
    Sleep    5
    Log    ${Get_Text_AssemblyNumber}
    Sleep    5
    Should Be Equal    ${Get_Text_AssemblyNumber}    740-031980

Filter_Products_AssemblyRev_Validation
    [Tags]    products
    Comment    Sleep    5
    Comment    Click Element    ${ClickToProductsTab}
    Comment    Sleep    5
    Comment    Click Element    ${Click_Filter_Products}
    Sleep    5
    Click Element    ${Click_Clear_Filters}
    Sleep    8
    Input Text    ${SerialNumber_Id_Filter}    113363A00092
    Sleep    8
    Input Text    ${ProductName_Id_Filter}    SFPP-10GE-SR
    Sleep    5
    Input Text    ${MaterialItemCategory_Filter}    Standalone Fixed SYS/FRU
    Sleep    5
    Selenium2Library.Press Key    ${MaterialItemCategory_Filter}    \\9
    Sleep    5
    Input Text    ${AssemblyNumber_Filter}    740-031980
    Sleep    8
    Selenium2Library.Press Key    ${AssemblyNumber_Filter}    \\9
    Sleep    5s
    Input Text    ${AssemblyRev}    01
    Sleep    8
    ${Get_Text_AssemblyRev}    Get Text    ${Get_Cell_Value_Rev}
    Sleep    5
    Log    ${Get_Text_AssemblyRev}
    Sleep    5
    Should Be Equal    ${Get_Text_AssemblyRev}    01

Filter_Products_AssemblyHardwareRev_Validation
    [Tags]    products
    Comment    Sleep    5
    Comment    Click Element    ${ClickToProductsTab}
    Comment    Sleep    8
    Comment    Click Element    ${Click_Filter_Products}
    Comment    Sleep    8
    Sleep    8
    Click Element    ${Click_Clear_Filters}
    Sleep    8
    Comment    Click Element    ${Cancel_Button_Add_Tab}
    Comment    Sleep    10
    Input Text    ${SerialNumber_Id_Filter}    113363A00092
    Sleep    8
    Input Text    ${ProductName_Id_Filter}    SFPP-10GE-SR
    Sleep    5
    Input Text    ${MaterialItemCategory_Filter}    Standalone Fixed SYS/FRU
    Sleep    8
    Press Key    ${MaterialItemCategory_Filter}    \\9
    Sleep    8
    Press Key    //*[@id='rc-input-assemblyNumber']    \\9    #assembly number
    Sleep    8
    Press Key    //*[@id='rc-input-assemblyRev']    \\9    #assembly rev
    Sleep    5
    Input Text    ${AssemblyHardwareRev}    01
    Sleep    8
    ${Get_Text_AssemblyRev}    Get Text    ${Get_Cell_Value_Rev}
    Sleep    5
    Log    ${Get_Text_AssemblyRev}
    Sleep    5
    Should Be Equal    ${Get_Text_AssemblyRev}    01

Filter_Products_SalesOrderNumber_Validation
    [Tags]    products
    Comment    Sleep    5
    Comment    Click Element    ${ClickToProductsTab}
    Comment    Sleep    8
    Comment    Click Element    ${Click_Filter_Products}
    Comment    Sleep    8
    Click Element    ${Click_Clear_Filters}
    Sleep    8
    Comment    Comment    Click Element    ${Cancel_Button_Add_Tab}
    Comment    Comment    Sleep    10
    Comment    Input Text    ${SerialNumber_Id_Filter}    ABCK4515
    Comment    Sleep    3
    Comment    Press Key    ${SSRN_Filter}    \\9
    Comment    Sleep    3
    Comment    Press Key    ${ProductName_Id_Filter}    \\9
    Sleep    5
    Press Key    ${MaterialItemCategory_Filter}    \\9
    Sleep    5
    Press Key    ${AssemblyNumber_Filter}    \\9
    Sleep    8
    Press Key    ${AssemblyRev}    \\9
    Sleep    8
    Press Key    ${AssemblyHardwareRev}    \\9
    Sleep    5
    Input Text    ${SalesOrderNumber}    0010556726
    Sleep    8
    Click Element    ${Click_Column_Tab}
    Sleep    8
    Click Element    ${Click_Select_All}
    Sleep    8
    Click Element    ${Sales_Order_Column_Select}
    Sleep    8
    ${Get_Text_SalesOrderNumber}    Get Text    ${Get_Cell_Text_Value_Sales_Order_Number}
    Sleep    5
    Log    ${Get_Text_SalesOrderNumber}
    Sleep    5
    Should Be Equal    ${Get_Text_SalesOrderNumber}    0010556726

Filter_Products_SalesOrderLineItem_Validation
    [Tags]    products
    Comment    Sleep    5
    Comment    Click Element    ${ClickToProductsTab}
    Comment    Sleep    8
    Comment    Click Element    ${Click_Filter_Products}
    Comment    Sleep    8
    Sleep    8
    Click Element    //div[@id='installbases_tabview_installbase_tabbed_table']/div/section/div/div/div[1]/section/aside/nav/ul/li[3]
    Sleep    5s
    Click Element    ${Click_Clear_Filters}
    Sleep    8
    Comment    Click Element    ${Cancel_Button_Add_Tab}
    Comment    Sleep    10
    Comment    Input Text    ${SerialNumber_Id_Filter}    ABCK4515
    Comment    Sleep    3
    Comment    Press Key    ${SSRN_Filter}    \\9
    Comment    Sleep    3
    Comment    Press Key    ${ProductName_Id_Filter}    \\9
    Comment    Sleep    5
    Press Key    ${MaterialItemCategory_Filter}    \\9
    Sleep    5
    Press Key    ${AssemblyNumber_Filter}    \\9
    Sleep    8
    Press Key    ${AssemblyRev}    \\9
    Sleep    8
    Press Key    ${AssemblyHardwareRev}    \\9
    Sleep    5
    Press Key    ${SalesOrderNumber}    \\9
    Sleep    5
    Input Text    ${SalesOrderLineItem}    001201
    Sleep    8
    Click Element    ${Click_Column_Tab}
    Sleep    8
    Click Element    ${Click_Select_All}
    Sleep    8
    Click Element    ${Sales_Order_Line_Item_Column_Select}
    Sleep    8
    ${Get_Text_SalesOrderLineItem}    Get Text    ${Get_Cell_Value_SalesOrderLineItem}
    Sleep    5
    Log    ${Get_Text_SalesOrderLineItem}
    Should Be Equal    ${Get_Text_SalesOrderLineItem}    001201
    Sleep    5

Filter_Products_City_Validation
    Click Element    //div[@id='installbases_tabview_installbase_tabbed_table']/div/section/div/div/div[1]/section/aside/nav/ul/li[3]
    Sleep    5s
    Sleep    8
    Click Element    ${Click_Clear_Filters}
    Sleep    8
    Comment    Click Element    ${Cancel_Button_Add_Tab}
    Comment    Sleep    10
    Comment    Input Text    ${SerialNumber_Id_Filter}    ABCK4515
    Comment    Sleep    8
    Comment    Press Key    ${ProductName_Id_Filter}    \\9
    Comment    Sleep    5
    Comment    Press Key    ${MaterialItemCategory_Filter}    \\9
    Comment    Sleep    5
    Press Key    ${AssemblyNumber_Filter}    \\9
    Sleep    5
    Press Key    ${AssemblyRev}    \\9
    Sleep    5
    Press Key    ${AssemblyHardwareRev}    \\9
    Sleep    5
    Press Key    ${SalesOrderNumber}    \\9
    Sleep    5
    Press Key    ${SalesOrderLineItem}    \\9
    Sleep    8
    Input Text    ${Product_City}    SACRAMENTO
    Sleep    5
    Click Element    ${Click_Column_Tab}
    Sleep    5
    Click Element    ${Click_Product_Name_Column}
    Sleep    5
    Click Element    ${Click_SSRN_IB}
    Sleep    5
    Click Element    ${Click_MaterialCategory_IB}
    Sleep    5
    Click Element    ${Click_AssemblyNumber_IB}
    Sleep    5
    Click Element    ${Click_AssemblyRev_IB}
    Sleep    5
    Click Element    ${Click_AssemblyHardwareRev_IB}
    Sleep    5
    Click Element    ${Click_SalesOrderNumber_IB}
    Sleep    5
    Click Element    ${Click_SalesOrderLineItem_IB}
    Sleep    5
    ${Get_Text_ProductCity}    Get Text    ${Get_Cell_Value_Product_City}
    Sleep    5
    Log    ${Get_Text_ProductCity}
    Sleep    5
    Should Be Equal    ${Get_Text_ProductCity}    SACRAMENTO

Filter_Products_State_Validation
    Click Element    //div[@id='installbases_tabview_installbase_tabbed_table']/div/section/div/div/div[1]/section/aside/nav/ul/li[3]
    Sleep    5s
    Sleep    8
    Click Element    ${Click_Clear_Filters}
    Sleep    8
    Comment    Click Element    ${Cancel_Button_Add_Tab}
    Comment    Sleep    10
    Comment    Input Text    ${SerialNumber_Id_Filter}    ABCK4515
    Comment    Sleep    8
    Comment    Press Key    ${ProductName_Id_Filter}    \\9
    Comment    Sleep    5
    Comment    Press Key    ${MaterialItemCategory_Filter}    \\9
    Comment    Sleep    5
    Comment    Press Key    ${AssemblyNumber_Filter}    \\9
    Comment    Sleep    5
    Press Key    ${AssemblyRev}    \\9
    Sleep    5
    Press Key    ${AssemblyHardwareRev}    \\9
    Sleep    5
    Press Key    ${SalesOrderNumber}    \\9
    Sleep    5
    Press Key    ${SalesOrderLineItem}    \\9
    Sleep    8
    Input Text    ${Product_City}    SACRAMENTO
    Sleep    5
    Press Key    ${Product_City}    \\9
    Sleep    5
    Input Text    //*[@id='rc-input-state']    California
    Sleep    5
    Click Element    ${Click_Column_Tab}
    Sleep    5
    Click Element    ${Click_Product_Name_Column}
    Sleep    5
    Click Element    ${Click_SSRN_IB}
    Sleep    5
    Click Element    ${Click_MaterialCategory_IB}
    Sleep    5
    Click Element    ${Click_AssemblyNumber_IB}
    Sleep    5
    Click Element    ${Click_AssemblyRev_IB}
    Sleep    5
    Click Element    ${Click_AssemblyHardwareRev_IB}
    Sleep    5
    Click Element    ${Click_SalesOrderNumber_IB}
    Sleep    5
    Click Element    ${Click_SalesOrderLineItem_IB}
    Sleep    5
    ${Get_Text_ProductCountry}    Get Text    ${Get_Cell_Value_Product_Country}
    Sleep    5
    Log    ${Get_Text_ProductCountry}
    Sleep    5
    Should Be Equal    ${Get_Text_ProductCountry}    California

Filter_Products_Country_Validation
    Click Element    //div[@id='installbases_tabview_installbase_tabbed_table']/div/section/div/div/div[1]/section/aside/nav/ul/li[3]
    Sleep    5s
    Sleep    10
    Comment    Click Element    ${ClickToProductsTab}
    Comment    Sleep    8
    Comment    Click Element    ${Click_Filter_Products}
    Comment    Sleep    8
    Click Element    ${Click_Clear_Filters}
    Sleep    8
    Comment    Click Element    ${Cancel_Button_Add_Tab}
    Comment    Sleep    10
    Comment    Input Text    ${SerialNumber_Id_Filter}    ABCK4515
    Comment    Sleep    8
    Comment    Press Key    ${ProductName_Id_Filter}    \\9
    Comment    Sleep    5
    Comment    Press Key    ${MaterialItemCategory_Filter}    \\9
    Comment    Sleep    5
    Comment    Press Key    ${AssemblyNumber_Filter}    \\9
    Comment    Sleep    5
    Press Key    ${AssemblyRev}    \\9
    Sleep    5
    Press Key    ${AssemblyHardwareRev}    \\9
    Sleep    5
    Press Key    ${SalesOrderNumber}    \\9
    Sleep    5
    Press Key    ${SalesOrderLineItem}    \\9
    Sleep    8
    Input Text    ${Product_City}    SACRAMENTO
    Sleep    5
    Press Key    ${Product_City}    \\9
    Sleep    5
    Input Text    //*[@id='rc-input-state']    California
    Sleep    5
    Press Key    //*[@id='rc-input-state']    \\9
    Sleep    5
    Input Text    //*[@id='rc-input-country']    United States
    Sleep    5
    Click Element    ${Click_Column_Tab}
    Sleep    5
    Click Element    ${Click_Product_Name_Column}
    Sleep    5
    Click Element    ${Click_SSRN_IB}
    Sleep    5
    Click Element    ${Click_MaterialCategory_IB}
    Sleep    5
    Click Element    ${Click_AssemblyNumber_IB}
    Sleep    5
    Click Element    ${Click_AssemblyRev_IB}
    Sleep    5
    Click Element    ${Click_AssemblyHardwareRev_IB}
    Sleep    5
    Click Element    ${Click_SalesOrderNumber_IB}
    Sleep    5
    Click Element    ${Click_SalesOrderLineItem_IB}
    Sleep    5
    ${Get_Text_ProductState}    Get Text    ${Get_Cell_Value_Product_State}
    Sleep    5
    Log    ${Get_Text_ProductState}
    Sleep    5
    Should Be Equal    ${Get_Text_ProductState}    United States

Filter_Products_Product_Registration_Date_Validation
    Sleep    8
    Click Element    ${Click_Clear_Filters}
    Sleep    8
    Click Element    ${Click_Clear_Filters}
    Sleep    8
    Input Text    ${SerialNumber_Id_Filter}    ABCK4515
    Sleep    8
    Press Key    ${ProductName_Id_Filter}    \\9
    Sleep    5
    Press Key    ${MaterialItemCategory_Filter}    \\9
    Sleep    5
    Press Key    ${AssemblyNumber_Filter}    \\9
    Sleep    5
    Press Key    ${AssemblyRev}    \\9
    Sleep    5
    Press Key    ${AssemblyHardwareRev}    \\9
    Sleep    5
    Press Key    ${SalesOrderNumber}    \\9
    Sleep    5
    Press Key    ${SalesOrderLineItem}    \\9
    Sleep    8
    Input Text    ${Product_City}    MENLO PARK
    Sleep    5
    Press Key    ${Product_City}    \\9
    Sleep    5
    Input Text    //*[@id='rc-input-state']    California
    Sleep    5
    Press Key    //*[@id='rc-input-state']    \\9
    Sleep    5
    Input Text    //*[@id='rc-input-country']    United States
    Sleep    5
    Press Key    //*[@id='rc-input-country']    \\9
    Sleep    5
    Press Key    //div[@id='rc-custom-datepickerproductRegistrationDate']/div/div[2]/div/input    \\9
    Sleep    5
    Click Element    //div[@id='rc-custom-datepickershipDate']/div/div[2]/div/input
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/div/div/select
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/div/div/select/option[8]
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/div/div/select[2]
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/div/div/select[2]/option[19]
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/table/tbody/tr[4]/td[2]/a
    Sleep    5
    Click Element    ${Click_Column_Tab}
    Sleep    5
    Click Element    ${Click_Product_Name_Column}
    Sleep    5
    Click Element    ${Click_SSRN_IB}
    Sleep    5
    Click Element    ${Click_MaterialCategory_IB}
    Sleep    5
    Click Element    ${Click_AssemblyNumber_IB}
    Sleep    5
    Click Element    ${Click_AssemblyRev_IB}
    Sleep    5
    Click Element    ${Click_AssemblyHardwareRev_IB}
    Sleep    5
    Click Element    ${Click_SalesOrderNumber_IB}
    Sleep    5
    Click Element    ${Click_SalesOrderLineItem_IB}
    Sleep    5
    Sleep    2
    Mouse Down    ${Inner_Vertical_Scroll_Column_Contract}
    Sleep    2
    Mouse Over    ${Inner_Vertical_Scroll_Column_Contract}
    Sleep    2
    Execute Javascript    window.scrollTo(${x_location},${y_location})
    Sleep    2
    Mouse Up    ${Inner_Vertical_Scroll_Column_Contract}
    Sleep    2
    Mouse Over    //div/div/div[1]
    Sleep    2
    Click Element    //div[2]/div[2]/section/div[2]/div[2]
    Sleep    5
    #Click Element    ${Click_City_IB}
    Sleep    5
    Click Element    ${Click_State_IB}
    Sleep    5
    Click Element    ${Click_Country_IB}
    Sleep    5
    Click Element    ${Click_Address_IB}
    Sleep    5
    Click Element    ${Click_InstalledAt_IB}
    Sleep    5
    Click Element    ${Click_Reseller_IB}
    Sleep    5
    Click Element    ${Click_Distributor_IB}
    Sleep    5
    Click Element    ${Click_PRDate_IB}
    Sleep    5
    ${Get_Text_Ship_Date}    Get Text    ${Get_Cell_Value_Ship_Date}
    Sleep    5
    Should Be Equal    ${Get_Text_Ship_Date}    18-AUG-2014

Filter_Products_Ship_Date_Validation
    Sleep    8
    Click Element    ${Click_Clear_Filters}
    Sleep    8
    Click Element    ${Cancel_Button_Add_Tab}
    Sleep    10
    Sleep    8
    Click Element    ${Click_Clear_Filters}
    Sleep    8
    Click Element    ${Cancel_Button_Add_Tab}
    Sleep    10
    Input Text    ${SerialNumber_Id_Filter}    ABCK4515
    Sleep    8
    Press Key    ${ProductName_Id_Filter}    \\9
    Sleep    5
    Press Key    ${MaterialItemCategory_Filter}    \\9
    Sleep    5
    Press Key    ${AssemblyNumber_Filter}    \\9
    Sleep    5
    Press Key    ${AssemblyRev}    \\9
    Sleep    5
    Press Key    ${AssemblyHardwareRev}    \\9
    Sleep    5
    Press Key    ${SalesOrderNumber}    \\9
    Sleep    5
    Press Key    ${SalesOrderLineItem}    \\9
    Sleep    8
    Input Text    ${Product_City}    MENLO PARK
    Sleep    5
    Press Key    ${Product_City}    \\9
    Sleep    5
    Input Text    //*[@id='rc-input-state']    California
    Sleep    5
    Press Key    //*[@id='rc-input-state']    \\9
    Sleep    5
    Input Text    //*[@id='rc-input-country']    United States
    Sleep    5
    Press Key    //*[@id='rc-input-country']    \\9
    Sleep    5
    Press Key    //div[@id='rc-custom-datepickerproductRegistrationDate']/div/div[2]/div/input    \\9
    Sleep    5
    Click Element    //div[@id='rc-custom-datepickershipDate']/div/div[2]/div/input
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/div/div/select
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/div/div/select/option[8]
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/div/div/select[2]
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/div/div/select[2]/option[19]
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/table/tbody/tr[4]/td[2]/a
    Sleep    5
    Click Element    ${Click_Column_Tab}
    Sleep    5
    Click Element    ${Click_Product_Name_Column}
    Sleep    5
    Click Element    ${Click_SSRN_IB}
    Sleep    5
    Click Element    ${Click_MaterialCategory_IB}
    Sleep    5
    Click Element    ${Click_AssemblyNumber_IB}
    Sleep    5
    Click Element    ${Click_AssemblyRev_IB}
    Sleep    5
    Click Element    ${Click_AssemblyHardwareRev_IB}
    Sleep    5
    Click Element    ${Click_SalesOrderNumber_IB}
    Sleep    5
    Click Element    ${Click_SalesOrderLineItem_IB}
    Sleep    5
    Sleep    2
    Mouse Down    ${Inner_Vertical_Scroll_Column_Contract}
    Sleep    2
    Mouse Over    ${Inner_Vertical_Scroll_Column_Contract}
    Sleep    2
    Execute Javascript    window.scrollTo(${x_location},${y_location})
    Sleep    2
    Mouse Up    ${Inner_Vertical_Scroll_Column_Contract}
    Sleep    2
    Mouse Over    //div/div/div[1]
    Sleep    2
    Click Element    //div[2]/div[2]/section/div[2]/div[2]
    Sleep    5
    #Click Element    ${Click_City_IB}
    Sleep    5
    Click Element    ${Click_State_IB}
    Sleep    5
    Click Element    ${Click_Country_IB}
    Sleep    5
    Click Element    ${Click_Address_IB}
    Sleep    5
    Click Element    ${Click_InstalledAt_IB}
    Sleep    5
    Click Element    ${Click_Reseller_IB}
    Sleep    5
    Click Element    ${Click_Distributor_IB}
    Sleep    5
    Click Element    ${Click_PRDate_IB}
    Sleep    5
    ${Get_Text_Ship_Date}    Get Text    ${Get_Cell_Value_Ship_Date}
    Sleep    5
    Should Be Equal    ${Get_Text_Ship_Date}    18-AUG-2014

Filter_Products_Warranty_Start_Date_Validation
    Sleep    8
    Click Element    ${Click_Clear_Filters}
    Sleep    8
    Sleep    8
    Click Element    ${Click_Clear_Filters}
    Sleep    8
    Input Text    ${SerialNumber_Id_Filter}    ABCK4515
    Sleep    8
    Press Key    ${ProductName_Id_Filter}    \\9
    Sleep    5
    Press Key    ${MaterialItemCategory_Filter}    \\9
    Sleep    5
    Press Key    ${AssemblyNumber_Filter}    \\9
    Sleep    5
    Press Key    ${AssemblyRev}    \\9
    Sleep    5
    Press Key    ${AssemblyHardwareRev}    \\9
    Sleep    5
    Press Key    ${SalesOrderNumber}    \\9
    Sleep    5
    Press Key    ${SalesOrderLineItem}    \\9
    Sleep    8
    Input Text    ${Product_City}    MENLO PARK
    Sleep    5
    Press Key    ${Product_City}    \\9
    Sleep    5
    Input Text    //*[@id='rc-input-state']    California
    Sleep    5
    Press Key    //*[@id='rc-input-state']    \\9
    Sleep    5
    Input Text    //*[@id='rc-input-country']    United States
    Sleep    5
    Press Key    //*[@id='rc-input-country']    \\9
    Sleep    5
    Press Key    //div[@id='rc-custom-datepickerproductRegistrationDate']/div/div[2]/div/input    \\9
    Sleep    5
    Click Element    //div[@id='rc-custom-datepickershipDate']/div/div[2]/div/input
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/div/div/select
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/div/div/select/option[8]
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/div/div/select[2]
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/div/div/select[2]/option[19]
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/table/tbody/tr[4]/td[2]/a
    Sleep    5
    Click Element    ${Click_Column_Tab}
    Sleep    5
    Click Element    ${Click_Product_Name_Column}
    Sleep    5
    Click Element    ${Click_SSRN_IB}
    Sleep    5
    Click Element    ${Click_MaterialCategory_IB}
    Sleep    5
    Click Element    ${Click_AssemblyNumber_IB}
    Sleep    5
    Click Element    ${Click_AssemblyRev_IB}
    Sleep    5
    Click Element    ${Click_AssemblyHardwareRev_IB}
    Sleep    5
    Click Element    ${Click_SalesOrderNumber_IB}
    Sleep    5
    Click Element    ${Click_SalesOrderLineItem_IB}
    Sleep    5
    Sleep    2
    Mouse Down    ${Inner_Vertical_Scroll_Column_Contract}
    Sleep    2
    Mouse Over    ${Inner_Vertical_Scroll_Column_Contract}
    Sleep    2
    Execute Javascript    window.scrollTo(${x_location},${y_location})
    Sleep    2
    Mouse Up    ${Inner_Vertical_Scroll_Column_Contract}
    Sleep    2
    Mouse Over    //div/div/div[1]
    Sleep    2
    Click Element    //div[2]/div[2]/section/div[2]/div[2]
    Sleep    5
    #Click Element    ${Click_City_IB}
    Sleep    5
    Click Element    ${Click_State_IB}
    Sleep    5
    Click Element    ${Click_Country_IB}
    Sleep    5
    Click Element    ${Click_Address_IB}
    Sleep    5
    Click Element    ${Click_InstalledAt_IB}
    Sleep    5
    Click Element    ${Click_Reseller_IB}
    Sleep    5
    Click Element    ${Click_Distributor_IB}
    Sleep    5
    Click Element    ${Click_PRDate_IB}
    Sleep    5
    ${Get_Text_Ship_Date}    Get Text    ${Get_Cell_Value_Ship_Date}
    Sleep    5
    Should Be Equal    ${Get_Text_Ship_Date}    18-AUG-2014

Filter_Products_Warranty_End_Date_Validation
    Sleep    8
    Click Element    ${Click_Clear_Filters}
    Sleep    8
    Sleep    8
    Click Element    ${Click_Clear_Filters}
    Sleep    8
    Click Element    ${Cancel_Button_Add_Tab}
    Sleep    10
    Input Text    ${SerialNumber_Id_Filter}    ABCK4515
    Sleep    8
    Press Key    ${ProductName_Id_Filter}    \\9
    Sleep    5
    Press Key    ${MaterialItemCategory_Filter}    \\9
    Sleep    5
    Press Key    ${AssemblyNumber_Filter}    \\9
    Sleep    5
    Press Key    ${AssemblyRev}    \\9
    Sleep    5
    Press Key    ${AssemblyHardwareRev}    \\9
    Sleep    5
    Press Key    ${SalesOrderNumber}    \\9
    Sleep    5
    Press Key    ${SalesOrderLineItem}    \\9
    Sleep    8
    Input Text    ${Product_City}    MENLO PARK
    Sleep    5
    Press Key    ${Product_City}    \\9
    Sleep    5
    Input Text    //*[@id='rc-input-state']    California
    Sleep    5
    Press Key    //*[@id='rc-input-state']    \\9
    Sleep    5
    Input Text    //*[@id='rc-input-country']    United States
    Sleep    5
    Press Key    //*[@id='rc-input-country']    \\9
    Sleep    5
    Press Key    //div[@id='rc-custom-datepickerproductRegistrationDate']/div/div[2]/div/input    \\9
    Sleep    5
    Click Element    //div[@id='rc-custom-datepickershipDate']/div/div[2]/div/input
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/div/div/select
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/div/div/select/option[8]
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/div/div/select[2]
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/div/div/select[2]/option[19]
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/table/tbody/tr[4]/td[2]/a
    Sleep    5
    Click Element    ${Click_Column_Tab}
    Sleep    5
    Click Element    ${Click_Product_Name_Column}
    Sleep    5
    Click Element    ${Click_SSRN_IB}
    Sleep    5
    Click Element    ${Click_MaterialCategory_IB}
    Sleep    5
    Click Element    ${Click_AssemblyNumber_IB}
    Sleep    5
    Click Element    ${Click_AssemblyRev_IB}
    Sleep    5
    Click Element    ${Click_AssemblyHardwareRev_IB}
    Sleep    5
    Click Element    ${Click_SalesOrderNumber_IB}
    Sleep    5
    Click Element    ${Click_SalesOrderLineItem_IB}
    Sleep    5
    Sleep    2
    Mouse Down    ${Inner_Vertical_Scroll_Column_Contract}
    Sleep    2
    Mouse Over    ${Inner_Vertical_Scroll_Column_Contract}
    Sleep    2
    Execute Javascript    window.scrollTo(${x_location},${y_location})
    Sleep    2
    Mouse Up    ${Inner_Vertical_Scroll_Column_Contract}
    Sleep    2
    Mouse Over    //div/div/div[1]
    Sleep    2
    Click Element    //div[2]/div[2]/section/div[2]/div[2]
    Sleep    5
    #Click Element    ${Click_City_IB}
    Sleep    5
    Click Element    ${Click_State_IB}
    Sleep    5
    Click Element    ${Click_Country_IB}
    Sleep    5
    Click Element    ${Click_Address_IB}
    Sleep    5
    Click Element    ${Click_InstalledAt_IB}
    Sleep    5
    Click Element    ${Click_Reseller_IB}
    Sleep    5
    Click Element    ${Click_Distributor_IB}
    Sleep    5
    Click Element    ${Click_PRDate_IB}
    Sleep    5
    ${Get_Text_Ship_Date}    Get Text    ${Get_Cell_Value_Ship_Date}
    Sleep    5
    Should Be Equal    ${Get_Text_Ship_Date}    18-AUG-2014

Filter_Products_EOL_Date_Validation
    Sleep    8
    Click Element    ${Click_Clear_Filters}
    Sleep    8
    Sleep    8
    Click Element    ${Click_Clear_Filters}
    Sleep    8
    Input Text    ${SerialNumber_Id_Filter}    ABCK4515
    Sleep    8
    Press Key    ${ProductName_Id_Filter}    \\9
    Sleep    5
    Press Key    ${MaterialItemCategory_Filter}    \\9
    Sleep    5
    Press Key    ${AssemblyNumber_Filter}    \\9
    Sleep    5
    Press Key    ${AssemblyRev}    \\9
    Sleep    5
    Press Key    ${AssemblyHardwareRev}    \\9
    Sleep    5
    Press Key    ${SalesOrderNumber}    \\9
    Sleep    5
    Press Key    ${SalesOrderLineItem}    \\9
    Sleep    8
    Input Text    ${Product_City}    MENLO PARK
    Sleep    5
    Press Key    ${Product_City}    \\9
    Sleep    5
    Input Text    //*[@id='rc-input-state']    California
    Sleep    5
    Press Key    //*[@id='rc-input-state']    \\9
    Sleep    5
    Input Text    //*[@id='rc-input-country']    United States
    Sleep    5
    Press Key    //*[@id='rc-input-country']    \\9
    Sleep    5
    Press Key    //div[@id='rc-custom-datepickerproductRegistrationDate']/div/div[2]/div/input    \\9
    Sleep    5
    Click Element    //div[@id='rc-custom-datepickershipDate']/div/div[2]/div/input
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/div/div/select
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/div/div/select/option[8]
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/div/div/select[2]
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/div/div/select[2]/option[19]
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/table/tbody/tr[4]/td[2]/a
    Sleep    5
    Click Element    ${Click_Column_Tab}
    Sleep    5
    Click Element    ${Click_Product_Name_Column}
    Sleep    5
    Click Element    ${Click_SSRN_IB}
    Sleep    5
    Click Element    ${Click_MaterialCategory_IB}
    Sleep    5
    Click Element    ${Click_AssemblyNumber_IB}
    Sleep    5
    Click Element    ${Click_AssemblyRev_IB}
    Sleep    5
    Click Element    ${Click_AssemblyHardwareRev_IB}
    Sleep    5
    Click Element    ${Click_SalesOrderNumber_IB}
    Sleep    5
    Click Element    ${Click_SalesOrderLineItem_IB}
    Sleep    5
    Sleep    2
    Mouse Down    ${Inner_Vertical_Scroll_Column_Contract}
    Sleep    2
    Mouse Over    ${Inner_Vertical_Scroll_Column_Contract}
    Sleep    2
    Execute Javascript    window.scrollTo(${x_location},${y_location})
    Sleep    2
    Mouse Up    ${Inner_Vertical_Scroll_Column_Contract}
    Sleep    2
    Mouse Over    //div/div/div[1]
    Sleep    2
    Click Element    //div[2]/div[2]/section/div[2]/div[2]
    Sleep    5
    #Click Element    ${Click_City_IB}
    Sleep    5
    Click Element    ${Click_State_IB}
    Sleep    5
    Click Element    ${Click_Country_IB}
    Sleep    5
    Click Element    ${Click_Address_IB}
    Sleep    5
    Click Element    ${Click_InstalledAt_IB}
    Sleep    5
    Click Element    ${Click_Reseller_IB}
    Sleep    5
    Click Element    ${Click_Distributor_IB}
    Sleep    5
    Click Element    ${Click_PRDate_IB}
    Sleep    5
    ${Get_Text_Ship_Date}    Get Text    ${Get_Cell_Value_Ship_Date}
    Sleep    5
    Should Be Equal    ${Get_Text_Ship_Date}    18-AUG-2014

Filter_Products_EOS_Date_Validation
    Sleep    8
    Click Element    ${Click_Clear_Filters}
    Sleep    8
    Click Element    ${Cancel_Button_Add_Tab}
    Sleep    10
    Sleep    8
    Click Element    ${Click_Clear_Filters}
    Sleep    8
    Click Element    ${Cancel_Button_Add_Tab}
    Sleep    10
    Input Text    ${SerialNumber_Id_Filter}    ABCK4515
    Sleep    8
    Press Key    ${ProductName_Id_Filter}    \\9
    Sleep    5
    Press Key    ${MaterialItemCategory_Filter}    \\9
    Sleep    5
    Press Key    ${AssemblyNumber_Filter}    \\9
    Sleep    5
    Press Key    ${AssemblyRev}    \\9
    Sleep    5
    Press Key    ${AssemblyHardwareRev}    \\9
    Sleep    5
    Press Key    ${SalesOrderNumber}    \\9
    Sleep    5
    Press Key    ${SalesOrderLineItem}    \\9
    Sleep    8
    Input Text    ${Product_City}    MENLO PARK
    Sleep    5
    Press Key    ${Product_City}    \\9
    Sleep    5
    Input Text    //*[@id='rc-input-state']    California
    Sleep    5
    Press Key    //*[@id='rc-input-state']    \\9
    Sleep    5
    Input Text    //*[@id='rc-input-country']    United States
    Sleep    5
    Press Key    //*[@id='rc-input-country']    \\9
    Sleep    5
    Press Key    //div[@id='rc-custom-datepickerproductRegistrationDate']/div/div[2]/div/input    \\9
    Sleep    5
    Click Element    //div[@id='rc-custom-datepickershipDate']/div/div[2]/div/input
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/div/div/select
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/div/div/select/option[8]
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/div/div/select[2]
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/div/div/select[2]/option[19]
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/table/tbody/tr[4]/td[2]/a
    Sleep    5
    Click Element    ${Click_Column_Tab}
    Sleep    5
    Click Element    ${Click_Product_Name_Column}
    Sleep    5
    Click Element    ${Click_SSRN_IB}
    Sleep    5
    Click Element    ${Click_MaterialCategory_IB}
    Sleep    5
    Click Element    ${Click_AssemblyNumber_IB}
    Sleep    5
    Click Element    ${Click_AssemblyRev_IB}
    Sleep    5
    Click Element    ${Click_AssemblyHardwareRev_IB}
    Sleep    5
    Click Element    ${Click_SalesOrderNumber_IB}
    Sleep    5
    Click Element    ${Click_SalesOrderLineItem_IB}
    Sleep    5
    Sleep    2
    Mouse Down    ${Inner_Vertical_Scroll_Column_Contract}
    Sleep    2
    Mouse Over    ${Inner_Vertical_Scroll_Column_Contract}
    Sleep    2
    Execute Javascript    window.scrollTo(${x_location},${y_location})
    Sleep    2
    Mouse Up    ${Inner_Vertical_Scroll_Column_Contract}
    Sleep    2
    Mouse Over    //div/div/div[1]
    Sleep    2
    Click Element    //div[2]/div[2]/section/div[2]/div[2]
    Sleep    5
    #Click Element    ${Click_City_IB}
    Sleep    5
    Click Element    ${Click_State_IB}
    Sleep    5
    Click Element    ${Click_Country_IB}
    Sleep    5
    Click Element    ${Click_Address_IB}
    Sleep    5
    Click Element    ${Click_InstalledAt_IB}
    Sleep    5
    Click Element    ${Click_Reseller_IB}
    Sleep    5
    Click Element    ${Click_Distributor_IB}
    Sleep    5
    Click Element    ${Click_PRDate_IB}
    Sleep    5
    ${Get_Text_Ship_Date}    Get Text    ${Get_Cell_Value_Ship_Date}
    Sleep    5
    Should Be Equal    ${Get_Text_Ship_Date}    18-AUG-2014

Detailed_Hierarchy_Products
    Sleep    5
    Click Element    ${Click_Clear_Filters}
    Sleep    5
    Input Text    ${SerialNumber_Id_Filter}    AB2512AA0037
    Sleep    5
    ${Get_Text_SerialNumber}    Get Text    ${Get_Cell_Value_SerialNumber}
    Sleep    5
    Should Be Equal    ${Get_Text_SerialNumber}    AB2512AA0037
    Sleep    5
    Click Element    ${Get_Cell_Value_SerialNumber}
    Sleep    5
    ${Get_Text_Detailed_SerialNumber}    Get Text    ${Get_Cell_Value_Detailed_SerialNumber}
    Sleep    5
    Should Be Equal    ${Get_Text_Detailed_SerialNumber}    AB2512AA0037
    Sleep    5

Account_Selection_Products
    Sleep    5
    Click Element    //div[@id='installbases_tabview_installbase_tabbed_table']/div/section/div/div/div[1]/section/aside/nav/ul/li[1]
    Sleep    5
    Comment    Click Element    ${Click_Clear_Filters}
    Comment    Sleep    5
    Click Element    ${Account_Selection_ID}
    Sleep    8
    Click Element    //label
    Sleep    5

Widget_Product_Distribution_Products_Country_Validation
    Sleep    5
    Click Element    ${Click_Widget_Selector_Cases}
    Sleep    5
    Click Element    ${Click_Add_Product}
    Sleep    8
    Click Element    ${Distribution_Products_Country}
    Sleep    8

Widget_Selection_Validation
    [Template]
    Sleep    5
    Click Element    ${Add_button}
    Sleep    2
    Input Text    ${Add_Custom_Tab_Window}    ABDCE
    Sleep    1
    Click Button    ${Save_Custom_tab_Window}
    Sleep    3
    Sleep    3

Widget_Product_Announced_EOL_Summary_Validation
    Sleep    5
    Click Element    ${ClickToCasesTab}
    Sleep    5
    Click Element    ${Click_Widget_Selector_Cases}
    Sleep    5
    Click Element    ${Click_Add_Product}
    Sleep    8
    Click Element    ${Product_Announced_EOL_Summary}
    Sleep    8

Widget_Product_Registration_Summary_Validation
    Sleep    5
    Click Element    ${ClickToCasesTab}
    Sleep    5
    Click Element    ${Click_Widget_Selector_Cases}
    Sleep    5
    Click Element    ${Click_Add_Product}
    Sleep    8
    Click Element    ${Registration_Summary}
    Sleep    8
